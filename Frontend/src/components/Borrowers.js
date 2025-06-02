import React, { useState, useEffect } from 'react';
import axios from 'axios';
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
  IconButton,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Alert,
} from '@mui/material';
import {
  Add as AddIcon,
  Edit as EditIcon,
  Delete as DeleteIcon,
} from '@mui/icons-material';

function Borrowers() {
  const [borrowers, setBorrowers] = useState([]);
  const [open, setOpen] = useState(false);
  const [editingBorrower, setEditingBorrower] = useState(null);
  const [error, setError] = useState('');
  const [formData, setFormData] = useState({
    firstName: '',
    lastName: '',
    email: '',
    phoneNumber: ''
  });

  const fetchBorrowers = async () => {
    try {
      const response = await axios.get('/api/Borrowers');
      setBorrowers(response.data);
    } catch (err) {
      console.error('Error fetching borrowers:', err);
      setError('Failed to fetch borrowers');
    }
  };

  useEffect(() => {
    fetchBorrowers();
  }, []);

  const handleOpen = (borrower = null) => {
    if (borrower) {
      setEditingBorrower(borrower);
      setFormData({
        firstName: borrower.firstName,
        lastName: borrower.lastName,
        email: borrower.email,
        phoneNumber: borrower.phoneNumber || ''
      });
    } else {
      setEditingBorrower(null);
      setFormData({
        firstName: '',
        lastName: '',
        email: '',
        phoneNumber: ''
      });
    }
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
    setEditingBorrower(null);
    setFormData({
      firstName: '',
      lastName: '',
      email: '',
      phoneNumber: ''
    });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      if (editingBorrower) {
        await axios.put(
          `/api/Borrowers/${editingBorrower.id}`,
          formData
        );
      } else {
        await axios.post(
          '/api/Borrowers',
          formData
        );
      }
      handleClose();
      fetchBorrowers();
    } catch (err) {
      console.error('Error saving borrower:', err);
      setError(err.response?.data?.message || 'Failed to save borrower');
    }
  };

  const handleDelete = async (id) => {
    if (window.confirm('Are you sure you want to delete this borrower?')) {
      try {
        await axios.delete(`/api/Borrowers/${id}`);
        fetchBorrowers();
      } catch (err) {
        console.error('Error deleting borrower:', err);
        setError('Failed to delete borrower');
      }
    }
  };

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({
      ...prev,
      [name]: value
    }));
  };

  return (
    <Container>
      <Paper sx={{ p: 3, mb: 4 }}>
        <Typography variant="h5" component="h2" gutterBottom>
          Borrowers Management
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
          Add New Borrower
        </Button>

        <TableContainer>
          <Table>
            <TableHead>
              <TableRow>
                <TableCell>First Name</TableCell>
                <TableCell>Last Name</TableCell>
                <TableCell>Email</TableCell>
                <TableCell>Phone Number</TableCell>
                <TableCell>Actions</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {borrowers.map((borrower) => (
                <TableRow key={borrower.id}>
                  <TableCell>{borrower.firstName}</TableCell>
                  <TableCell>{borrower.lastName}</TableCell>
                  <TableCell>{borrower.email}</TableCell>
                  <TableCell>{borrower.phoneNumber}</TableCell>
                  <TableCell>
                    <IconButton onClick={() => handleOpen(borrower)} color="primary">
                      <EditIcon />
                    </IconButton>
                    <IconButton onClick={() => handleDelete(borrower.id)} color="error">
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
        <DialogTitle>{editingBorrower ? 'Edit Borrower' : 'Add New Borrower'}</DialogTitle>
        <form onSubmit={handleSubmit}>
          <DialogContent>
            <TextField
              autoFocus
              margin="dense"
              label="First Name"
              name="firstName"
              fullWidth
              value={formData.firstName}
              onChange={handleChange}
              required
            />
            <TextField
              margin="dense"
              label="Last Name"
              name="lastName"
              fullWidth
              value={formData.lastName}
              onChange={handleChange}
              required
            />
            <TextField
              margin="dense"
              label="Email"
              name="email"
              type="email"
              fullWidth
              value={formData.email}
              onChange={handleChange}
              required
            />
            <TextField
              margin="dense"
              label="Phone Number"
              name="phoneNumber"
              fullWidth
              value={formData.phoneNumber}
              onChange={handleChange}
            />
          </DialogContent>
          <DialogActions>
            <Button onClick={handleClose}>Cancel</Button>
            <Button type="submit" variant="contained">
              {editingBorrower ? 'Save' : 'Add'}
            </Button>
          </DialogActions>
        </form>
      </Dialog>
    </Container>
  );
}

export default Borrowers; 