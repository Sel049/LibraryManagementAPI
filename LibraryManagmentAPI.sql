/****** Object:  Database [LibraryManagementDB]    Script Date: 6/2/2025 7:20:17 PM ******/
CREATE DATABASE [LibraryManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryManagementDB', FILENAME = N'C:\Users\COMPUTER\LibraryManagementDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LibraryManagementDB_log', FILENAME = N'C:\Users\COMPUTER\LibraryManagementDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LibraryManagementDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LibraryManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LibraryManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryManagementDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [LibraryManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LibraryManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryManagementDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibraryManagementDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LibraryManagementDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LibraryManagementDB] SET QUERY_STORE = OFF
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/2/2025 7:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 6/2/2025 7:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/2/2025 7:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/2/2025 7:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/2/2025 7:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/2/2025 7:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/2/2025 7:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 6/2/2025 7:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 6/2/2025 7:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](max) NOT NULL,
	[ISBN] [nvarchar](max) NOT NULL,
	[TotalCopies] [int] NOT NULL,
	[AvailableCopies] [int] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Borrowers]    Script Date: 6/2/2025 7:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrowers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Borrowers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loans]    Script Date: 6/2/2025 7:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loans](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[BorrowerId] [int] NOT NULL,
	[LoanDate] [datetime2](7) NOT NULL,
	[DueDate] [datetime2](7) NOT NULL,
	[ReturnDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Loans] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250526192017_InitialCreate', N'8.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250526211113_AddBorrowers', N'8.0.5')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'0142ffc6-2ebf-4ec5-91c1-8e789b6b6ebc', N'Abebe', N'ABEBE', N'abebe@gmail.com', N'ABEBE@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEAJdfQjZvDZiSMf9hQNoX0Q2lBKwQMOHjMbD32Q1SiasX3mwydtS1NfvmHik8qjoUA==', N'2ZFOQPGTUP5S35OJ3KAFOADWT7QNKXOA', N'd0a86eac-071c-42f8-98d8-a34e9763b7f2', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1344ee5d-1827-499d-ac73-fc880e52d3e0', N'birhan', N'BIRHAN', N'bire@gmail.com', N'BIRE@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEP0wdR6aEsOdGpwVy1+w6JxWNTJV4Ikrn6HWh016kuWH3iw7oWpOIIioKY2s4wOt7A==', N'6S5DZLOKJLMXKSYRTNIITDQYYG76UIDO', N'adbad14a-a687-4900-bae2-3bfb7f9c78c9', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'13dff9da-f5aa-43a9-9166-11bada442797', N'test321', N'TEST321', N'test@gmail.com', N'TEST@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEHGR6iOMERCIX8HGCxysbe05bMr/hAjyEtNWLq+O1/j/DyBb2Sg9iKJ5HZ22/OkSOQ==', N'FD2IDD4ALIFIQQL22VQMPU2A4EEZWJ7K', N'f6adeb31-88db-4439-a089-a60cfbab512a', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'21ada077-4f61-468f-84a9-4c7ac3756879', N'testuser', N'TESTUSER', N'testuser@gmail.com', N'TESTUSER@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEGb1+qt1ocMby7G5dcfmfCe6z01iwJanZzAqMnv6ltmCaEN1LbNlloLHz/i7d3ZHyw==', N'D45O3TKXAYVOD32ABRN7GNWFFLQNJWNU', N'8f7c4bb9-4216-4903-be44-c315cf3b4ef2', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'420ca020-4720-4315-8a24-617f8f6fff8e', N'Semal', N'SEMAL', N'sse@gmail.com', N'SSE@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAECCPXM9wQ0CTyftWAMogXS0X4sRitdv6frVQSm4pt3tX9dzwGL44Y4Q+3q/4qWIqGA==', N'CXSLDZRHXJ2NQ6UXKZRJMMGQIR6OSI5H', N'75ddcee3-2a31-4748-8c16-ce8a098ccd09', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'46f9fd0b-4fc9-4736-add5-16a6a67eab55', N'selam321', N'SELAM321', N'selam@gmail.com', N'SELAM@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEAPLVNOYJJNSKnbMDmsGHZFVmAlNM2hLg4s0SEJpD62lAil6WGBPgubDKWAPw8dl8w==', N'KXO72R76L2ANTICETPWL4DOTU5EE4RBS', N'72ca81d2-3fc5-4aa4-b4fb-723251a9a3a0', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'5980130d-f5f5-43e9-83cd-c88e3100bca0', N'selman321', N'SELMAN321', N'selman321@gmail.com', N'SELMAN321@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEJWCXzZX4HmlXFc0/6LzrJacmESkmVbAm7kXclg3XCnohSUOT/3RHwEyjh7p7IqVqQ==', N'5MW33VMA77EXXKMMDWHOXKRCRHXF5CTD', N'63e52b80-4d8e-4314-be79-ef7662aa0695', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'62d864f4-f9f9-4273-bdff-b74c5afe377b', N'naol321', N'NAOL321', N'naol@321.com', N'NAOL@321.COM', 0, N'AQAAAAIAAYagAAAAEGRIHCsE3geh0uz0dzlZ6KtKrT3mMpzAfe4/nYC+TWhBtE+PqGoozLVHnqR5l51usw==', N'2KZXR7AQ63FAD3ZRRUXRFRXZLLO3TWXY', N'5c8edaad-3f67-43bd-9afe-f3330a68f2ba', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'72114a34-0ca4-4d1b-9e39-098359c42e73', N'shegaw', N'SHEGAW', N'shegaw@2345', N'SHEGAW@2345', 0, N'AQAAAAIAAYagAAAAEMGtmLvBx5tbEoPot4qYvLjReTcGicAO+XQjSAYEqQc3UWl46FeWpN7XmfK+iYf2Cg==', N'R7XZL3HOLCFYS6ZRFXNNNUCVQKCMLVOE', N'22e09e07-b55c-4be0-98bf-0417f5b41fc4', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8ea6479c-b247-45ae-bea8-5fa41481aaf5', N'awole', N'AWOLE', N'awole@gmail.com', N'AWOLE@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEBz4r52xcwaRWtaPVWlvYfnufJUBrAHBVEbHv+9PeHTc6kFUMPBBADbB2mR7XqVocQ==', N'CXT3JCW22HGFAQBX56O6TII567HOEUWH', N'8178aecd-b497-4056-a222-9dc6e4255c38', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'99d994b1-3fd8-4bfe-93ad-b08001705a49', N'sberg', N'SBERG', N'bshegye@gmail.com', N'BSHEGYE@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEE45FwCBGHOzg2BHtIxilI+bazFgWggaVXOD3DitHD1+cE+/o0SIPRyuvub02Pq8hg==', N'QUENPQNKLX4R3Q2DQFTCWQ4OCE64226Z', N'20eb3731-c5fd-4647-a472-831cbe9a55fe', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a108df72-03a1-4460-acea-361e7e368156', N'selman1463', N'SELMAN1463', N'selman@1463', N'SELMAN@1463', 0, N'AQAAAAIAAYagAAAAENTBFLfJXxNvHTVQKw+230qAYBN6tGdRHm7ZblgGeoPAfhB6KdQ8MlnZOWDVgKjGRg==', N'FSLNFIJWOC42QMYQ6LSMD6B2XQHHYOTJ', N'a2a6cf06-575a-43b0-967b-e44d57a74d12', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a4737fc8-170a-434c-bd5e-d942dd9ecc25', N'tesfu', N'TESFU', N'tesfu@gmail.com', N'TESFU@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEM05/U5vdk0zGzZzTF84LPpZrQakvkvx+DX3qRjmdOl1kcMfXJwTXcNXlq06uVpw9A==', N'IO43B2KISYY6QRCJF3AJT2VWLQ5UTG4R', N'1d753c51-b540-4e72-a6da-d422013b1830', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c3f122dd-ab97-49f8-8f2f-35b567e67012', N'ADMIN', N'ADMIN', N'Selman@gmail.com', N'SELMAN@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEIZgHVjWFgRQyBD5DjlOf+MyvKPgfeNQnfg+52axaue/SxBM6JegxjeflRBnFOQ8mw==', N'QQ3UB5SCDIYB76LRRVJZVCA23IWH6WJ2', N'e4ee9d9f-3e02-4055-8b08-4bee47f78444', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ce3df65a-7f95-40ae-b826-2e5fd4af8939', N'test', N'TEST', N'test@gmail.com', N'TEST@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEJpQWlTZLcq6K67wMnZZ7hEcVqor+vTSLVlENVIoTBsaCgqvXlyWYO21wjKttciqEQ==', N'XIAXJMPCRIP66AQNIEA2Q2QEA3L67QE2', N'21878ac4-4ac8-434f-9bd3-b4239f4e2e69', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ea3895f5-ac44-4dfd-8b6a-5af8e2a85648', N'selman123', N'SELMAN123', N'selman@gmail.com', N'SELMAN@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEHXdEFJo5tr0z1qfTLv8+sYff8VXqHUlwKWu1nl2zPMjZZ9IoOP7DZ6vnQUZv1hKdg==', N'SGETQ6IP3QENN6HKQAAD6YXE53JLXL4G', N'1d0892a6-22e2-47e7-b1c4-5afcee8740a8', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'f76baecb-f7da-4e30-8a81-e353bfd82186', N'abbe', N'ABBE', N'Abebe@gmail.com', N'ABEBE@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAECRKVFghfbFv3EyGnbxd+vypu0pzFnq6Fe+/utuNHD1wjzFI7b7d5jVEHWnMBZDdiA==', N'I4GRU56I55753J7ZTBCZZDYGCOJGKJEF', N'f59f2533-b404-434b-8215-cd3d56e45fe0', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [Title], [Author], [ISBN], [TotalCopies], [AvailableCopies]) VALUES (1, N'FIkr eske mekabir', N'hadis alemayehu', N'234567', 5, 4)
