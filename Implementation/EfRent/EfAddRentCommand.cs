using Application.Commands.RentCommands;
using Application.DataTransfer;
using Application.Exceptions;
using DataAccess;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.EfRent
{
    public class EfAddRentCommand : EfBaseCommand, IAddRentCommand
    {
        public EfAddRentCommand(ProjekatContext context) : base(context)
        {
        }

        public void Execute(RentDto request)
        {
            if (context.Rent.Any(r => r.GameId == request.GameId && r.UserId == request.UserId))
                throw new AlreadyExistsEx("This user already rented this game");

            if (!context.Games.Any(g => g.Id == request.GameId))
                throw new NotFoundEx();
            if (!context.Users.Any(u => u.Id == request.UserId))
                throw new NotFoundEx();

            var rent = new Rent
            {
                UserId = request.UserId,
                GameId = request.GameId
            };

            context.Rent.Add(rent);
            context.SaveChanges();
        }
    }
}
