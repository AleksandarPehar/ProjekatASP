using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Rent : BaseEntity
    {
        public int GameId { get; set; }
        public int UserId { get; set; }

        public Game Game { get; set; }
        public User User { get; set; }
    }
}
