using AutoMapper;
using CoreTraining.DAO.IRepositories;
using CoreTraining.Entities.DTO;
using CoreTraining.Services.IServices;

namespace CoreTraining.Services.Services
{
    public class RoleService : IRoleService
    {
        private readonly IRoleRepository _roleRepository;
        private readonly IMapper _mapper;

        public RoleService(IRoleRepository roleRepository, IMapper mapper)
        {
            _roleRepository = roleRepository;
            _mapper = mapper;
        }

        public List<RoleViewModel> GetAll()
        {
            List<RoleViewModel> lst = _roleRepository.GetAll();
            return lst;
        }
    }
}
