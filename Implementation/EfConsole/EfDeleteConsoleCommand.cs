using Application.Commands.ConsoleCommands;
using Application.Exceptions;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.EfConsole
{
    public class EfDeleteConsolecommand : EfBaseCommand, IDeleteConsoleCommand
    {
        public EfDeleteConsolecommand(ProjekatContext context) : base(context) { }

        public void Execute(int reqest)
        {
            var console = context.Consoles
                .Find(reqest);

            if (console == null)
                throw new NotFoundEx();

            console.IsDeleted = true;
            console.ModifiedAt = DateTime.Now;
            context.SaveChanges();
        }
    }
}
