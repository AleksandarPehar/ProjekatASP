using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Game : BaseEntity
    {
        public string Title { get; set; }
        public DateTime ReleseDate { get; set; }
        public string Picture { get; set; }

        public Company Company { get; set; }

        public ICollection<Game_Genre> Game_Genre { get; set; }
        public ICollection<Game_Console> Game_Console { get; set; }
    }
}
