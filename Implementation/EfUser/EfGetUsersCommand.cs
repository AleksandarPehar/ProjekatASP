using Application.DataTransfer;
using Application.Querys;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.EfUser
{
    public class EfGetUsersCommand : EfBaseCommand, IGetUsersQuery
    {
        public EfGetUsersCommand(ProjekatContext context) : base(context) { }

        public IEnumerable<UserDto> Execute(UserDto search)
        {
            var query = context.Users.AsQueryable();

            if (search.FirstName != null)
            {
                var firstname = search.FirstName.ToLower();
                query = query.Where(u => u.FirstName.ToLower().Contains(firstname));
            }

            if (search.LastName != null)
            {
                var lastname = search.LastName.ToLower();
                query = query.Where(u => u.LastName.ToLower().Contains(lastname));
            }

            query = query.Where(u => u.IsDeleted == false);

            return query.Select(q => new UserDto
            {
                Id = q.Id,
                FirstName = q.FirstName,
                LastName = q.LastName,
                Email = q.Email,
                RoleId = q.RoleId
            }).ToList();
        }


    }
}
