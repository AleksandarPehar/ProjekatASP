using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Application.DataTransfer
{
    public class AddGenreDto
    {
        [Required]
        [MaxLength(30, ErrorMessage = "Genre name must not be more the 30 characters long")]
        public string Name { get; set; }
    }
}
