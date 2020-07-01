using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Application.DataTransfer
{
    public class AddGameDto
    {
        [Required]
        [MaxLength(30, ErrorMessage = "Game name must not be more the 30 characters long")]
        public string Title { get; set; }
        [Required]
        public DateTime ReleseDate { get; set; }
        public string Picture { get; set; }
        [Required]
        public int CompanyId { get; set; }

        [Required]
        public List<int> GenreIds { get; set; }
        [Required]
        public List<int> ConsoleIds { get; set; }
    }
}
