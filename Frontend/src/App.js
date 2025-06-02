import React from 'react';
import { BrowserRouter as Router, Routes, Route, Navigate } from 'react-router-dom';
import { AuthProvider, useAuth } from './context/AuthContext';
import Navigation from './components/Navigation';
import Login from './components/Login';
import Register from './components/Register';
import Books from './components/Books';
import Borrowers from './components/Borrowers';
import Loans from './components/Loans';

const PrivateRoute = ({ children }) => {
    const { isAuthenticated } = useAuth();
    return isAuthenticated ? children : <Navigate to="/login" />;
};

const App = () => {
    return (
        <AuthProvider>
            <Router>
                <div>
                    <Navigation />
                    <Routes>
                        <Route path="/login" element={<Login />} />
                        <Route path="/register" element={<Register />} />
                        <Route path="/books" element={
                            <PrivateRoute>
                                <Books />
                            </PrivateRoute>
                        } />
                        <Route path="/borrowers" element={
                            <PrivateRoute>
                                <Borrowers />
                            </PrivateRoute>
                        } />
                        <Route path="/loans" element={
                            <PrivateRoute>
                                <Loans />
                            </PrivateRoute>
                        } />
                        <Route path="/" element={
                            <PrivateRoute>
                                <Navigate to="/books" />
                            </PrivateRoute>
                        } />
                    </Routes>
                </div>
            </Router>
        </AuthProvider>
    );
};

export default App;
