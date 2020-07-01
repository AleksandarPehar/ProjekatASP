using Application.DataTransfer;
using Application.Helper;
using Application.Querys;
using Application.Searches;
using DataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.EfGame
{
    public class EfGetGamesCommand : EfBaseCommand, IGetGamesQuery
    {
        public EfGetGamesCommand(ProjekatContext context) : base(context) { }

        public PageResponse<GameDto> Execute(GameSearch search)
        {
            var query = context.Games.Include(gg => gg.Game_Genre)
                .ThenInclude(g => g.Genre)
                .Include(gc => gc.Game_Console)
                .ThenInclude(c => c.Console)
                .AsQueryable();

            if (search.Title != null)
            {
                var name = search.Title.ToLower();
                query = query.Where(g => g.Title.ToLower().Contains(name));
            }

            if (search.GenreId != null)
            {
                query = query.Where(x => x.Game_Genre.Any(gg => gg.Genre.Id == search.GenreId));
            }
            if (search.ConsoleId != null)
            {
                query = query.Where(x => x.Game_Console.Any(gc => gc.Console.Id == search.ConsoleId));
            }

            query = query.Where(y => y.IsDeleted == false);

            var totalCount = query.Count();

            query = query.Skip((search.PageNumber - 1) * search.PerPage)
                .Take(search.PerPage);

            var pagesCount = (int)Math.Ceiling((double)totalCount / search.PerPage);

            var result = new PageResponse<GameDto>
            {
                CurrentPage = search.PageNumber,
                PageCount = pagesCount,
                TotalCount = totalCount,
                Data = query.Select(s => new GameDto
                {
                    Id = s.Id,
                    Title = s.Title,
                    ReleseDate = s.ReleseDate,
                    Picture = s.Picture,
                    Company = s.Company,

                    Genres = s.Game_Genre.Select(gn => new GenreDto
                    {
                        Id = gn.Id,
                        Name = gn.Genre.GenereName
                    }).ToList(),

                    Consoles = s.Game_Console.Select(cn => new ConsoleDto
                    {
                        Id = cn.Id,
                        Name = cn.Console.ConsoleName
                    }).ToList()

                }).ToList()
            };

            return result;
        }
    }
}
