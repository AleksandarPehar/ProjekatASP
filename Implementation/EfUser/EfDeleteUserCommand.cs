using Application.Commands.UserCommands;
using Application.Exceptions;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.EfUser
{
    public class EfDeleteUserComand : EfBaseCommand, IDeleteUserCommand
    {
        public EfDeleteUserComand(ProjekatContext context) : base(context) { }

        public void Execute(int reqest)
        {
            var user = context.Users
                .Find(reqest);

            if (user == null)
                throw new NotFoundEx();

            user.IsDeleted = true;
            user.ModifiedAt = DateTime.Now;
            context.SaveChanges();
        }
    }
}
