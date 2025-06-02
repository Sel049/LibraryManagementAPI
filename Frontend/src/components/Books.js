import React, { useState, useEffect } from 'react';
import {
  Container,
  Paper,
  Typography,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Button,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  TextField,
  IconButton,
  Alert,
} from '@mui/material';
import {
  Add as AddIcon,
  Edit as EditIcon,
  Delete as DeleteIcon,
} from '@mui/icons-material';
import api from '../utils/axios';

const Books = () => {
  const [books, setBooks] = useState([]);
  const [error, setError] = useState('');
  const [open, setOpen] = useState(false);
  const [editingBook, setEditingBook] = useState(null);
  const [formData, setFormData] = useState({
    title: '',
    author: '',
    isbn: '',
    totalCopies: 1
  });

  useEffect(() => {
    fetchBooks();
  }, []);

  const fetchBooks = async () => {
    try {
      const response = await api.get('/Books');
      setBooks(response.data);
    } catch (err) {
      setError('Failed to fetch books');
      console.error('Error fetching books:', err);
    }
  };

  const handleOpen = (book = null) => {
    if (book) {
      setEditingBook(book);
      setFormData({
        title: book.title,
        author: book.author,
        isbn: book.isbn,
        totalCopies: book.totalCopies
      });
    } else {
      setEditingBook(null);
      setFormData({
        title: '',
        author: '',
        isbn: '',
        totalCopies: 1
      });
    }
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
    setEditingBook(null);
    setFormData({
      title: '',
      author: '',
      isbn: '',
      totalCopies: 1
    });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      if (editingBook) {
        await api.put(`/Books/${editingBook.id}`, formData);
      } else {
        await api.post('/Books', formData);
      }
      handleClose();
      fetchBooks();
    } catch (err) {
      console.error('Error saving book:', err);
      setError(err.response?.data?.message || 'Failed to save book');
    }
  };

  const handleDelete = async (bookId) => {
    if (window.confirm('Are you sure you want to delete this book?')) {
      try {
        await api.delete(`/Books/${bookId}`);
        fetchBooks();
      } catch (err) {
        console.error('Error deleting book:', err);
        setError('Failed to delete book');
      }
    }
  };

  return (
    <Container>
      <Paper sx={{ p: 3, mt: 4 }}>
        <Typography variant="h5" component="h2" gutterBottom>
          Books Management
        </Typography>

        {error && (
          <Alert severity="error" sx={{ mb: 2 }}>
            {error}
          </Alert>
        )}

        <Button
          variant="contained"
          startIcon={<AddIcon />}
          onClick={() => handleOpen()}
          sx={{ mb: 3 }}
        >
          Add New Book
        </Button>
        
        <TableContainer>
          <Table>
            <TableHead>
              <TableRow>
                <TableCell>Title</TableCell>
                <TableCell>Author</TableCell>
                <TableCell>ISBN</TableCell>
                <TableCell>Available Copies</TableCell>
                <TableCell>Actions</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {books.map((book) => (
                <TableRow key={book.id}>
                  <TableCell>{book.title}</TableCell>
                  <TableCell>{book.author}</TableCell>
                  <TableCell>{book.isbn}</TableCell>
                  <TableCell>{book.availableCopies}</TableCell>
                  <TableCell>
                    <IconButton onClick={() => handleOpen(book)} color="primary">
                      <EditIcon />
                    </IconButton>
                    <IconButton onClick={() => handleDelete(book.id)} color="error">
                      <DeleteIcon />
                    </IconButton>
                  </TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
        </TableContainer>
      </Paper>

      <Dialog open={open} onClose={handleClose}>
        <DialogTitle>{editingBook ? 'Edit Book' : 'Add New Book'}</DialogTitle>
        <form onSubmit={handleSubmit}>
          <DialogContent>
            <TextField
              margin="dense"
              label="Title"
              fullWidth
              value={formData.title}
              onChange={(e) => setFormData({ ...formData, title: e.target.value })}
              required
            />
            <TextField
              margin="dense"
              label="Author"
              fullWidth
              value={formData.author}
              onChange={(e) => setFormData({ ...formData, author: e.target.value })}
              required
            />
            <TextField
              margin="dense"
              label="ISBN"
              fullWidth
              value={formData.isbn}
              onChange={(e) => setFormData({ ...formData, isbn: e.target.value })}
              required
            />
            <TextField
              margin="dense"
              label="Total Copies"
              type="number"
              fullWidth
              value={formData.totalCopies}
              onChange={(e) => setFormData({ ...formData, totalCopies: parseInt(e.target.value) })}
              required
              inputProps={{ min: 1 }}
            />
          </DialogContent>
          <DialogActions>
            <Button onClick={handleClose}>Cancel</Button>
            <Button type="submit" variant="contained">
              {editingBook ? 'Save Changes' : 'Add Book'}
            </Button>
          </DialogActions>
        </form>
      </Dialog>
    </Container>
  );
};

export default Books; 