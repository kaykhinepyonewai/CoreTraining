using CoreTraining.Entities.Data;
using CoreTraining.Entities.DTO;

namespace CoreTraining.DAO.IRepositories
{
    public interface IPostRepository
    {
        PostListViewModel GetAll(int role, string id);
        public bool Save(Posts obj);
        PostViewModel Get(string id);
        bool Update(Posts obj);
        public bool Delete(string id);
        int CountTitle(PostViewModel model);
        int CountEditTitle(PostViewModel model);
        PostListViewModel GetAllPosts(TableRequestViewModel request);
        bool BatchInsert(List<Posts> posts);
    }
}
