using Application.Commands.UserCommands;
using Application.DataTransfer;
using Application.Exceptions;
using Application.Searches;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.EfUser
{
    public class EfEditUserCommand : EfBaseCommand, IEditUserCommand
    {
        public EfEditUserCommand(ProjekatContext context) : base(context) { }

        public void Execute(EditUserDto request)
        {
            var user = context.Users.Find(request.Id);
            if (user.FirstName != null)
                user.FirstName = request.FirstName;
            else
                throw new NotFoundEx();

            if (user.LastName != null)
                user.LastName = request.LastName;
            else
                throw new NotFoundEx();

            if (user.Email != null)
                user.Email = request.Email;
            else
                throw new NotFoundEx();

            if (user.Password != null)
                user.Password = request.Password;
            else
                throw new NotFoundEx();

            if (user.RoleId != 0)
            {
                if (context.Roles.Any(r => r.Id == request.RoleId))
                    user.RoleId = request.RoleId;
                else
                    throw new NotFoundEx();
            }
            else
                throw new NotFoundEx();

            if (user.IsDeleted != request.IsDeleted)
            {
                user.IsDeleted = request.IsDeleted;
            }

            user.ModifiedAt = DateTime.Now;
            context.SaveChanges();
        }
    }
}
