import React, { useState, useEffect } from 'react';
import api from '../utils/axios';
import {
  Container,
  Paper,
  Typography,
  Button,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  TextField,
  Alert,
  MenuItem,
  Tabs,
  Tab,
  Box,
} from '@mui/material';
import {
  Add as AddIcon,
} from '@mui/icons-material';
import LoansList from './LoansList';

function TabPanel({ children, value, index }) {
  return (
    <div hidden={value !== index}>
      {value === index && <Box sx={{ p: 3 }}>{children}</Box>}
    </div>
  );
}

function Loans() {
  const [books, setBooks] = useState([]);
  const [borrowers, setBorrowers] = useState([]);
  const [open, setOpen] = useState(false);
  const [error, setError] = useState('');
  const [tabValue, setTabValue] = useState(0);
  const [formData, setFormData] = useState({
    bookId: '',
    borrowerId: '',
    dueDate: new Date(Date.now() + 12096e5).toISOString().split('T')[0] // 14 days from now
  });

  useEffect(() => {
    fetchBooks();
    fetchBorrowers();
  }, []);

  const fetchBooks = async () => {
    try {
      const response = await api.get('/Book');
      setBooks(Array.isArray(response.data) ? response.data : []);
    } catch (err) {
      console.error('Error fetching books:', err);
      setError('Failed to fetch books');
    }
  };

  const fetchBorrowers = async () => {
    try {
      const response = await api.get('/Borrower');
      setBorrowers(Array.isArray(response.data) ? response.data : []);
    } catch (err) {
      console.error('Error fetching borrowers:', err);
      setError('Failed to fetch borrowers');
    }
  };

  const handleOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
    setFormData({
      bookId: '',
      borrowerId: '',
      dueDate: new Date(Date.now() + 12096e5).toISOString().split('T')[0]
    });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const loanRequest = {
        bookId: parseInt(formData.bookId, 10),
        borrowerId: parseInt(formData.borrowerId, 10),
        dueDate: formData.dueDate
      };

      await api.post('/Loan', loanRequest);
      handleClose();
      // Force re-render of loan lists by toggling tab value
      const currentTab = tabValue;
      setTabValue(currentTab === 0 ? 1 : 0);
      setTimeout(() => setTabValue(currentTab), 100);
      fetchBooks();
    } catch (err) {
      console.error('Error creating loan:', err);
      setError(err.response?.data?.message || 'Failed to create loan');
    }
  };

  const handleReturn = async (loanId) => {
    try {
      await api.post(`/Loan/${loanId}/return`);
      // Force re-render of loan lists
      const currentTab = tabValue;
      setTabValue(currentTab === 0 ? 1 : 0);
      setTimeout(() => setTabValue(currentTab), 100);
      fetchBooks();
    } catch (err) {
      console.error('Error returning book:', err);
      setError('Failed to return book');
    }
  };

  const handleTabChange = (event, newValue) => {
    setTabValue(newValue);
    setError('');
  };

  const getAvailableBooks = () => {
    return books.filter(book => book.availableCopies > 0);
  };

  const handleError = (error) => {
    if (typeof error === 'string') {
      setError(error);
    } else if (error?.message) {
      setError(error.message);
    } else {
      setError('An unexpected error occurred');
    }
  };

  return (
    <Container>
      <Paper sx={{ p: 3, mb: 4 }}>
        <Typography variant="h5" component="h2" gutterBottom>
          Loans Management
        </Typography>
        
        {error && (
          <Alert severity="error" sx={{ mb: 2 }}>
            {error}
          </Alert>
        )}

        <Button
          variant="contained"
          startIcon={<AddIcon />}
          onClick={handleOpen}
          sx={{ mb: 3 }}
        >
          Create New Loan
        </Button>

        <Box sx={{ borderBottom: 1, borderColor: 'divider', mb: 2 }}>
          <Tabs value={tabValue} onChange={handleTabChange}>
            <Tab label="All Loans" />
            <Tab label="Overdue Loans" />
          </Tabs>
        </Box>

        <TabPanel value={tabValue} index={0}>
          <LoansList 
            onError={handleError}
            onReturn={handleReturn}
          />
        </TabPanel>

        <TabPanel value={tabValue} index={1}>
          <LoansList 
            onError={handleError}
            onReturn={handleReturn}
            isOverdue
          />
        </TabPanel>
      </Paper>

      <Dialog open={open} onClose={handleClose}>
        <DialogTitle>Create New Loan</DialogTitle>
        <form onSubmit={handleSubmit}>
          <DialogContent>
            <TextField
              select
              margin="dense"
              label="Book"
              fullWidth
              value={formData.bookId}
              onChange={(e) => setFormData({ ...formData, bookId: e.target.value })}
              required
            >
              {getAvailableBooks().map((book) => (
                <MenuItem key={book.id} value={book.id}>
                  {book.title} ({book.availableCopies} available)
                </MenuItem>
              ))}
            </TextField>
            <TextField
              select
              margin="dense"
              label="Borrower"
              fullWidth
              value={formData.borrowerId}
              onChange={(e) => setFormData({ ...formData, borrowerId: e.target.value })}
              required
            >
              {borrowers.map((borrower) => (
                <MenuItem key={borrower.id} value={borrower.id}>
                  {borrower.firstName} {borrower.lastName}
                </MenuItem>
              ))}
            </TextField>
            <TextField
              margin="dense"
              label="Due Date"
              type="date"
              fullWidth
              value={formData.dueDate}
              onChange={(e) => setFormData({ ...formData, dueDate: e.target.value })}
              required
              InputLabelProps={{
                shrink: true,
              }}
            />
          </DialogContent>
          <DialogActions>
            <Button onClick={handleClose}>Cancel</Button>
            <Button type="submit" variant="contained">
              Create Loan
            </Button>
          </DialogActions>
        </form>
      </Dialog>
    </Container>
  );
}

export default Loans; 