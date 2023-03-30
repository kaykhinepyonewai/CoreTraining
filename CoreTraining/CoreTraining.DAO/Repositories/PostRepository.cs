using CoreTraining.DAO.IRepositories;
using CoreTraining.Entities.Data;
using CoreTraining.Entities.DTO;

namespace CoreTraining.DAO.Repositories
{
    public class PostRepository : IPostRepository
    {
        private readonly CoreTrainingContext _context;

        public PostRepository(CoreTrainingContext context)
        {
            _context = context;
        }


        public PostListViewModel GetAll()
        {
            PostListViewModel model = new PostListViewModel();

            var query = (from data in _context.Posts
                         join user in _context.User on data.CreatedUserId equals user.Id
                         where data.IsDeleted == false
                         orderby data.CreatedDate descending
                         select new PostViewModel
                         {
                             Id = data.Id,
                             Title = data.Title,
                             Description = data.Description,
                             IsPublished = data.IsPublished,
                             CreatedDate = data.CreatedDate,
                             CreatedUserId = data.CreatedUserId,
                             CreatedUserName = user.FirstName + " " + user.LastName
                         });
            model.TotalRecords = query.Count();
            model.Data = query.ToList();

            return model;
        }

        public bool Save(Posts obj)
        {
            bool success = false;
            try
            {
                obj.CreatedDate = DateTime.Now;
                _context.Add(obj);
                _context.SaveChanges();

                success = true;

            }
            catch (Exception ex)
            {

            }

            return success;
        }


        public PostViewModel Get(string id)
        {
            var query = (from data in _context.Posts
                         join user in _context.User on data.CreatedUserId equals user.Id
                         where data.Id == id
                         select new PostViewModel
                         {
                             Id = data.Id,
                             Title = data.Title,
                             Description = data.Description,
                             IsPublished = data.IsPublished,
                             CreatedDate = data.CreatedDate,
                             CreatedUserName = user.FirstName + " " + user.LastName
                         }).FirstOrDefault();

            return query;
        }

        public bool Update(Posts obj)
        {
            bool success = false;
            try
            {
                var post = _context.Posts.FirstOrDefault(x => x.Id == obj.Id);
                post.Title = obj.Title;
                post.Description = obj.Description;
                post.IsPublished = obj.IsPublished;
                post.UpdatedDate = DateTime.Now;
                post.UpdatedUserId = obj.UpdatedUserId;

                _context.Posts.Update(post);
                _context.SaveChanges();

                success = true;

            }
            catch (Exception ex)
            {

            }

            return success;
        }

        public bool Delete(string id)
        {
            bool success = false;
            try
            {
                Posts post = _context.Posts.FirstOrDefault(x => x.Id == id);

                post.IsDeleted = true;
                post.DeletedDate = DateTime.Now;

                _context.Posts.Update(post);
                _context.SaveChanges();
                success = true;

            }
            catch
            {

            }
            return success;
        }


        public int CountTitle(PostViewModel model)
        {
            int countTitle;

            countTitle = _context.Posts.Count(x => x.Title == model.Title && x.IsDeleted == false);

            return countTitle;
        }

        public int CountEditTitle(PostViewModel model)
        {
            int countTitle;

            countTitle = _context.Posts.Count(x => x.Title == model.Title && x.Id != model.Id && x.IsDeleted == false);

            return countTitle;
        }

        public PostListViewModel GetAllPosts(TableRequestViewModel request)
        {
            PostListViewModel model = new PostListViewModel();

            var query = (from data in _context.Posts
                         join user in _context.User on data.CreatedUserId equals user.Id
                         where data.IsDeleted == false
                         orderby data.CreatedDate descending
                         select new PostViewModel
                         {
                             Id = data.Id,
                             Title = data.Title,
                             Description = data.Description,
                             IsPublished = data.IsPublished,
                             Status = data.IsPublished ? "Published" : "Unpublished",
                             CreatedDate = data.CreatedDate,
                             sCreatedDate = data.CreatedDate.ToString("dd/MM/yyyy"),
                             CreatedUserId = data.CreatedUserId,
                             CreatedUserName = user.FirstName + " " + user.LastName
                         });

            if (request.Role == 2)
            {
                query = query.Where(x => x.CreatedUserId == request.CurrentUserId);
            }

            model.TotalRecords = query.Count();

            model.Data = query.ToList();

            return model;
        }

        public bool BatchInsert(List<Posts> post)
        {
            bool success = false;
            try
            {
                _context.Posts.AddRange(post);
                _context.SaveChanges();

                success = true;
            }
            catch
            {

            }
            return success;
        }

    }
}
