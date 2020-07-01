using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class UserSearch
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int RoleId { get; set; }

        public bool Isdeleted { get; set; }
        public int PerPage { get; set; } = 5;
        public int PageNumber { get; set; } = 1;
    }
}
