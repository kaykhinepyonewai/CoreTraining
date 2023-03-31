using CoreTraining.Entities.DTO;
using Microsoft.AspNetCore.Identity;

namespace CoreTraining.Services.IServices
{
    public interface IUserService 
    {
        UserListViewModel GetAllUser();
        Task<IdentityResult> Create(ApplicationUser user, string password);
        UserViewModel Get(string id);
        UserViewModel GetToken(string id);
        int CountEditEmail(UserEditViewModel model);
        bool Update(UserEditViewModel model);
        ApplicationUser GetUpdate(string email);
        public bool UpdateToken(UserViewModel model);
        bool Delete(string id);
    }
}
