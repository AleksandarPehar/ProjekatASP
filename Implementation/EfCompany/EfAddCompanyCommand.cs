using Application.Commands.CompanyCommands;
using Application.DataTransfer;
using Application.Exceptions;
using DataAccess;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.EfCompany
{
    public class EfAddCompanyCommand : EfBaseCommand, IAddCompanyCommand
    {
        public EfAddCompanyCommand(ProjekatContext context) : base(context) { }

        public void Execute(AddCompanyDto request)
        {
            if (context.Companies.Any(c => c.CompanyName == request.Name))
                throw new AlreadyExistsEx("Company with this name already exists");

            var company = new Company
            {
                CompanyName = request.Name
            };

            context.Companies.Add(company);
            context.SaveChanges();
        }
    }
}
