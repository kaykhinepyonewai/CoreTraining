using CoreTraining.Entities.DTO;
using Microsoft.AspNetCore.Identity;

namespace CoreTraining.Services.IServices
{
    public interface IAuthService
    {
        Task<SignInResult> Login(string email, string password);

        ApplicationUser GetByEmail(string email);

        ApplicationUser GetById(string id);

        Task<String> GenerateToken(ApplicationUser resetUser);

        Task<IdentityResult> ChangePassword(ApplicationUser user, string currentPassword, string newPassword);

        Task<IdentityResult> ResetPassword(ApplicationUser resetUser, string token, string newPassword);
        Task<IdentityResult> Register(ApplicationUser user, string password);

        void Logout();
    }
}
