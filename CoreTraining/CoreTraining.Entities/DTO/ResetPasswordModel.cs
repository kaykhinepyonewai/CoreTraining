using System.ComponentModel.DataAnnotations;

namespace CoreTraining.Entities.DTO
{
    public class ResetPasswordViewModel
    {
        [Required]
        [DataType(DataType.Password)]
        public string NewPassword { get; set; } = "";

        [DataType(DataType.Password)]
        [Display(Name = "ConfirmPassword")]
        [Compare("NewPassword", ErrorMessage = "NewPassword and confirmation password not match.")]
        public string ConfirmPassword { get; set; } = "";

        public string Token { get; set; }
    }
}
