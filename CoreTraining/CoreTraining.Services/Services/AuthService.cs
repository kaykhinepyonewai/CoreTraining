using AutoMapper;
using CoreTraining.DAO.IRepositories;
using CoreTraining.Entities.DTO;
using CoreTraining.Services.IServices;
using Microsoft.AspNetCore.Identity;

namespace CoreTraining.Services.Services
{
    public class AuthService : IAuthService
    {
        private readonly IAuthRepository _authRepository;
        private readonly IMapper _mapper;
        public AuthService(IAuthRepository authRepository, IMapper mapper)
        {
            _authRepository = authRepository;
            _mapper = mapper;
        }
        public Task<SignInResult> Login(string email, string password)
        {
            Task<SignInResult> result = _authRepository.Login(email, password);
            return result;
        }

        public ApplicationUser GetByEmail(string email)
        {
            ApplicationUser user = _authRepository.GetByEmail(email);
            return user;
        }

        public Task<IdentityResult> ChangePassword(ApplicationUser user, string currentPassword, string newPassword)
        {
            Task<IdentityResult> model = _authRepository.ChangePassword(user, currentPassword, newPassword);
            return model;
        }


        public ApplicationUser GetById(string id)

        {
            ApplicationUser user = _authRepository.GetById(id);
            return user;
        }

        public Task<String> GenerateToken(ApplicationUser resetUser)
        {
            var model = _authRepository.GenerateToken(resetUser);
            return model;
        }

        public Task<IdentityResult> ResetPassword(ApplicationUser resetUser, string token, string newPassword)
        {
            Task<IdentityResult> model = _authRepository.ResetPassword(resetUser, token, newPassword);
            return model;
        }


        public Task<IdentityResult> Register(ApplicationUser user, string password)
        {
            Task<IdentityResult> result = _authRepository.Register(user, password);
            return result;
        }

        public void Logout()
        {
            _authRepository.Logout();
        }
    }
}
