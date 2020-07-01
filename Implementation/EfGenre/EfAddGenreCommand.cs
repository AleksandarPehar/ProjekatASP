using Application.Commands.GenreCommands;
using Application.DataTransfer;
using Application.Exceptions;
using DataAccess;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.EfGenre
{
    public class EfAddGenreCommand : EfBaseCommand, IAddGenreCommand
    {
        public EfAddGenreCommand(ProjekatContext context) : base(context)
        {
        }

        public void Execute(AddGenreDto request)
        {
            if (context.Genres.Any(g => g.GenereName == request.Name))
                throw new AlreadyExistsEx("Genre whit this name already exists");

            var genre = new Genre
            {
                GenereName = request.Name
            };

            context.Genres.Add(genre);
            context.SaveChanges();
        }
    }
}
