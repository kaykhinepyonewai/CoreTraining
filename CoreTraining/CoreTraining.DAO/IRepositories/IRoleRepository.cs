using CoreTraining.Entities.DTO;

namespace CoreTraining.DAO.IRepositories
{
    public interface IRoleRepository
    {
        List<RoleViewModel> GetAll();
    }
}
