using Application.Commands.UserCommands;
using Application.DataTransfer;
using Application.Exceptions;
using Application.Helper;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.EfUser
{
    public class EfLogUserCommand : EfBaseCommand, ILogInUserCommand
    {
        public EfLogUserCommand(ProjekatContext context) : base(context)
        {
        }

        public Logged Execute(LogInDto request)
        {
            var user = context.Users
                 .Where(u => u.Email == request.Email)
                 .Where(u => u.Password == request.Password)
                 .FirstOrDefault();

            if (user == null)
            {
                throw new NotFoundEx();
            }
            return new Logged
            {
                Email = user.Email,
                FirstName = user.FirstName,
                LastName = user.LastName,
                RoleName = user.Role.RoleName
            };
        }
    }
}
