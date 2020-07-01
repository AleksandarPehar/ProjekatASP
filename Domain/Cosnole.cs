using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Console : BaseEntity
    {
        public string ConsoleName { get; set; }
        public ICollection<Game_Console> Game_Console { get; set; }
    }
}
