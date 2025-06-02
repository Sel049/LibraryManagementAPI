# 📚 Library Management System

This is a full-stack web application built for library resource management. It enables administrators to manage books, borrowers, and lending operations efficiently. It also allows users to register, browse the catalog, borrow, and return books through a user-friendly interface.

---

## 🚀 Tech Stack (Unified)

The project combines both frontend and backend technologies in one cohesive system:

- **Frontend (React.js)**:  
  Builds the user interface where users and administrators interact with the system. Handles form submissions, UI rendering, and data fetching.

- **Backend (ASP.NET Core Web API)**:  
  Serves as the core logic and data handling layer. It receives requests from the frontend, processes them, and communicates with the database.

- **Database (SQL Server)**:  
  Stores all persistent data including users, books, and loan records.

- **Entity Framework Core**:  
  Acts as the Object-Relational Mapper (ORM), enabling backend logic to communicate with the database using C# objects.

- **JWT (JSON Web Tokens)**:  
  Provides secure authentication by issuing tokens to users upon login, which are then used for accessing protected endpoints.

---

## 🏗️ System Architecture

```
User Interface (React.js)
       ↓ API calls via Axios
ASP.NET Core Web API (Controllers, Services)
       ↓ EF Core ORM
   SQL Server Database
```

This structure allows a clear separation between the UI layer, the server logic, and the data storage, improving maintainability and scalability.

---

## 🔑 Main Features

- 🔐 User registration and login (with token-based auth)
- 📚 Add, edit, delete, and search books
- 🔄 Issue and return books with proper tracking
- ⏰ View and monitor overdue loans
- 👥 Role-based access: user vs admin
- 🧼 Clean and modern responsive UI

---

## 🔧 How to Run the Project

To run the **combined system** on your machine, follow the steps below:

### ✅ Prerequisites
- Node.js (for frontend)
- .NET 6 SDK (for backend)
- SQL Server (for database)

### 1. Setup the Backend
```bash
cd Backend
dotnet restore                   # Restore NuGet dependencies
dotnet ef database update        # Run EF Core migrations to create the DB
dotnet run                       # Start the API server (default: http://localhost:5000)
```

### 2. Setup the Frontend
```bash
cd Frontend
npm install                      # Install React dependencies
npm start                        # Run the development server (http://localhost:3000)
```

Ensure both servers are running concurrently. Axios in the frontend is configured to send requests to the backend running at `http://localhost:5000`.

---

## 📡 Sample API Endpoints

Here are some of the RESTful API endpoints used by the frontend:

### Authentication
- `POST /api/auth/register` – Register a new user
- `POST /api/auth/login` – Authenticate user and return a JWT token

### Books
- `GET /api/books` – Fetch all books
- `POST /api/books` – Add a new book (admin)
- `PUT /api/books/{id}` – Edit a book
- `DELETE /api/books/{id}` – Delete a book

### Loans
- `POST /api/loans` – Issue a book
- `POST /api/loans/return` – Return a borrowed book
- `GET /api/loans/overdue` – View overdue books

---

## 🖼️ Screenshots 

![Login Page](screenshots/login.png)
![Book Dashboard](screenshots/books.png)
```

## 👥 Group 4 Team Members & Contributions

| Name                                    | Contribution Area                |
|-----------------------------------------|----------------------------------|
| Berlin Wonde               ID:1501047   | Frontend UI development (React)  |
| Selman Mohammed            ID:1501463   | Backend APIs (Books, Loans)      |
| Hana Shegawered            ID:1501644   | Authentication & EF Core         |
| Eyerusalem Habtegebreal    ID:1501186   | Testing, Debugging, Documentation|

---

## 🧠 Learning Outcomes

- Gained hands-on experience integrating a React frontend with ASP.NET Core APIs
- Understood user authentication using JWT and secure token handling
- Practiced Entity Framework Core for relational DB access
- Learned API request handling, error management, and frontend-backend coordination

---

🤖 AI Assistance & References

---

During the development and documentation of this project, we utilized the following AI tools for code suggestions, architectural guidance, and documentation support:

ChatGPT (OpenAI) – For code review, API design feedback, and documentation assistance

DeepSeek – For generating boilerplate backend logic and form validation logic

Google Gemini – For UI layout ideas, CSS enhancements, and architectural clarifications
