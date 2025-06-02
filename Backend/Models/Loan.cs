namespace LibraryManagementAPI.Models
{
    public class Loan
    {
        public int Id { get; set; }
        public int BookId { get; set; }
        public Book Book { get; set; }
        public int BorrowerId { get; set; }
        public Borrower Borrower { get; set; }
        public DateTime LoanDate { get; set; } = DateTime.Now;
        public DateTime DueDate { get; set; } = DateTime.Now.AddDays(14);
        public DateTime? ReturnDate { get; set; }
    }
}
