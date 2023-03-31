using AutoMapper;
using CoreTraining.DAO.IRepositories;
using CoreTraining.Entities.Data;
using CoreTraining.Entities.DTO;
using CoreTraining.Services.IServices;

namespace CoreTraining.Services.Services
{
    public class PostService : IPostService
    {
        private readonly IPostRepository _postRepository;
        private readonly IMapper _mapper;

        public PostService(IPostRepository postRepository, IMapper mapper)
        {
            _postRepository = postRepository;
            _mapper = mapper;
        }

        public PostListViewModel GetAll(int role,string id)
        {
            PostListViewModel model = _postRepository.GetAll(role,id);
            return model;
        }

        public bool Save(PostViewModel model)
        {
            bool success = _postRepository.Save(_mapper.Map<Posts>(model));
            return success;
        }

        public PostViewModel Get(string id)
        {
            PostViewModel model = _postRepository.Get(id);
            return model;
        }

        public bool Update(PostViewModel model)
        {
            bool success = _postRepository.Update(_mapper.Map<Posts>(model));
            return success;
        }

        public bool Delete(string id)
        {
            bool success = _postRepository.Delete(id);

            return success;
        }

        public int CountTitle(PostViewModel model)
        {
            int countTitle = _postRepository.CountTitle(model);

            return countTitle;
        }

        public int CountEditTitle(PostViewModel model)
        {
            int countTitle = _postRepository.CountEditTitle(model);

            return countTitle;
        }

        public PostListViewModel GetAllPosts(TableRequestViewModel request)
        {
            PostListViewModel model = _postRepository.GetAllPosts(request);
            return model;
        }

        public bool BatchInsert(List<PostViewModel> posts)
        {
            bool success = _postRepository.BatchInsert(_mapper.Map<List<Posts>>(posts));
            return success;
        }
    }
}
