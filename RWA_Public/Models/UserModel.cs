using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace RWA_Public.Models
{
    public class UserModel
    {
        [Required]
        public string Email { get; set; }
        [Required]
        
        public string Username { get; set; }
        [Required]
        public string Address { get; set; }
        [Required]
        [Display(Name = "Phone number")]
        public string PhoneNumber { get; set; }
        [Required]
        [DataType(DataType.Password)] 
        public string Password { get; set; }
        [Required(ErrorMessage = "Please enter your password again")]
        [Compare("Password", ErrorMessage = "Passwords don't match")]
        [DataType(DataType.Password)]
        public string ReType { get; set; }

        [ValidateCheckBox(ErrorMessage = "Please accept terms and conditions")]
        public bool TermsAccepted { get; set; }
        public class ValidateCheckBox : RequiredAttribute
        {
            public override bool IsValid(object value)
            {
                return (bool)value;
            }
        }

    }
}