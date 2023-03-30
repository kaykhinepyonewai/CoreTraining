using CoreTraining.Entities.DTO;

namespace CoreTraining.Services.IServices
{
    public interface IPostService
    {
        PostListViewModel GetAll();

        bool Save(PostViewModel model);

        PostViewModel Get(string id);

        bool Update(PostViewModel model);

        bool Delete(string id);

        int CountTitle(PostViewModel mode);

        public int CountEditTitle(PostViewModel model);

        PostListViewModel GetAllPosts(TableRequestViewModel request);

        bool BatchInsert(List<PostViewModel> posts);
    }
}
