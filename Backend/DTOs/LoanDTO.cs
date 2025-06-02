namespace LibraryManagementAPI.DTOs;

public class LoanRequestDTO
{
    public int BookId { get; set; }
    public int BorrowerId { get; set; }
}

public class ReturnRequestDTO
{
    public int LoanId { get; set; }
}

public class LoanDTO
{
    public int Id { get; set; }
    public int BookId { get; set; }
    public string BookTitle { get; set; }
    public int BorrowerId { get; set; }
    public string BorrowerName { get; set; }
    public DateTime LoanDate { get; set; }
    public DateTime DueDate { get; set; }
    public DateTime? ReturnDate { get; set; }
    public int? DaysOverdue { get; set; }
}