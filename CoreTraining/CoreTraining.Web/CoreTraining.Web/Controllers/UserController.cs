using CoreTraining.Entities.DTO;
using CoreTraining.Services.IServices;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;


namespace CoreTraining.Web.Controllers
{
    //[Authorize(Policy = "MyPolicy")]
    public class UserController : Controller
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private IRoleService _roleService;
        private IUserService _userService;
        private readonly IWebHostEnvironment _env;

        #region UserController
        public UserController(UserManager<ApplicationUser> userManager,
            IUserService userService,
            IRoleService roleService,
            IWebHostEnvironment env)
        {
            _userManager = userManager;
            _roleService = roleService;
            _userService = userService;
            _env = env;
        }
        #endregion

        #region List
        
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public JsonResult GetUserList()
        {
            var model = _userService.GetAllUser();
            return Json(model);
        }

        #endregion

        #region Create

        public IActionResult Create()
        {
            UserViewModel model = new UserViewModel();
            model.RoleList = new SelectList(_roleService.GetAll(), "Id", "Name");
            return View(model);
        }

        [HttpPost]

        public IActionResult Create(UserViewModel model)
        {
            DateTime? todayDate = DateTime.Now;
            var userId = Guid.NewGuid().ToString();
            if (ModelState.IsValid)
            {
                var user = new ApplicationUser
                {
                    Id = userId,
                    FirstName = model.FirstName,
                    LastName = model.LastName == null ? "" : model.LastName,
                    UserName = model.Email,
                    Email = model.Email,
                    DOB = model.DOB,
                    PhoneNumber = model.PhoneNumber == null ? "" : model.PhoneNumber,
                    Address = model.Address == null ? "" : model.Address,
                    Role = model.Role,
                    IsActive = true,
                    IsDeleted = false,
                    CreatedDate = DateTime.Now,
                    CreatedUserId = userId,
                    ProfileName = "defaultImg.jpg",
                };
                var result = _userService.Create(user, model.Password);
                if (result.Result.Succeeded)
                {
                    return RedirectToAction("Index", "User");
                }
                else
                {
                    model.RoleList = new SelectList(_roleService.GetAll(), "Id", "Name");
                }

                foreach (var error in result.Result.Errors)
                {
                    ModelState.AddModelError("", error.Description);
                }

                ModelState.AddModelError(string.Empty, "Invalid Login Attempt");
            }
            return View(model);
        }
        #endregion

        #region GetUserDetail
        public JsonResult GetUserDetail(string id)
        {
            UserViewModel model = _userService.Get(id);
            return Json(model);
        }
        #endregion

        #region Edit
        public IActionResult Edit(string id)
        {
            UserViewModel model = _userService.Get(id);
            UserEditViewModel userModel = new UserEditViewModel();
            userModel.Id = model.Id;
            userModel.FirstName = model.FirstName;
            userModel.LastName = model.LastName;
            userModel.Email = model.Email;
            userModel.Id = model.Id;
            userModel.PhoneNumber = model.PhoneNumber == null ? "" : model.PhoneNumber;
            userModel.Address = model.Address == null ? "" : model.Address;
            userModel.DOB = model.DOB;
            userModel.Role = model.Role;
            userModel.RoleList = new SelectList(_roleService.GetAll(), "Id", "Name");
            return View(userModel);
        }

        [HttpPost]
        public IActionResult Edit(UserEditViewModel model)
        {
            DateTime? todayDate = DateTime.Now;
            var userId = Guid.NewGuid().ToString();

            if (ModelState.IsValid)
            {
                int countEditGmail = _userService.CountEditEmail(model);
                
                if(countEditGmail > 0)
                {
                    ModelState.AddModelError(string.Empty, "Email is already exits...");
                }
                else
                {
                    bool success = _userService.Update(model);
                    ;
                    if (success)
                    {
                        return RedirectToAction("Index", "User");
                    }
                }
            }
            model.RoleList = new SelectList(_roleService.GetAll(), "Id", "Name");
            return View(model);
        }
        #endregion

        #region Delete
        [HttpPost]
        public JsonResult Delete(string id)
        {
            UserViewModel model = _userService.Get(id);

            var filePath = Path.Combine(_env.WebRootPath, "images", "profile", model.ProfileName);
            string image = "defaultImg.jpg";
            var defaultImage = Path.Combine(_env.WebRootPath, "images", "profile", image);
            if (System.IO.File.Exists(filePath))
            {
                if(filePath != defaultImage)
                {
                    System.IO.File.Delete(filePath);
                }
            }
            bool success = _userService.Delete(id);

            return Json(success);
        }
        #endregion
    }
}
