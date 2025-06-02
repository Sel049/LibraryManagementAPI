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
    public class BooksController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public BooksController(ApplicationDbContext context) => _context = context;

       
        [HttpGet]
        public async Task<ActionResult<IEnumerable<BookDTO>>> GetBooks() =>  
            await _context.Books
                .Select(b => new BookDTO 
                {
                    Id = b.Id,
                    Title = b.Title,
                    Author = b.Author,
                    ISBN = b.ISBN,
                    AvailableCopies = b.AvailableCopies
                })
                .ToListAsync();

        [HttpGet("{id}")]
        public async Task<ActionResult<BookDTO>> GetBook(int id)  
        {
            var book = await _context.Books.FindAsync(id);
            if (book == null) return NotFound();

            return new BookDTO  
            {
                Id = book.Id,
                Title = book.Title,
                Author = book.Author,
                ISBN = book.ISBN,
                AvailableCopies = book.AvailableCopies
            };
        }

        [HttpPost]
        public async Task<ActionResult<BookDTO>> PostBook(CreateBookDTO createBookDto)  
        {
            var book = new Book  
            {
                Title = createBookDto.Title,
                Author = createBookDto.Author,
                ISBN = createBookDto.ISBN,
                TotalCopies = createBookDto.TotalCopies,
                AvailableCopies = createBookDto.TotalCopies 
            };

            _context.Books.Add(book);
            await _context.SaveChangesAsync();

            var bookDto = new BookDTO  
            {
                Id = book.Id,
                Title = book.Title,
                Author = book.Author,
                ISBN = book.ISBN,
                AvailableCopies = book.AvailableCopies
            };

            return CreatedAtAction(nameof(GetBook), new { id = book.Id }, bookDto);
        }

        
        [HttpPut("{id}")]
        public async Task<IActionResult> PutBook(int id, UpdateBookDTO updateBookDto)  
        {
            if (id != updateBookDto.Id) return BadRequest();

            var book = await _context.Books.FindAsync(id);
            if (book == null) return NotFound();

            book.Title = updateBookDto.Title;
            book.Author = updateBookDto.Author;
            book.ISBN = updateBookDto.ISBN;

            _context.Entry(book).State = EntityState.Modified;
            await _context.SaveChangesAsync();

            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBook(int id)
        {
           
            var book = await _context.Books.FindAsync(id);
            if (book == null) return NotFound();

            _context.Books.Remove(book);
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}