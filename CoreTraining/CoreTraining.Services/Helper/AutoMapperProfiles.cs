using AutoMapper;
using CoreTraining.Entities.Data;
using CoreTraining.Entities.DTO;

namespace CoreTraining.Services.Helper
{
    public class AutoMapperProfiles
    {
        public class AutoMapperProfile : Profile
        {
            public AutoMapperProfile()
            {
                CreateMap<Posts, PostViewModel>().ReverseMap();
                CreateMap<User, UserViewModel>().ReverseMap();
                CreateMap<User, UserEditViewModel>().ReverseMap();
                CreateMap<UserViewModel, UserEditViewModel>().ReverseMap();
                CreateMap<Role, RoleViewModel>().ReverseMap();
            }
        }

    }
}
