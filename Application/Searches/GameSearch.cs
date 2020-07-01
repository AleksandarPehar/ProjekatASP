using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class GameSearch
    {
        public string Title { get; set; }
        public int? GenreId { get; set; }
        public int? ConsoleId { get; set; }
        public int? CompanyId { get; set; }

        public bool IsDeleted { get; set; }
        public int PerPage { get; set; } = 5;
        public int PageNumber { get; set; } = 1;
    }
}
