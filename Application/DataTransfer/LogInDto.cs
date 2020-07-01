using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Application.DataTransfer
{
    public class LogInDto
    {
        [Required]
        [EmailAddress(ErrorMessage = "Email not valid")]
        public string Email { get; set; }

        [Required]
        [MinLength(6, ErrorMessage = "Password is too short")]
        public string Password { get; set; }
    }
}
