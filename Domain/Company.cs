using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Company : BaseEntity
    {
        public string CompanyName { get; set; }

        public ICollection<Game> Game { get; set; }
    }
}
