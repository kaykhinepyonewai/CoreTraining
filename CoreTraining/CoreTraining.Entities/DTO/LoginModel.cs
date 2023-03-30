using System.ComponentModel.DataAnnotations;

namespace CoreTraining.Entities.DTO
{
    public class LoginViewModel
    {
        [Required]
        public string Email { get; set; } = "";
        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; } = "";

        public string Name { get; set; } = "";

        public string ProfileName { get; set; }

        [Display(Name = "Remember Me")]
        public bool RememberMe { get; set; }
    }
}
