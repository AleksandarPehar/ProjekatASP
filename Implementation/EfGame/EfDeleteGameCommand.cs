using Application.Commands.GameCommands;
using Application.Exceptions;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.EfGame
{
    public class EfDeleteGameCommand : EfBaseCommand, IDeleteGameCommand
    {
        public EfDeleteGameCommand(ProjekatContext context) : base(context) { }

        public void Execute(int reqest)
        {
            var game = context.Games
                .Find(reqest);

            if (game == null)
                throw new NotFoundEx();

            game.IsDeleted = true;
            game.ModifiedAt = DateTime.Now;
            context.SaveChanges();
        }
    }
}
