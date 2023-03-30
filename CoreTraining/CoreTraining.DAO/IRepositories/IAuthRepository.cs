using CoreTraining.Entities.DTO;
using Microsoft.AspNetCore.Identity;

namespace CoreTraining.DAO.IRepositories
{
    public interface IAuthRepository
    {
        Task<SignInResult> Login(string email, string password);

        ApplicationUser GetByEmail(string email);

        ApplicationUser GetById(string id);

        Task<string> GenerateToken(ApplicationUser applicationUser);

        Task<IdentityResult> ResetPassword(ApplicationUser applicationUser, string token, string currentPassword);

        Task<IdentityResult> ChangePassword(ApplicationUser applicationUser, string currentPassword, string newPassword);


        Task<IdentityResult> Register(ApplicationUser user, string password);

        void Logout();
    }
}
