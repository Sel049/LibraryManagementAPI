import React, { useState, useEffect } from 'react';
import {
  TableContainer,
  Table,
  TableHead,
  TableBody,
  TableRow,
  TableCell,
  IconButton,
  Alert,
  CircularProgress,
  Box,
} from '@mui/material';
import { AssignmentReturn as ReturnIcon } from '@mui/icons-material';
import api from '../utils/axios';

const LoansList = ({ onError, onReturn, isOverdue = false }) => {
  const [loans, setLoans] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchLoans = async () => {
      try {
        setLoading(true);
        const endpoint = isOverdue ? '/Loan/overdue' : '/Loan';
        const response = await api.get(endpoint);
        
        // Ensure we have an array of loans
        let loansData = [];
        if (Array.isArray(response.data)) {
          loansData = response.data;
        } else if (response.data && Array.isArray(response.data.value)) {
          loansData = response.data.value;
        } else if (response.data && typeof response.data === 'object') {
          // If we get an object response, try to extract meaningful error message
          throw new Error(response.data.message || 'Invalid response format');
        }
        
        setLoans(loansData);
      } catch (error) {
        console.error('Error fetching loans:', error);
        const errorMessage = error.response?.data?.message || error.message || 'Failed to fetch loans';
        onError?.(errorMessage);
      } finally {
        setLoading(false);
      }
    };

    fetchLoans();
  }, [isOverdue, onError]);

  const formatDate = (dateString) => {
    if (!dateString) return 'N/A';
    try {
      return new Date(dateString).toLocaleDateString();
    } catch (error) {
      return 'N/A';
    }
  };

  if (loading) {
    return (
      <Box display="flex" justifyContent="center" p={3}>
        <CircularProgress />
      </Box>
    );
  }

  if (!Array.isArray(loans) || loans.length === 0) {
    return (
      <Alert severity="info">
        {isOverdue ? 'No overdue loans found.' : 'No loans found.'}
      </Alert>
    );
  }

  return (
    <TableContainer>
      <Table>
        <TableHead>
          <TableRow>
            <TableCell>Book</TableCell>
            <TableCell>Borrower</TableCell>
            <TableCell>Loan Date</TableCell>
            <TableCell>Due Date</TableCell>
            {!isOverdue && <TableCell>Return Date</TableCell>}
            {isOverdue && <TableCell>Days Overdue</TableCell>}
            <TableCell>Actions</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {loans.map((loan) => {
            // Skip invalid loan entries
            if (!loan || typeof loan !== 'object' || !loan.id) {
              return null;
            }

            return (
              <TableRow 
                key={loan.id}
                sx={loan.daysOverdue > 0 ? { backgroundColor: 'error.light' } : undefined}
              >
                <TableCell>{loan.bookTitle || 'N/A'}</TableCell>
                <TableCell>{loan.borrowerName || 'N/A'}</TableCell>
                <TableCell>{formatDate(loan.loanDate)}</TableCell>
                <TableCell>{formatDate(loan.dueDate)}</TableCell>
                {!isOverdue && (
                  <TableCell>
                    {loan.returnDate ? formatDate(loan.returnDate) : 'Not returned'}
                  </TableCell>
                )}
                {isOverdue && (
                  <TableCell>{loan.daysOverdue || 0}</TableCell>
                )}
                <TableCell>
                  {!loan.returnDate && (
                    <IconButton 
                      onClick={() => {
                        try {
                          onReturn?.(loan.id);
                        } catch (error) {
                          console.error('Error returning loan:', error);
                          onError?.('Failed to return loan');
                        }
                      }} 
                      color="primary"
                      disabled={!loan.id}
                    >
                      <ReturnIcon />
                    </IconButton>
                  )}
                </TableCell>
              </TableRow>
            );
          })}
        </TableBody>
      </Table>
    </TableContainer>
  );
};

export default LoansList; 