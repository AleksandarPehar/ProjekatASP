using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Game_Genre : BaseEntity
    {
        public Game Game { get; set; }
        public Genre Genre { get; set; }
    }
}
