using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class GameDto
    {
        public GameDto()
        {
            Genres = new List<GenreDto>();
            Consoles = new List<ConsoleDto>();
        }
        public int Id { get; set; }
        public string Title { get; set; }
        public DateTime ReleseDate { get; set; }
        public string Picture { get; set; }
        public int CompanyId { get; set; }
        public Company Company { get; set; }

        public List<GenreDto> Genres { get; set; }
        public List<ConsoleDto> Consoles { get; set; }
    }
}
