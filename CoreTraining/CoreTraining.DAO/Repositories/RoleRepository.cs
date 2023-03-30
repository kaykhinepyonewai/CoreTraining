using CoreTraining.DAO.IRepositories;
using CoreTraining.Entities.Data;
using CoreTraining.Entities.DTO;
using System.Security.Cryptography;

namespace CoreTraining.DAO.Repositories
{
    public class RoleRepository : IRoleRepository
    {
        private readonly CoreTrainingContext _context;
        public RoleRepository(CoreTrainingContext context)
        {
            _context = context;
        }

        public List<RoleViewModel> GetAll()
        {
            List<RoleViewModel> lst = new List<RoleViewModel>();


            var query = (from data in _context.Role
                        select new RoleViewModel
                        { 
                            Id = data.Id,
                            Name = data.Name,
                        });

            lst = query.ToList();
            return lst;

        }
    }
}
