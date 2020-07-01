using Application.DataTransfer;
using Application.Exceptions;
using Application.Querys;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.EfCompany
{
    public class EfGetCompaniesCommand : EfBaseCommand, IGetCompaniesQuery
    {
        public EfGetCompaniesCommand(ProjekatContext context) : base(context) { }

        public IEnumerable<CompanyDto> Execute(CompanyDto request)
        {
            var query = context.Companies.AsQueryable();

            if (request.Name != null)
            {
                var name = request.Name.ToLower();
                query = query.Where(g => g.CompanyName.ToLower().Contains(name));
            }
            else
                throw new NotFoundEx();

            query = query.Where(g => g.IsDeleted == false);


            return query.Select(q => new CompanyDto
            {
                Id = q.Id,
                Name = q.CompanyName
            }).ToList();
        }
    }
}
