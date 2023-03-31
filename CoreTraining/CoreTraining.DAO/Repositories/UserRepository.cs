using CoreTraining.DAO.IRepositories;
using CoreTraining.Entities.Data;
using CoreTraining.Entities.DTO;
using Microsoft.AspNetCore.Identity;
using System.Linq.Dynamic.Core;


namespace CoreTraining.DAO.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly CoreTrainingContext _context;
        public UserRepository(CoreTrainingContext context, UserManager<ApplicationUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        public UserListViewModel GetAllUser()
        {
            UserListViewModel model = new UserListViewModel();

            var query = (from data in _context.User
                         join user in _context.User on data.CreatedUserId equals user.Id
                         where data.IsDeleted == false
                         orderby data.CreatedDate descending
                         select new UserViewModel
                         {
                             Id = data.Id,
                             FullName = user.FirstName + " " + user.LastName,
                             Email = user.Email,
                             Role = user.Role,
                             CreatedDate = data.CreatedDate,
                             CreatedUserName = user.FirstName + " " + user.LastName,
                             ProfileName = user.ProfileName
                         });
            model.TotalRecords = query.Count();
            model.Data = query.ToList();
            return model;
        }


        public async Task<IdentityResult> Create(ApplicationUser user,string password)
        {
            var result = await _userManager.CreateAsync(user, password);
            return result;
        }

        public UserViewModel Get(string id)
        {
            var query = (from data in _context.User
                         join user in _context.User on data.CreatedUserId equals user.Id
                         where data.Id == id
                         select new UserViewModel
                         {
                             Id = data.Id,
                             Email = data.Email,
                             FullName = data.FirstName + " " + data.LastName,
                             FirstName = data.FirstName,
                             LastName = data.LastName,
                             PhoneNumber = data.PhoneNumber,
                             Address = data.Address,
                             DOB = data.Dob,
                             Role = data.Role,
                             CreatedDate = data.CreatedDate,
                             CreatedUserName = user.FirstName + " " + user.LastName,
                             ProfileName = data.ProfileName,  
                         }).FirstOrDefault();
            return query;
        }

        public ApplicationUser GetUpdate(string email)
        {
            var query = (from data in _context.User
                         join user in _context.User on data.CreatedUserId equals user.Id
                         where data.Email ==email
                         select  new ApplicationUser
                            {
                               Id = data.Id,
                               AccessFailedCount = data.AccessFailedCount,
                               Address = data.Address,
                               IsActive = data.IsActive,
                               ConcurrencyStamp = data.ConcurrencyStamp,
                               CreatedDate = data.CreatedDate,
                               CreatedUserId = data.CreatedUserId,
                               DOB = data.Dob,
                               Email = data.Email,
                               EmailConfirmed = data.EmailConfirmed,
                               FirstName = data.FirstName,
                               IsDeleted = data.IsDeleted,
                               LastName = data.LastName,
                               LockoutEnabled = data.LockoutEnabled,
                               LockoutEnd = data.LockoutEnd,
                               NormalizedEmail = data.NormalizedEmail,
                               NormalizedUserName = data.NormalizedUserName,
                               PasswordHash = data.PasswordHash,
                               PhoneNumber = data.PhoneNumber,
                               PhoneNumberConfirmed = data.PhoneNumberConfirmed,
                               ProfileName = data.ProfileName,
                               Role = data.Role,
                               SecurityStamp = data.SecurityStamp,
                               TokenDate = data.TokenDate,
                               TwoFactorEnabled = data.TwoFactorEnabled,
                               UserName = data.UserName,
                            }
                         ).FirstOrDefault();
            return query;
        }
        public UserViewModel GetToken(string id)
        {
            var query = (from data in _context.User
                         join user in _context.User on data.CreatedUserId equals user.Id
                         where data.Id == id
                         select new UserViewModel
                         {
                             Id = data.Id,
                             TokenDate = data.TokenDate,
                         }).FirstOrDefault();
            return query;
        }

        public bool Update(User obj)
        {
            bool success = false;
            try
            {
                var user = _context.User.FirstOrDefault(x => x.Id == obj.Id);
                if(user != null)
                {
                    user.Email = obj.Email;
                    user.UserName = obj.Email;
                    user.NormalizedEmail = obj.Email.ToUpper();
                    user.NormalizedUserName = obj.Email.ToUpper();
                    user.FirstName = obj.FirstName;
                    user.LastName = obj.LastName == null ? "" : obj.LastName;
                    user.PhoneNumber = obj.PhoneNumber == null ? "" : obj.PhoneNumber;
                    user.Address = obj.Address == null ? "" : obj.Address;
                    user.Dob = obj.Dob;
                    user.Role = obj.Role == 0 ? user.Role : obj.Role;
                    user.UpdatedDate = DateTime.Now;
                    user.UpdatedUserId = obj.UpdatedUserId;
                    if (obj.ProfileName != "")
                    {
                        user.ProfileName = obj.ProfileName;
                    }
                    _context.User.Update(user);
                    _context.Update(user);
                    _context.SaveChanges();
                    success = true;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
            return success;
        }


        public bool UpdateToken(User obj)
        {
            bool success = false;
            try
            {
                var user = _context.User.FirstOrDefault(x => x.Id == obj.Id);
                if (user != null)
                {
                    user.TokenDate = obj.TokenDate;
                    _context.User.Update(user);
                    _context.SaveChanges();
                    success = true;
                }   
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
            return success;
        }

        public int CountEditEmail(UserEditViewModel model)
        {
            int countEditEmail = _context.User.Count(x => x.Email == model.Email && x.Id != model.Id);
            return countEditEmail;
        }

        public bool Delete(string id)
        {
            bool success = false;
            try
            {
                var user = _context.User.FirstOrDefault(x => x.Id == id);
                if(user != null)
                {
                    user.IsDeleted = true;
                    user.DeletedDate = DateTime.Now;

                    _context.User.Update(user);
                    _context.SaveChanges();
                    success = true;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
            return success;
        }
    }
}
