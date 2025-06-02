import React, { useState } from 'react';
import { useNavigate, Link as RouterLink } from 'react-router-dom';
import axios from 'axios';
import {
  Container,
  Paper,
  TextField,
  Button,
  Typography,
  Box,
  Link,
  Alert,
} from '@mui/material';
import { PersonAdd as RegisterIcon } from '@mui/icons-material';

function Register() {
  const [formData, setFormData] = useState({
    username: '',
    email: '',
    password: '',
    confirmPassword: ''
  });
  const [error, setError] = useState('');
  const navigate = useNavigate();

  const validateForm = () => {
    if (!formData.username || formData.username.length < 3) {
      setError('Username must be at least 3 characters long');
      return false;
    }
    
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(formData.email)) {
      setError('Please enter a valid email address');
      return false;
    }

    if (formData.password.length < 6) {
      setError('Password must be at least 6 characters long');
      return false;
    }

    if (formData.password !== formData.confirmPassword) {
      setError('Passwords do not match');
      return false;
    }

    return true;
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError('');

    if (!validateForm()) {
      return;
    }

    try {
      console.log('Attempting registration with:', {
        username: formData.username,
        email: formData.email
      });

      const response = await axios.post('/api/Auth/register', {
        username: formData.username,
        email: formData.email,
        password: formData.password
      });

      console.log('Registration response:', response.data);

      if (response.data && response.data.message) {
        // Show success message
        alert(response.data.message);
        navigate('/login');
      } else {
        setError('Unexpected response from server');
      }
    } catch (err) {
      console.error('Registration error:', {
        message: err.message,
        status: err.response?.status,
        data: err.response?.data
      });

      if (err.response?.status === 400) {
        // Handle validation errors from the server
        if (err.response.data.errors) {
          const errorMessages = Object.values(err.response.data.errors)
            .flat()
            .join(', ');
          setError(`Validation failed: ${errorMessages}`);
        } else {
          setError(err.response.data.message || 'Invalid registration data');
        }
      } else if (err.message === 'Network Error') {
        setError('Unable to connect to the server. Please check your internet connection.');
      } else {
        setError(err.response?.data?.message || 'Registration failed. Please try again.');
      }
    }
  };

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({
      ...prev,
      [name]: value
    }));
    // Clear error when user starts typing
    setError('');
  };

  return (
    <Container component="main" maxWidth="xs">
      <Paper elevation={3} sx={{ p: 4, mt: 8, display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
        <Typography component="h1" variant="h5" sx={{ mb: 3 }}>
          Create Account
        </Typography>
        
        {error && (
          <Alert severity="error" sx={{ mb: 2, width: '100%' }}>
            {error}
          </Alert>
        )}

        <Box component="form" onSubmit={handleSubmit} sx={{ width: '100%' }}>
          <TextField
            margin="normal"
            required
            fullWidth
            label="Username"
            name="username"
            value={formData.username}
            onChange={handleChange}
            autoFocus
            inputProps={{ minLength: 3 }}
            helperText="Username must be at least 3 characters long"
          />
          <TextField
            margin="normal"
            required
            fullWidth
            label="Email"
            name="email"
            type="email"
            value={formData.email}
            onChange={handleChange}
            helperText="Please enter a valid email address"
          />
          <TextField
            margin="normal"
            required
            fullWidth
            label="Password"
            name="password"
            type="password"
            value={formData.password}
            onChange={handleChange}
            inputProps={{ minLength: 6 }}
            helperText="Password must be at least 6 characters long"
          />
          <TextField
            margin="normal"
            required
            fullWidth
            label="Confirm Password"
            name="confirmPassword"
            type="password"
            value={formData.confirmPassword}
            onChange={handleChange}
          />
          <Button
            type="submit"
            fullWidth
            variant="contained"
            sx={{ mt: 3, mb: 2 }}
            startIcon={<RegisterIcon />}
          >
            Register
          </Button>
          <Box sx={{ textAlign: 'center' }}>
            <Link component={RouterLink} to="/login" variant="body2">
              {"Already have an account? Sign In"}
            </Link>
          </Box>
        </Box>
      </Paper>
    </Container>
  );
}

export default Register; 