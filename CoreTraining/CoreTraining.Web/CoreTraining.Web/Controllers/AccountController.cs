using CoreTraining.Entities.Data;
using CoreTraining.Entities.DTO;
using CoreTraining.Services.IServices;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Net.Mail;
using System.Net;
using Microsoft.Extensions.Caching.Distributed;

namespace CoreTraining.Web.Controllers
{
    public class AccountController : Controller
    {
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly UserManager<ApplicationUser> _userManager;
        private IAuthService _authService;
        private IUserService _userService;
        private readonly IWebHostEnvironment _env;
        private readonly IDistributedCache _cache;
        private readonly CoreTrainingContext _context;


        public AccountController(UserManager<ApplicationUser> userManager,
                                      SignInManager<ApplicationUser> signInManager,
                                      IAuthService authService,
                                      IUserService userService,
                                      IWebHostEnvironment env,
                                      IDistributedCache cache,
                                      CoreTrainingContext context)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _authService = authService;
            _userService = userService;
            _env = env;
            _cache = cache;
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }

        #region Login
        [HttpGet]
        [AllowAnonymous]
        public IActionResult Login()
        {
            if (User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Index", "Home");
            }

            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(LoginViewModel user)
        {
            if (ModelState.IsValid)
            {
                var result = await _authService.Login(user.Email, user.Password);

                if (result.Succeeded)
                {
                    ApplicationUser currentUser = _authService.GetByEmail(user.Email);

                    if (currentUser.IsDeleted)
                    {
                        ModelState.AddModelError(string.Empty, "Your account is deleted.");
                        _authService.Logout();
                        return View(user);
                    }
                    else if (!currentUser.IsActive)
                    {
                        ModelState.AddModelError(string.Empty, "Your account is not active.");
                        _authService.Logout();
                        return View(user);
                    }

                    return RedirectToAction("Index", "Home");
                }

                ModelState.AddModelError(string.Empty, "Invalid Login Attempt");

            }
            return View(user);
        }
        #endregion


        #region Register
        public IActionResult Register()
        {
            return View();
        }


        [HttpPost]
        public async Task<IActionResult> Register(RegisterViewModel model)
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
                    Address = "",
                    PhoneNumber = "",
                    Role = 1,
                    IsActive = true,
                    IsDeleted = false,
                    CreatedDate = DateTime.Now,
                    CreatedUserId = userId,
                    ProfileName = "defaultImg.jpg",
                };

                var result = _authService.Register(user, model.Password);

