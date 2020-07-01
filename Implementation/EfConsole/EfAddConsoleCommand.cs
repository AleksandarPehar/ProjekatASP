using Application.Commands.ConsoleCommands;
using Application.DataTransfer;
using Application.Exceptions;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.EfConsole
{
    public class EfAddConsoleCommand : EfBaseCommand, IAddConsoleCommand
    {
        public EfAddConsoleCommand(ProjekatContext context) : base(context) { }

        public void Execute(AddConsoleDto request)
        {
            if (context.Consoles.Any(c => c.ConsoleName == request.Name))
                throw new AlreadyExistsEx("Company with this name already exists");

            var console = new Domain.Console
            {
                ConsoleName = request.Name
            };

            context.Consoles.Add(console);
            context.SaveChanges();
        }
    }
}
