using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Genre : BaseEntity
    {
        public string GenereName { get; set; }

        public ICollection<Game_Genre> Game_Genre { get; set; }
    }
}
