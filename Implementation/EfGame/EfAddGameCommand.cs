using Application.Commands.GameCommands;
using Application.DataTransfer;
using Application.Exceptions;
using DataAccess;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.EfGame
{
    public class EfAddGameCommand : EfBaseCommand, IAddGameCommand
    {
        public EfAddGameCommand(ProjekatContext context) : base(context) { }

        public void Execute(AddGameDto request)
        {
            if (context.Games.Any(g => g.Title == request.Title))
                throw new AlreadyExistsEx("Game with this title already exists");

            if (!context.Companies.Any(c => c.Id == request.CompanyId))
                throw new NotFoundEx();

            foreach (var genreId in request.GenreIds)
            {
                var genre = context.Genres.Find(genreId);
                if (genre == null)
                    throw new NotFoundEx();
            }

            foreach (var consoleId in request.ConsoleIds)
            {
                var console = context.Consoles.Find(consoleId);
                if (console == null)
                    throw new NotFoundEx();
            }

            var game = new Game
            {
                Title = request.Title,
                ReleseDate = request.ReleseDate,
                Picture = request.Picture,
                Company = context.Companies.Find(request.CompanyId)
            };

            foreach (var genreId in request.GenreIds)
            {
                context.Game_Genres.Add(new Game_Genre
                {
                    Game = game,
                    Genre = context.Genres.Find(genreId)
                });
            }
            foreach (var consoleId in request.ConsoleIds)
            {
                context.Game_Consoles.Add(new Game_Console
                {
                    Game = game,
                    Console = context.Consoles.Find(consoleId)
                });
            }

            context.SaveChanges();

        }
    }
}
