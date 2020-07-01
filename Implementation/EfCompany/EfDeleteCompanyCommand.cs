using Application.Commands.CompanyCommands;
using Application.Exceptions;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.EfCompany
{
    public class EfDeleteCompanyCommand : EfBaseCommand, IDeleteCompanyCommand
    {
        public EfDeleteCompanyCommand(ProjekatContext context) : base(context) { }

        public void Execute(int reqest)
        {
            var company = context.Companies.Find(reqest);

            if (company == null)
                throw new NotFoundEx();

            company.IsDeleted = true;
            company.ModifiedAt = DateTime.Now;
            context.SaveChanges();
        }
    }
}
