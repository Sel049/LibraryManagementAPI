using LibraryManagementAPI.Data;
using LibraryManagementAPI.DTOs;
using LibraryManagementAPI.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace LibraryManagementAPI.Controllers
{
  
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class LoansController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public LoansController(ApplicationDbContext context) => _context = context;

        [HttpGet("{id}")]
        public async Task<ActionResult<LoanDTO>> GetLoan(int id)
        {
            var loan = await _context.Loans
                .Include(l => l.Book)
                .Include(l => l.Borrower)
                .FirstOrDefaultAsync(l => l.Id == id);

            if (loan == null) return NotFound();

            return new LoanDTO
            {
                Id = loan.Id,
                BookId = loan.BookId,
                BookTitle = loan.Book.Title,
                BorrowerId = loan.BorrowerId,
                BorrowerName = $"{loan.Borrower.FirstName} {loan.Borrower.LastName}",
                LoanDate = loan.LoanDate,
                DueDate = loan.DueDate,
                ReturnDate = loan.ReturnDate
            };
        }

        [HttpPost]
        public async Task<ActionResult<LoanDTO>> IssueBook(LoanRequestDTO request)
        {
            var borrowerExists = await _context.Borrowers.AnyAsync(b => b.Id == request.BorrowerId);
            if (!borrowerExists) return BadRequest("Borrower not found");

            var book = await _context.Books.FindAsync(request.BookId);
            if (book == null) return NotFound("Book not found!");
            if (book.AvailableCopies < 1) return BadRequest("No copies available!");

            var borrower = await _context.Borrowers.FindAsync(request.BorrowerId);
            if (borrower == null) return NotFound("Borrower not found!");

            var loan = new Loan
            {
                BookId = request.BookId,
                BorrowerId = request.BorrowerId,
                DueDate = DateTime.Now.AddDays(14)
            };

            book.AvailableCopies--;
            _context.Loans.Add(loan);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetLoan), new { id = loan.Id },
                new LoanDTO
                {
                    Id = loan.Id,
                    BookId = loan.BookId,
                    BorrowerId = loan.BorrowerId,
                    LoanDate = loan.LoanDate,
                    DueDate = loan.DueDate
                });
        }

        [HttpPost("return")]
        public async Task<IActionResult> ReturnBook(ReturnRequestDTO request)
        {
            var loan = await _context.Loans
                .Include(l => l.Book)
                .FirstOrDefaultAsync(l => l.Id == request.LoanId);

            if (loan == null || loan.ReturnDate != null)
                return NotFound("Loan not found or already returned");

            loan.ReturnDate = DateTime.Now;
            loan.Book.AvailableCopies++;
            await _context.SaveChangesAsync();

            return NoContent();
        }

        [HttpGet("all")]
        public async Task<ActionResult<IEnumerable<LoanDTO>>> GetAllLoans()
        {
            return await _context.Loans
                .Include(l => l.Book)
                .Include(l => l.Borrower)
                .Select(l => new LoanDTO
                {
                    Id = l.Id,
                    BookId = l.BookId,
                    BookTitle = l.Book.Title,
                    BorrowerId = l.BorrowerId,
                    BorrowerName = $"{l.Borrower.FirstName} {l.Borrower.LastName}",
                    LoanDate = l.LoanDate,
                    DueDate = l.DueDate,
                    ReturnDate = l.ReturnDate,
                    DaysOverdue = l.DueDate < DateTime.Now ? (DateTime.Now - l.DueDate).Days : 0
                })
                .ToListAsync();
        }

        [HttpGet("overdue")]
        public async Task<ActionResult<IEnumerable<LoanDTO>>> GetOverdueLoans()
        {
            return await _context.Loans
                .Where(l => l.ReturnDate == null && l.DueDate < DateTime.Now)
                .Include(l => l.Book)
                .Include(l => l.Borrower)
                .Select(l => new LoanDTO
                {
                    Id = l.Id,
                    BookId = l.BookId,
                    BookTitle = l.Book.Title,
                    BorrowerId = l.BorrowerId,
                    BorrowerName = $"{l.Borrower.FirstName} {l.Borrower.LastName}",
                    LoanDate = l.LoanDate,
                    DueDate = l.DueDate,
                    DaysOverdue = (DateTime.Now - l.DueDate).Days
                })
                .ToListAsync();
        }
    }
}