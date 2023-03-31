
namespace CoreTraining.Entities.DTO
{
    public class TableRequestViewModel
    {
        public string SortColumn { get; set; } = "";
        public string SortColumnDirection { get; set; } = "";
        public int PageSize { get; set; }
        public int Skip { get; set; }
        public string Keywords { get; set; } = "";
        public int Role { get; set; }
        public string CurrentUserId { get; set; } = "";
    }
}
