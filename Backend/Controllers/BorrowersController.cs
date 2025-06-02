using LibraryManagementAPI.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore; 

[Route("api/[controller]")]
[ApiController]
[Authorize]
public class BorrowersController : ControllerBase
{
    private readonly ApplicationDbContext _context;

    public BorrowersController(ApplicationDbContext context) => _context = context;

    [HttpGet]
    public async Task<ActionResult<IEnumerable<BorrowerDTO>>> GetBorrowers()
    {
        return await _context.Borrowers
            .Select(b => new BorrowerDTO
            {
                Id = b.Id,
                FirstName = b.FirstName,
                LastName = b.LastName,
                Email = b.Email
            })
            .ToListAsync();
    }

    [HttpPost]
    public async Task<ActionResult<BorrowerDTO>> CreateBorrower(CreateBorrowerDTO dto)
    {
        var borrower = new Borrower
        {
            FirstName = dto.FirstName,
            LastName = dto.LastName,
            Email = dto.Email,
            PhoneNumber = dto.PhoneNumber
        };

        _context.Borrowers.Add(borrower);
        await _context.SaveChangesAsync();

        return CreatedAtAction(nameof(GetBorrower), new { id = borrower.Id },
            new BorrowerDTO
            {
                Id = borrower.Id,
                FirstName = borrower.FirstName,
                LastName = borrower.LastName,
                Email = borrower.Email
            });
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<BorrowerDTO>> GetBorrower(int id)
    {
        var borrower = await _context.Borrowers.FindAsync(id);
        if (borrower == null) return NotFound();

        return new BorrowerDTO
        {
            Id = borrower.Id,
            FirstName = borrower.FirstName,
            LastName = borrower.LastName,
            Email = borrower.Email
        };
    }

    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteBorrower(int id)
    {
        var borrower = await _context.Borrowers.FindAsync(id);
        if (borrower == null)
        {
            return NotFound();
        }

        _context.Borrowers.Remove(borrower);
        await _context.SaveChangesAsync();

        return NoContent();
    }

}