INSERT [dbo].[Books] ([Id], [Title], [Author], [ISBN], [TotalCopies], [AvailableCopies]) VALUES (3, N'OROMAY', N'BEALU GIRMA', N'45678', 5, 0)
INSERT [dbo].[Books] ([Id], [Title], [Author], [ISBN], [TotalCopies], [AvailableCopies]) VALUES (5, N'How to be a rich', N'cristopher sdc', N'2345678', 5, 4)
INSERT [dbo].[Books] ([Id], [Title], [Author], [ISBN], [TotalCopies], [AvailableCopies]) VALUES (7, N'MERB''bit', N'alemayehu wase ', N'45678', 1, 0)
INSERT [dbo].[Books] ([Id], [Title], [Author], [ISBN], [TotalCopies], [AvailableCopies]) VALUES (8, N'Zgor''a', N'alemayehu wassie', N'34567', 1, 1)
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Borrowers] ON 

INSERT [dbo].[Borrowers] ([Id], [FirstName], [LastName], [Email], [PhoneNumber]) VALUES (2, N'SELMAN', N'Mohammed', N'kalki@gmail.com', N'+25193456789')
INSERT [dbo].[Borrowers] ([Id], [FirstName], [LastName], [Email], [PhoneNumber]) VALUES (3, N'kalkida', N'anberbir', N'kalkidan@gmail.com', N'345675678')
INSERT [dbo].[Borrowers] ([Id], [FirstName], [LastName], [Email], [PhoneNumber]) VALUES (4, N'tesfu', N'anberbir', N'Abebe@1234', N'+23456784567')
SET IDENTITY_INSERT [dbo].[Borrowers] OFF
GO
SET IDENTITY_INSERT [dbo].[Loans] ON 

