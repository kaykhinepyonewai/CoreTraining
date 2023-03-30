using CoreTraining.Entities.Data;
using CoreTraining.Entities.DTO;
using Microsoft.AspNetCore.Identity;

namespace CoreTraining.DAO.IRepositories
{
    public interface IUserRepository
    {
        UserListViewModel GetAllUser();
        Task<IdentityResult> Create(ApplicationUser user, string password);

        UserViewModel Get(string id);

        int CountEditEmail(UserEditViewModel model);
        public bool Update(User obj);

        UserViewModel GetToken(string id);

        ApplicationUser GetUpdate(string email);
        bool UpdateToken(User obj);
        bool Delete(string id);
    }
}
