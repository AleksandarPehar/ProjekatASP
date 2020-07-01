using Application.Commands.GameCommands;
using Application.DataTransfer;
using Application.Exceptions;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.EfGame
{
    public class EfEditGameCommand : EfBaseCommand, IEditGameCommand
    {
        public EfEditGameCommand(ProjekatContext context) : base(context) { }

        public void Execute(EditGameDto request)
        {
            var game = context.Games.Find(request.Id);

            if (game == null)
                throw new NotFoundEx();

            if (game.Title != null)
                game.Title = request.Title;
            else
                throw new NotFoundEx();

            if (game.Picture != null)
                game.Picture = request.Picture;
            else
                throw new NotFoundEx();

            if (game.Picture != null)
                game.Picture = request.Picture;
            else
                throw new NotFoundEx();


        }
    }
}
