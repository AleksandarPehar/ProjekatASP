using Application.Commands.GenreCommands;
using Application.Exceptions;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.EfGenre
{
    public class EfDeleteGenreCommand : EfBaseCommand, IDeleteGenreCommand
    {
        public EfDeleteGenreCommand(ProjekatContext context) : base(context) { }

        public void Execute(int reqest)
        {
            var genre = context.Genres.Find(reqest);

            if (genre == null)
                throw new NotFoundEx();

            genre.IsDeleted = true;
            genre.ModifiedAt = DateTime.Now;
            context.SaveChanges();
        }
    }
}
