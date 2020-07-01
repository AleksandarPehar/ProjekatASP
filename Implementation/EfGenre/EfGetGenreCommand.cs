using Application.DataTransfer;
using Application.Exceptions;
using Application.Querys;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.EfGenre
{
    public class EfGetgenresCommand : EfBaseCommand, IGetGenresQuery
    {
        public EfGetgenresCommand(ProjekatContext context) : base(context) { }

        public IEnumerable<GenreDto> Execute(GenreDto request)
        {
            var query = context.Genres.AsQueryable();

            if (request.Name != null)
            {
                var name = request.Name.ToLower();
                query = query.Where(g => g.GenereName.ToLower().Contains(name));
            }
            else
                throw new NotFoundEx();

            query = query.Where(g => g.IsDeleted == false);


            return query.Select(q => new GenreDto
            {
                Id = q.Id,
                Name = q.GenereName
            }).ToList();
        }
    }
}
