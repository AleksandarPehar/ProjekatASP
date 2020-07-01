using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Application.DataTransfer
{
    public class AddCompanyDto
    {
        [Required]
        [MaxLength(30, ErrorMessage = "Company name must not be more the 30 characters long")]
        public string Name { get; set; }
    }
}
