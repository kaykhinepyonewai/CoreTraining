using CoreTraining.Entities.DTO;
using CoreTraining.Services.IServices;
using Microsoft.AspNetCore.Mvc;
using OfficeOpenXml.Style;
using OfficeOpenXml;
using System.Drawing;

namespace CoreTraining.Web.Controllers
{
    public class PostController : Controller
    {
        private IAuthService _authService;
        private IUserService _userService;
        private IPostService _postService;

        public PostController(IAuthService authService, IUserService userService, IPostService postService)
        {
            _authService = authService;
            _userService = userService;
            _postService = postService;
        }

        #region List
        public IActionResult Index()
        {
            PostViewModel model = new PostViewModel();
            return View(model);
        }

        //[HttpPost]
        public IActionResult GetPostList(string id)
        {
            HttpContext.Session.SetString("UserId", id);
            var currentUser = _authService.GetById(id);
            var model = _postService.GetAll();
            return Json(model);
        }

        #endregion

        #region Create
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(PostViewModel model)
        {
            try
            {
                string? userId = HttpContext.Session.GetString("UserId");
                var currentUser = _authService.GetById(userId);

                int countTitle = _postService.CountTitle(model);

                if(countTitle > 0)
                {
                    ModelState.AddModelError(string.Empty, "Title is already exits...");
                }
                else
                {
                    string currentUserId = currentUser.Id;

                    model.Id = Guid.NewGuid().ToString();
                    model.CreatedUserId = currentUserId;

                    bool success = _postService.Save(model);

                    return RedirectToAction(nameof(Index));
                }
                
            }
            catch
            {
                return View();
            }
            return View();
        }
        #endregion


        #region Detail
        public JsonResult GetPostDetail(string id)
        {
            PostViewModel model = _postService.Get(id);
            return Json(model);
        }
        #endregion

        #region Edit

        public ActionResult Edit(string id)
        {
            PostViewModel model = _postService.Get(id);
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(PostViewModel model)
        {
            try
            {
                string? userId = HttpContext.Session.GetString("UserId");
                var currentUser = _authService.GetById(userId);

                int countEditTitle = _postService.CountEditTitle(model);

                if (countEditTitle > 0)
                {
                    ModelState.AddModelError(string.Empty, "Title is already exits...");
                }
                else
                {
                    string currentUserId = currentUser.Id;

                    model.UpdatedUserId = currentUserId;

                    bool success = _postService.Update(model);

                    return RedirectToAction(nameof(Index));
                } 
            }
            catch
            {

            }
            return View(model);
        }

        #endregion Edit

        #region Delete
        [HttpPost]
        public JsonResult Delete(string id)
        {
            bool success = _postService.Delete(id);

            return Json(success);
        }
        #endregion

        #region Export

        public IActionResult Export([FromRoute] string id)
        {
            var currentUser = _authService.GetById(id);

            TableRequestViewModel request = new TableRequestViewModel();

            request.Role = currentUser.Role;
            request.CurrentUserId = currentUser.Id;

            var posts = _postService.GetAllPosts(request);

            var stream = new MemoryStream();
            using (var xlPackage = new ExcelPackage(stream))
            {
                var worksheet = xlPackage.Workbook.Worksheets.Add("Posts");
                var namedStyle = xlPackage.Workbook.Styles.CreateNamedStyle("HyperLink");
                namedStyle.Style.Font.UnderLine = true;
                namedStyle.Style.Font.Color.SetColor(Color.Blue);
                const int startRow = 5;
                var row = startRow;

                //Create Headers and format them
                worksheet.Cells["A1"].Value = "Posts";
                using (var r = worksheet.Cells["A1:E1"])
                {
                    r.Merge = true;
                    r.Style.Font.Color.SetColor(Color.White);
                    r.Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.CenterContinuous;
                    r.Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                    r.Style.Fill.BackgroundColor.SetColor(Color.FromArgb(23, 55, 93));
                }

                worksheet.Cells["A2"].Value = "Title";
                worksheet.Cells["B2"].Value = "Description";
                worksheet.Cells["C2"].Value = "Status";
                worksheet.Cells["D2"].Value = "Created Date";
                worksheet.Cells["E2"].Value = "Created By";
                worksheet.Cells["A2:E2"].Style.Fill.PatternType = ExcelFillStyle.Solid;
                worksheet.Cells["A2:E2"].Style.Fill.BackgroundColor.SetColor(Color.FromArgb(184, 204, 228));
                worksheet.Cells["A2:E2"].Style.Font.Bold = true;

                row = 3;
                foreach (var item in posts.Data)
                {
                    worksheet.Cells[row, 1].Value = item.Title;
                    worksheet.Cells[row, 2].Value = item.Description;
                    worksheet.Cells[row, 3].Value = item.Status;
                    worksheet.Cells[row, 4].Value = item.sCreatedDate;
                    worksheet.Cells[row, 5].Value = item.CreatedUserName;
                    row++;
                }


                // save the new spreadsheet
                xlPackage.Save();
                // Response.Clear();
            }
            stream.Position = 0;
            return File(stream, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "posts.xlsx");
        }

        #endregion

        #region Import
        public IActionResult Import()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]

        public IActionResult Import(IFormFile batchPosts, [FromRoute] string id)
        {
            
            var currentUser = _authService.GetById(id);

            if (batchPosts != null)
            {
                    var extension = Path.GetExtension(batchPosts.FileName);
                    if (ModelState.IsValid && batchPosts?.Length > 0 && extension == ".xlsx" || extension == ".xls")
                    {
                        var stream = batchPosts.OpenReadStream();
                        List<PostViewModel> posts = new List<PostViewModel>();
                        try
                        {
                            using (var package = new ExcelPackage(stream))
                            {
                                var worksheet = package.Workbook.Worksheets.First();//package.Workbook.Worksheets[0];
                                var rowCount = worksheet.Dimension.Rows;

                                for (var row = 3; row <= rowCount; row++)
                                {
                                    try
                                    {
                                        var title = worksheet.Cells[row, 1].Value?.ToString();
                                        var description = worksheet.Cells[row, 2].Value?.ToString();
                                        var status = worksheet.Cells[row, 3].Value?.ToString();

                                        var post = new PostViewModel()
                                        {
                                            Id = Guid.NewGuid().ToString(),
                                            Title = title,
                                            Description = description,
                                            IsPublished = status == "Published" ? true : false,
                                            CreatedDate = DateTime.Now,
                                            CreatedUserId = currentUser.Id
                                        };
                                        posts.Add(post);
                                    }
                                    catch (Exception ex)
                                    {
                                        Console.WriteLine("Something went wrong");
                                    }
                                }
                            }

                            bool success = _postService.BatchInsert(posts);

                            if (success)
                            {
                                return RedirectToAction("Index", "Post");
                            }

                            return View();

                        }
                        catch (Exception e)
                        {
                            return View();
                        }
                    }
                else
                {
                    ModelState.AddModelError(string.Empty, "Please filled corrrect format Excel file extension with .xlsx or .xls");
                }
              
            }
            else
            {
                ModelState.AddModelError(string.Empty, "Input File is Empty. Please Filled correct format excel file");
            }
            
            return View();
        }

        #endregion
    }
}
