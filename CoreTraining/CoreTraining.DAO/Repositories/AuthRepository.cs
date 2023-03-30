using CoreTraining.DAO.IRepositories;
using CoreTraining.Entities.Data;
using CoreTraining.Entities.DTO;
using Microsoft.AspNetCore.Identity;

namespace CoreTraining.DAO.Repositories
{
    public class AuthRepository: IAuthRepository
    {
        private readonly CoreTrainingContext _context;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        public AuthRepository(CoreTrainingContext context, UserManager<ApplicationUser> userManager,
                                      SignInManager<ApplicationUser> signInManager)
        {
            _context = context;
            _userManager = userManager;
            _signInManager = signInManager;
        }

        public async Task<SignInResult> Login(string email, string password)
        {
            ResponseModel response = new ResponseModel();

            var result = await _signInManager.PasswordSignInAsync(email, password, false, lockoutOnFailure: false);

            return result;
        }

        public ApplicationUser GetByEmail(string email)
        {
            var user = _userManager.Users.FirstOrDefault(x => x.UserName == email);

            return user;
        }

        public ApplicationUser GetById(string id)
        {
            var user = _userManager.Users.FirstOrDefault(x => x.Id == id);

            return user;
        }

        public async Task<String> GenerateToken(ApplicationUser applicationUser)
        {
            var token = await _userManager.GeneratePasswordResetTokenAsync(applicationUser);

            return token;
        }

        public Task<IdentityResult> ResetPassword(ApplicationUser applicationUser, string token, string currentPassword)
        {
            Task<IdentityResult> result = _userManager.ResetPasswordAsync(applicationUser, token, currentPassword);

            return result;
        }

        public Task<IdentityResult> ChangePassword(ApplicationUser applicationUser, string currentPassword, string newPassword)
        {
            Task<IdentityResult> result = _userManager.ChangePasswordAsync(applicationUser, currentPassword, newPassword);

            return result;
        }

        public async Task<IdentityResult> Register(ApplicationUser user, string password)
        {
            var result = await _userManager.CreateAsync(user, password);

            return result;
        }
        public void Logout()
        {
            _signInManager.SignOutAsync();
        }
    }
}
