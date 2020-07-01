using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Game_Console : BaseEntity
    {
        public Game Game { get; set; }
        public Console Console { get; set; }
    }
}
