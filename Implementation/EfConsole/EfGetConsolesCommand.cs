using Application.DataTransfer;
using Application.Exceptions;
using Application.Querys;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.EfConsole
{
    public class EfGetConsolesCommand : EfBaseCommand, IGetConsolesQuery
    {
        public EfGetConsolesCommand(ProjekatContext context) : base(context) { }

        public IEnumerable<ConsoleDto> Execute(ConsoleDto request)
        {
            var query = context.Consoles.AsQueryable();

            if (request.Name != null)
            {
                var name = request.Name.ToLower();
                query = query.Where(g => g.ConsoleName.ToLower().Contains(name));
            }
            else
                throw new NotFoundEx();

            query = query.Where(g => g.IsDeleted == false);


            return query.Select(q => new ConsoleDto
            {
                Id = q.Id,
                Name = q.ConsoleName
            }).ToList();
        }
    }
}