                if (result.Result.Succeeded)
                {
                    await _signInManager.SignInAsync(user, isPersistent: false);

                    return RedirectToAction("index", "Home");
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

        #region GetByEmail
        public JsonResult GetByEmail(string email)
         {
            var currentUser = _authService.GetByEmail(email);

            return Json(currentUser);
        }

        public JsonResult GetById(string id)
        {
            var currentUser = _authService.GetById(id);

            return Json(currentUser);
        }
        #endregion

        #region Profile

        public async Task<IActionResult> Profile([FromRoute] string id)
        {
            var currentUser = _authService.GetById(id);

            UserViewModel model = _userService.Get(currentUser.Id);
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
            userModel.ProfileName = model.ProfileName;
            
            return View(userModel);
        }

        [HttpPost]
        public async Task<IActionResult> Profile(UserEditViewModel model, IFormFile profileImage)
        {
			var currentUser = _authService.GetById(model.Id);
            
            if (profileImage != null)
            {
                string extension = Path.GetExtension(profileImage.FileName);
                if (extension == ".jpg" || extension == ".png" || extension == ".jpeg")
                {
                    if (profileImage != null && profileImage.Length > 0)
                    {
                        var currentImage = Path.Combine(_env.WebRootPath, "images", "profile", currentUser.ProfileName);
                        string image = "defaultImg.jpg";
                        var defaultImage = Path.Combine(_env.WebRootPath, "images", "profile", image);

                        if (currentImage != defaultImage)
                        {
                            //Delete the profile image file
                            System.IO.File.Delete(currentImage);
                        }

                        // Generate a unique file name
                        var fileName = Guid.NewGuid().ToString() + Path.GetExtension(profileImage.FileName);

                        // Save the file to the server
                        var filePath = Path.Combine(_env.WebRootPath, "images", "profile", fileName);
                        using (var stream = new FileStream(filePath, FileMode.Create))
                        {
                            await profileImage.CopyToAsync(stream);
                        }
                        // Update the user's profile image
                        model.ProfileName = fileName;
                    }
                    else
                    {
                        model.ProfileName = currentUser.ProfileName;
                    }

                    if (ModelState.IsValid)
                    {
                        int countEditGmail = _userService.CountEditEmail(model);

                        if (countEditGmail > 0)
                        {
                            model.ResponseModel.Message = "Email is already exits...";
                        }
                        else
                        {
     
                            if (currentUser.UserName == model.Email)
                            {
                                bool success = _userService.Update(model);

                                model.ResponseModel = new ResponseModel();

                                if (success)
                                {
                                    model.ResponseModel.Message = "Update Profile successful.";
                                }
                                else
                                {
                                    model.ResponseModel.Message = "Update Profile fail.";
                                }
                            }

                            else
                            {
                                bool success = _userService.Update(model);

                                model.ResponseModel = new ResponseModel();

                                if (success)
                                {
                                    //_authService.Logout();
                                    model.ResponseModel.Message = "Update Profile successful.";
                                    //return RedirectToAction("Login");

                                }
                                else
                                {
                                    model.ResponseModel.Message = "Update Profile fail.";
                                }
                            }

                        }
                    }
                }
                else
                {
                    if (ModelState.IsValid)
                    {
                        model.ResponseModel = new ResponseModel();
                        model.ResponseModel.Message = "Update Profile fail... Please Correct Image with extention Jpg || Pgn || Jpeg";
                        model.ProfileName = currentUser.ProfileName;
                    }
                }
            }
            else
            {
                model.ResponseModel = new ResponseModel();
                model.ProfileName = currentUser.ProfileName;
                if (ModelState.IsValid)
                {
                    int countEditGmail = _userService.CountEditEmail(model);

                    if (countEditGmail > 0)
                    {
                        model.ResponseModel.Message = "Email is already exits...";
                    }
                    else
                    {
                        bool success = _userService.Update(model);
                        ApplicationUser user = _userService.GetUpdate(model.Email);
                        model.ResponseModel = new ResponseModel();
                            if (success)
                            {
                            model.ResponseModel.Message = "Update Profile Success.";
                            }
                            else
                            {
                                model.ResponseModel.Message = "Update Profile fail.";
                            }
                    }
                }
            }
                return View(model);
        }

        #endregion

        #region ChangePassword
        public IActionResult ChangePassword([FromRoute] string id)
        {
            ChangePasswordViewModel model = new ChangePasswordViewModel();
            model.UserId = id;
            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> ChangePassword(ChangePasswordViewModel model)
        {


            var currentUser = _authService.GetById(model.UserId);

            if (ModelState.IsValid)
            {
                var result = _authService.ChangePassword(currentUser, model.OldPassword, model.Password);

                if (result.Result.Succeeded)
                {
                    return RedirectToAction("Profile","Account", new { id = currentUser.Id });
                }
                else
                {
                    foreach (var error in result.Result.Errors)
                    {
                        ModelState.AddModelError("", error.Description);
                    }
                }

            }
            return View(model);
        }
        #endregion

        #region ForgotPassword

        [HttpGet]
        public IActionResult ForgotPassword()
        {
            ForgotPasswordViewModel model = new ForgotPasswordViewModel();
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> ForgotPassword(ForgotPasswordViewModel model)
        {
            if(model.Email != null)
            {
				string body = string.Empty;
				ApplicationUser currentUser = _authService.GetByEmail(model.Email);
                if(currentUser == null)
                {
                    if (ModelState.IsValid)
                    {
                        ModelState.AddModelError(string.Empty, "Your Email is inalid");
                    }
                }
                else
                {
                    var tokenExpiration = DateTime.UtcNow.AddHours(24);

                    UserViewModel userModel = new UserViewModel();
                    userModel.TokenDate = tokenExpiration;
                    userModel.Id = currentUser.Id;
                    bool success = _userService.UpdateToken(userModel);
                    model.EmailSent = false;
                    model.ResponseModel = new ResponseModel();
                    if (currentUser == null)
                    {
                        ModelState.AddModelError(string.Empty, "Your account is Invlaid.");
                    }
                    else
                    {
                        if (currentUser.IsDeleted)
                        {
                            ModelState.AddModelError(string.Empty, "Your account is deleted.");

                        }
                        else if (!currentUser.IsActive)
                        {
                            ModelState.AddModelError(string.Empty, "Your account is not active.");
                            _authService.Logout();
                            return View();
                        }
                        else
                        {
                            var templatePath = "Template/reset_mail.html";
                            var templateString = System.IO.File.ReadAllText(templatePath);
                            SendMail(model, templateString, currentUser);
                            if (SendMail != null)
                            {
                                if (ModelState.IsValid)
                                {
                                    ModelState.AddModelError(string.Empty, "We have sent reset password link your registered email address..");
                                }
                            }
                            else
                            {
                                if (ModelState.IsValid)
                                {
                                    ModelState.AddModelError(string.Empty, "Sorry,Something Wrong.... Sending  email fail..");
                                }
                            }
                            return View();
                        }
                    }
                }
               
			}
            return View();
        }

        private void SendMail(ForgotPasswordViewModel model, string templateString, ApplicationUser currentUser)
        {
			string username = model.Email;
            SmtpClient smtp = new SmtpClient("smtp.mailtrap.io", 2525);
            smtp.EnableSsl = true;
            smtp.Credentials = new NetworkCredential("a70f64ecb948dd", "9c05f17a0375b0");
            MailMessage message = new MailMessage();
            message.From = new MailAddress("kaykhinepyonewai@gmail.com");
            message.IsBodyHtml = true;
            message.Subject = "Password reset link";
            var resetUrl = Url.Action("ResetPassword", "Account", new { userId = currentUser.Id }, Request.Scheme);
            var body = templateString.Replace("#name#", model.Email).Replace("#url#", resetUrl);
            message.Body = body;
            message.To.Add(model.Email);
			
			try
            {
                smtp.Send(message);
			}
            catch (SmtpException ex)
            {

			}
        }
        #endregion

        #region ResetPassword
        [HttpGet]
        public IActionResult ResetPassword()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> ResetPassword(string userId, ResetPasswordViewModel model)
        {
            if (ModelState.IsValid)
            {
                var id = userId;
                var resetUser = _authService.GetById(id);

                UserViewModel userModel = new UserViewModel();
                userModel = _userService.GetToken(resetUser.Id);
                if (userModel.TokenDate > DateTime.Now)
                {
                    var token = await _authService.GenerateToken(resetUser);
                    model.Token = token;
                    var result = await _authService.ResetPassword(resetUser, token, model.NewPassword);

                    userModel.TokenDate = null;

                    bool success = _userService.UpdateToken(userModel);

                    if (result.Succeeded)
                    {
                        return RedirectToAction("Login", "Account");
                    }
                    else
                    {
                        foreach (var error in result.Errors)
                        {
                            ModelState.AddModelError("", error.Description);
                        }
                    }
                }
                else
                {
                    ModelState.AddModelError(string.Empty, "Sorry,Your Reset Email Link is invlaid.You must reset your passwrod within 24 hours after you have received reset email link.So,Request Again Email Reset Link....");
                }
            }
            return View();
        }
        #endregion


        #region Logout
        public IActionResult Logout()
        {
            _authService.Logout();

            return RedirectToAction("Login");
        }
        #endregion logout


    }
}
