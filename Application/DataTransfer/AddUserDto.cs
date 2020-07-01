using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Application.DataTransfer
{
    public class AddUserDto
    {
        [MaxLength(20, ErrorMessage = "First name is too long")]
        [MinLength(3, ErrorMessage = "First name is too short")]
        public string FirstName { get; set; }

        [MaxLength(20, ErrorMessage = "Last name is too long")]
        [MinLength(3, ErrorMessage = "Last name is too short")]
        public string LastName { get; set; }

        public string Email { get; set; }
        [MinLength(6, ErrorMessage = "Password is too short")]
        public string Password { get; set; }
        [MinLength(6, ErrorMessage = "Password is too short")]
        public int RoleId { get; set; }
    }
}
