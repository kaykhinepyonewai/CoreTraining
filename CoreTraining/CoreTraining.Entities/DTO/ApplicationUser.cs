using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations.Schema;

namespace CoreTraining.Entities.DTO
{
    [Table("User")]
    public class ApplicationUser : IdentityUser
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int Role { get; set; }
        public string Address { get; set; }
        public DateTime? DOB { get; set; }

        public string PhoneNumber { get; set; }
        public bool IsActive { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedDate { get; set; }
        public string CreatedUserId { get; set; }

        public string ProfileName { get; set; }

        public DateTime? TokenDate { get; set; }
    }
}
