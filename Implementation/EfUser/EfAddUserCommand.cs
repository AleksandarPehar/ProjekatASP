using Application.Commands.UserCommands;
using Application.DataTransfer;
using Application.Exceptions;
using Application.Interfaces;
using DataAccess;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.EfUser
{
    public class EfAddUserCommand : EfBaseCommand, IAddUserCommand
    {
        private readonly IEmailer emailer;

        public EfAddUserCommand(ProjekatContext context) : base(context)
        {
        }

        public void Execute(AddUserDto reqest)
        {
            if (context.Users.Any(u => u.Email == reqest.Email))
                throw new AlreadyExistsEx("User with this email already exists");

            if (!context.Roles.Any(r => r.Id == reqest.RoleId))
                throw new NotFoundEx();

            var user = new User
            {
                FirstName = reqest.FirstName,
                LastName = reqest.LastName,
                Email = reqest.Email,
                Password = reqest.Password,
                RoleId = reqest.RoleId
            };

            context.Users.Add(user);
            context.SaveChanges();

            emailer.Subject = "Server Message";
            emailer.Body = "A User has been created and added to the database";
            emailer.ToEmail = "acapehar@gmail.com";
            emailer.Send();
        }
    }
}
