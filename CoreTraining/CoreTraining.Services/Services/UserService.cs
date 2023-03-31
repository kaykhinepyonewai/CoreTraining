using AutoMapper;
using CoreTraining.DAO.IRepositories;
using CoreTraining.Entities.Data;
using CoreTraining.Entities.DTO;
using CoreTraining.Services.IServices;
using Microsoft.AspNetCore.Identity;

namespace CoreTraining.Services.Services
{
    public class UserService : IUserService
    {
        private readonly IUserRepository _userRepository;
        private readonly IMapper _mapper;
        public UserService(IUserRepository userRepository, IMapper mapper)
        {
            _userRepository = userRepository;
            _mapper = mapper;
        }

        public UserListViewModel GetAllUser()
        {
            UserListViewModel model = _userRepository.GetAllUser();
            return model;
        }

        public Task<IdentityResult> Create(ApplicationUser user,string password)
        {
            Task<IdentityResult> result = _userRepository.Create(user, password);
            return result;
        }

        public UserViewModel Get(string id)
        {
            UserViewModel model = _userRepository.Get(id);
            return model;
        }

        public ApplicationUser GetUpdate(string email)
        {
            ApplicationUser user = _userRepository.GetUpdate(email);
            return user;
        }

        public UserViewModel GetToken(string id)
        {
            UserViewModel model = _userRepository.GetToken(id);
            return model;
        }

        public bool Update(UserEditViewModel model)
        {
            bool success = _userRepository.Update(_mapper.Map<User>(model));
            return success;
        }

        public bool UpdateToken(UserViewModel model)
        {
            bool success = _userRepository.UpdateToken(_mapper.Map<User>(model));
            return success;
        }

        public int CountEditEmail(UserEditViewModel model)
        {
            int countEditEmail = _userRepository.CountEditEmail(model);
            return countEditEmail;
        }

        public bool Delete(string id)
        {
            bool success = _userRepository.Delete(id);
            return success;
        }
    }
}
