using Application.DataTransfer;
using Application.Querys;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.EfRent
{
    public class EfGetRentsCommand : EfBaseCommand, IGetRentQuery
    {
        public EfGetRentsCommand(ProjekatContext context) : base(context) { }

        public IEnumerable<RentDto> Execute(RentDto request)
        {
            var query = context.Rent.AsQueryable();

            if (request.UserId != null)
            {
                var user = request.UserId;
                query = query.Where(r => r.UserId == request.UserId);
            }

            if (request.GameId != null)
            {
                var game = request.GameId;
                query = query.Where(r => r.GameId == request.GameId);
            }

            query = query.Where(u => u.IsDeleted == false);

            return query.Select(q => new RentDto
            {
                Id = q.Id,
                GameId = q.GameId,
                UserId = q.UserId
            }).ToList();
        }
    }
}