INSERT [dbo].[Loans] ([Id], [BookId], [BorrowerId], [LoanDate], [DueDate], [ReturnDate]) VALUES (2, 1, 2, CAST(N'2025-05-27T23:10:14.6044070' AS DateTime2), CAST(N'2025-06-10T23:10:14.6044168' AS DateTime2), NULL)
INSERT [dbo].[Loans] ([Id], [BookId], [BorrowerId], [LoanDate], [DueDate], [ReturnDate]) VALUES (3, 5, 2, CAST(N'2025-05-29T22:37:05.7484704' AS DateTime2), CAST(N'2025-06-12T22:37:05.7487185' AS DateTime2), NULL)
INSERT [dbo].[Loans] ([Id], [BookId], [BorrowerId], [LoanDate], [DueDate], [ReturnDate]) VALUES (4, 3, 3, CAST(N'2025-05-29T22:50:24.6459835' AS DateTime2), CAST(N'2025-06-12T22:50:24.6459885' AS DateTime2), NULL)
INSERT [dbo].[Loans] ([Id], [BookId], [BorrowerId], [LoanDate], [DueDate], [ReturnDate]) VALUES (5, 7, 2, CAST(N'2025-05-29T23:31:33.7823059' AS DateTime2), CAST(N'2025-06-12T23:31:33.7823113' AS DateTime2), NULL)
INSERT [dbo].[Loans] ([Id], [BookId], [BorrowerId], [LoanDate], [DueDate], [ReturnDate]) VALUES (6, 3, 3, CAST(N'2025-05-29T23:34:23.0608714' AS DateTime2), CAST(N'2025-06-12T23:34:23.0608781' AS DateTime2), NULL)
INSERT [dbo].[Loans] ([Id], [BookId], [BorrowerId], [LoanDate], [DueDate], [ReturnDate]) VALUES (7, 3, 3, CAST(N'2025-05-29T23:57:03.8943290' AS DateTime2), CAST(N'2025-06-12T23:57:03.8943355' AS DateTime2), NULL)
INSERT [dbo].[Loans] ([Id], [BookId], [BorrowerId], [LoanDate], [DueDate], [ReturnDate]) VALUES (8, 3, 2, CAST(N'2025-05-30T01:14:35.8899396' AS DateTime2), CAST(N'2025-06-13T01:14:35.8899434' AS DateTime2), NULL)
INSERT [dbo].[Loans] ([Id], [BookId], [BorrowerId], [LoanDate], [DueDate], [ReturnDate]) VALUES (9, 3, 3, CAST(N'2025-05-30T01:14:56.9433344' AS DateTime2), CAST(N'2025-06-13T01:14:56.9433388' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Loans] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 6/2/2025 7:20:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 6/2/2025 7:20:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 6/2/2025 7:20:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 6/2/2025 7:20:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 6/2/2025 7:20:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 6/2/2025 7:20:18 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 6/2/2025 7:20:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Loans_BookId]    Script Date: 6/2/2025 7:20:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Loans_BookId] ON [dbo].[Loans]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Loans_BorrowerId]    Script Date: 6/2/2025 7:20:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Loans_BorrowerId] ON [dbo].[Loans]
(
	[BorrowerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Loans]  WITH CHECK ADD  CONSTRAINT [FK_Loans_Books_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Loans] CHECK CONSTRAINT [FK_Loans_Books_BookId]
GO
ALTER TABLE [dbo].[Loans]  WITH CHECK ADD  CONSTRAINT [FK_Loans_Borrowers_BorrowerId] FOREIGN KEY([BorrowerId])
REFERENCES [dbo].[Borrowers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Loans] CHECK CONSTRAINT [FK_Loans_Borrowers_BorrowerId]
GO
ALTER DATABASE [LibraryManagementDB] SET  READ_WRITE 
GO
