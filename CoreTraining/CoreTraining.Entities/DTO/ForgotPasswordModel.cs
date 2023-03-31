using System.ComponentModel.DataAnnotations;

namespace CoreTraining.Entities.DTO
{
    public class ForgotPasswordViewModel
    {
        [Required, EmailAddress, Display(Name = "Registed email Address")]
        public string Email { get; set; } = "";

        public bool EmailSent { get; set; } = false;

		public ResponseModel? ResponseModel { get; set; }

	}
}
