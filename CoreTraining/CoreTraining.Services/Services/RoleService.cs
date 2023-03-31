using AutoMapper;
using CoreTraining.DAO.IRepositories;
using CoreTraining.Entities.DTO;
using CoreTraining.Services.IServices;

namespace CoreTraining.Services.Services
{
    public class RoleService : IRoleService
    {
        private readonly IRoleRepository _roleRepository;

        public RoleService(IRoleRepository roleRepository)
        {
            _roleRepository = roleRepository;
        }
        public List<RoleViewModel> GetAll()
        {
            List<RoleViewModel> lst = _roleRepository.GetAll();
            return lst;
        }
    }
}
