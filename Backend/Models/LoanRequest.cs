namespace LibraryManagementAPI.Models
{
    public class LoanRequest
    {
        public int BookId { get; set; }
        public int BorrowerId { get; set; }
    }
}
