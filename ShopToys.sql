USE [master]
GO
/****** Object:  Database [ManagerShopPRN211]    Script Date: 3/22/2024 10:09:16 AM ******/
CREATE DATABASE [ManagerShopPRN211]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ManagerShopPRN211', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ManagerShopPRN211.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ManagerShopPRN211_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ManagerShopPRN211_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ManagerShopPRN211] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ManagerShopPRN211].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ManagerShopPRN211] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ManagerShopPRN211] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ManagerShopPRN211] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ManagerShopPRN211] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ManagerShopPRN211] SET ARITHABORT OFF 
GO
ALTER DATABASE [ManagerShopPRN211] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ManagerShopPRN211] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ManagerShopPRN211] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ManagerShopPRN211] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ManagerShopPRN211] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ManagerShopPRN211] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ManagerShopPRN211] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ManagerShopPRN211] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ManagerShopPRN211] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ManagerShopPRN211] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ManagerShopPRN211] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ManagerShopPRN211] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ManagerShopPRN211] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ManagerShopPRN211] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ManagerShopPRN211] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ManagerShopPRN211] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ManagerShopPRN211] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ManagerShopPRN211] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ManagerShopPRN211] SET  MULTI_USER 
GO
ALTER DATABASE [ManagerShopPRN211] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ManagerShopPRN211] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ManagerShopPRN211] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ManagerShopPRN211] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ManagerShopPRN211] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ManagerShopPRN211] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ManagerShopPRN211] SET QUERY_STORE = OFF
GO
USE [ManagerShopPRN211]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/22/2024 10:09:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/22/2024 10:09:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/22/2024 10:09:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](150) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/22/2024 10:09:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](400) NULL,
	[FullName] [nvarchar](100) NULL,
	[BirthDay] [date] NULL,
	[Phone] [varchar](10) NULL,
	[Address] [nvarchar](450) NULL,
	[AvatarImage] [varchar](200) NULL,
	[Active] [bit] NOT NULL,
	[AccountID] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 3/22/2024 10:09:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](400) NULL,
	[FullName] [nvarchar](100) NULL,
	[BirthDay] [date] NULL,
	[Phone] [varchar](10) NULL,
	[Address] [nvarchar](450) NULL,
	[AvatarImage] [varchar](200) NULL,
	[AccountID] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/22/2024 10:09:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[TransactStatusID] [int] NULL,
	[Cannel] [bit] NULL,
	[Paid] [bit] NULL,
	[PayDate] [datetime] NULL,
	[PaymentID] [int] NULL,
	[Note] [nvarchar](500) NULL,
	[ShipperID] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/22/2024 10:09:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[Discount] [int] NULL,
	[Total] [money] NULL,
	[ShippedDate] [datetime] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/22/2024 10:09:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[CategoryID] [int] NULL,
	[Image] [varchar](250) NULL,
	[Description] [nvarchar](2000) NULL,
	[Price] [money] NULL,
	[Status] [nvarchar](50) NULL,
	[QuantityInStock] [int] NOT NULL,
	[Discount] [int] NULL,
	[Image2] [varchar](250) NULL,
	[Image3] [varchar](250) NULL,
	[Image4] [varchar](250) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/22/2024 10:09:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipper]    Script Date: 3/22/2024 10:09:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipper](
	[ShipperID] [int] IDENTITY(1,1) NOT NULL,
	[ShipperName] [nvarchar](150) NULL,
	[Phone] [varchar](10) NULL,
	[Company] [nvarchar](300) NULL,
	[ShipDate] [datetime] NULL,
 CONSTRAINT [PK_Shipper] PRIMARY KEY CLUSTERED 
(
	[ShipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactStatus]    Script Date: 3/22/2024 10:09:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactStatus](
	[TransactStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](200) NULL,
	[Note] [nvarchar](500) NULL,
 CONSTRAINT [PK_TransactStatus] PRIMARY KEY CLUSTERED 
(
	[TransactStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (8, N'customer1', N'Password1', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (9, N'employee', N'Password1', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (10, N'employeeReal', N'Password1', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (11, N'john_doe', N'password123', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (12, N'alice_smith', N'password123', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (13, N'bob_johnson', N'password123', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (14, N'emma_davis', N'password123', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (15, N'michael_clark', N'password123', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (16, N'sarah_adams', N'password123', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (17, N'david_miller', N'password123', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (18, N'laura_harris', N'password123', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (19, N'james_wilson', N'password123', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (20, N'olivia_thompson', N'password123', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (21, N'john_doe', N'securepass456', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (22, N'alice_smith', N'securepass456', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (23, N'bob_johnson', N'securepass456', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (24, N'emma_davis', N'securepass456', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (25, N'michael_clark', N'securepass456', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (26, N'sarah_adams', N'securepass456', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (27, N'david_miller', N'securepass456', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (28, N'laura_harris', N'securepass456', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (29, N'james_wilson', N'securepass456', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (30, N'olivia_thompson', N'securepass456', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (31, N'john_doe', N'strongpwd789', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (32, N'alice_smith', N'strongpwd789', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (33, N'bob_johnson', N'strongpwd789', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (34, N'emma_davis', N'strongpwd789', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (35, N'michael_clark', N'strongpwd789', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (36, N'sarah_adams', N'strongpwd789', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (37, N'david_miller', N'strongpwd789', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (38, N'laura_harris', N'strongpwd789', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (39, N'james_wilson', N'strongpwd789', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (40, N'olivia_thompson', N'strongpwd789', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (41, N'john_doe', N'letmein', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (42, N'alice_smith', N'letmein', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (43, N'bob_johnson', N'letmein', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (44, N'emma_davis', N'letmein', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (45, N'michael_clark', N'letmein', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (46, N'sarah_adams', N'letmein', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (47, N'david_miller', N'letmein', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (48, N'laura_harris', N'letmein', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (49, N'james_wilson', N'letmein', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (50, N'olivia_thompson', N'letmein', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (51, N'john_doe', N'mypassword', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (52, N'alice_smith', N'mypassword', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (53, N'bob_johnson', N'mypassword', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (54, N'emma_davis', N'mypassword', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (55, N'michael_clark', N'mypassword', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (56, N'sarah_adams', N'mypassword', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (57, N'david_miller', N'mypassword', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (58, N'laura_harris', N'mypassword', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (59, N'james_wilson', N'mypassword', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (60, N'olivia_thompson', N'mypassword', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (61, N'john_doe', N'p@ssw0rd', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (62, N'alice_smith', N'p@ssw0rd', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (63, N'bob_johnson', N'p@ssw0rd', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (64, N'emma_davis', N'p@ssw0rd', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (65, N'michael_clark', N'p@ssw0rd', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (66, N'sarah_adams', N'p@ssw0rd', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (67, N'david_miller', N'p@ssw0rd', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (68, N'laura_harris', N'p@ssw0rd', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (69, N'james_wilson', N'p@ssw0rd', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (70, N'olivia_thompson', N'p@ssw0rd', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (71, N'john_doe', N'qwerty123', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (72, N'alice_smith', N'qwerty123', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (73, N'bob_johnson', N'qwerty123', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (74, N'emma_davis', N'qwerty123', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (75, N'michael_clark', N'qwerty123', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (76, N'sarah_adams', N'qwerty123', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (77, N'david_miller', N'qwerty123', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (78, N'laura_harris', N'qwerty123', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (79, N'james_wilson', N'qwerty123', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (80, N'olivia_thompson', N'qwerty123', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (81, N'john_doe', N'password!', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (82, N'alice_smith', N'password!', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (83, N'bob_johnson', N'password!', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (84, N'emma_davis', N'password!', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (85, N'michael_clark', N'password!', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (86, N'sarah_adams', N'password!', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (87, N'david_miller', N'password!', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (88, N'laura_harris', N'password!', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (89, N'james_wilson', N'password!', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (90, N'olivia_thompson', N'password!', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (91, N'john_doe', N'changeme', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (92, N'alice_smith', N'changeme', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (93, N'bob_johnson', N'changeme', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (94, N'emma_davis', N'changeme', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (95, N'michael_clark', N'changeme', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (96, N'sarah_adams', N'changeme', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (97, N'david_miller', N'changeme', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (98, N'laura_harris', N'changeme', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (99, N'james_wilson', N'changeme', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (100, N'olivia_thompson', N'changeme', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (101, N'john_doe', N'123456789', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (102, N'alice_smith', N'123456789', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (103, N'bob_johnson', N'123456789', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (104, N'emma_davis', N'123456789', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (105, N'michael_clark', N'123456789', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (106, N'sarah_adams', N'123456789', 2, 1)
GO
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (107, N'david_miller', N'123456789', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (108, N'laura_harris', N'123456789', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (109, N'james_wilson', N'123456789', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (110, N'olivia_thompson', N'123456789', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (112, N'admin', N'admin123', 1, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Active]) VALUES (113, N'test', N'test123456', 1, 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([CartID], [CustomerID], [ProductID], [Quantity]) VALUES (3, 8, 3, 2)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Figure')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Assembly tools')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Painting tools')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'Shelves')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'Tesst')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (7, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (8, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (9, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (10, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (11, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (12, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (13, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (14, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (15, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (16, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (17, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (18, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (19, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (20, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (21, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (22, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (23, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (24, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (25, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (26, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (27, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (28, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (29, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (30, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (31, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (32, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (33, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (34, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (35, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [Active], [AccountID]) VALUES (36, N'customer1@gmail.com', N'John', CAST(N'2020-10-10' AS Date), N'0982385128', N'Ha Noi', N'avatar1.png', 1, 8)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (1, N'email1@example.com', N'John Doe', CAST(N'1990-01-01' AS Date), N'0123456789', N'Ha Noi', N'avatar1.png', 9)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (2, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (3, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (4, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (5, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (6, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (7, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (8, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (9, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (10, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (11, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (12, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (13, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (14, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (15, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (16, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (17, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (18, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (19, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (20, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (21, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (22, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (23, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (24, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (25, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (26, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (27, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (28, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (29, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (30, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (31, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (32, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (33, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (34, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (35, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (36, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (37, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (38, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (39, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (40, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (41, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (42, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (43, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (44, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (45, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (46, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (47, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (48, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (49, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (50, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (51, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (52, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (53, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (54, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (55, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (56, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (57, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (58, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (59, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (60, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (61, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (62, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (63, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (64, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (65, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (66, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (67, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (68, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (69, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (70, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (71, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (72, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
INSERT [dbo].[Employee] ([EmployeeID], [Email], [FullName], [BirthDay], [Phone], [Address], [AvatarImage], [AccountID]) VALUES (73, N'email2@example.com', N'Jane Smith', CAST(N'1985-05-15' AS Date), N'0987654321', N'Ho Chi Minh', N'avatar2.png', 10)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [Name], [CategoryID], [Image], [Description], [Price], [Status], [QuantityInStock], [Discount], [Image2], [Image3], [Image4]) VALUES (1, N'GUNDAM DYNAMES REPAIR III - METAL BUILD ', 1, N'image1p1.png', N'GUNDAM DYNAMES REPAIR III INFORMATION - METAL BUILD - PREMIUM GUNDAM MODEL
Good detail, beautiful, fully assembled and painted
Belongs to Series: Mobile Suit Gundam 00
Joints move flexibly, easy to pose
Height about 18cm
Suitable for display and styling
Included accessories: GN Shield x2, GN Bazooka, auxiliary hand x4, Beam Saber effect x2, Beam Saber grip x2, assist stand, Rear Thruster arm, GN Bazooka connector, GN Shield connector, GN Shield Cover
Genuine product Tamashii Nations - Bandai', 6790000.0000, N'Available', 100, 0, N'image1p2.jpg', N'image1p3.png', N'image1p4.png')
INSERT [dbo].[Product] ([ProductID], [Name], [CategoryID], [Image], [Description], [Price], [Status], [QuantityInStock], [Discount], [Image2], [Image3], [Image4]) VALUES (2, N'MODEL CUTTING NIPPERS', 2, N'p2image1.png', N'INFORMATION ABOUT CHEAP MODEL CUTTING NICHES FOR BEGINNERS
Cutting pliers for cutting plastic models for new players
Used to separate part from runner
Type of pliers: 2-blade cutting pliers
Weight: About 50g
Size: About 13cm', 59000.0000, N'Available', 100, 0, N'p2image2.png', N'p2image3.png', N'p2image4.png')
INSERT [dbo].[Product] ([ProductID], [Name], [CategoryID], [Image], [Description], [Price], [Status], [QuantityInStock], [Discount], [Image2], [Image3], [Image4]) VALUES (3, N'HOBBY MIO MODEL CEMENT EXTRA THICK Glue - HIGH VISCOSITY 40ML', 2, N'p3image1.jpg', N'INFORMATION HOBBY MIO MODEL CEMENT EXTRA THICK HIGH VISCOSITY 40ML - SPECIALIZED PLASTIC MODEL ADHESIVE
Specialized model plastic glue.
Can be used on ABS, PVC, PU plastic surfaces.
High adhesion, thick glue layer, high viscosity.
Dry in 6 - 12 hours.
Completely dry (cured) in 24 hours.
Suitable for removing seamlines, mending broken joints of plastic models...', 140000.0000, N'Available', 50, 0, N'p3image2.jpg', N'p3image3.jpg', N'p3image4.jpg')
INSERT [dbo].[Product] ([ProductID], [Name], [CategoryID], [Image], [Description], [Price], [Status], [QuantityInStock], [Discount], [Image2], [Image3], [Image4]) VALUES (4, N'LINING HOBBY MIO L-01 BLACK PANEL MODEL PEN', 3, N'p4image1.jpg', N'LINING HOBBY MIO L-01 BLACK PANEL MODEL INFORMATION
Specialized line pen for Gundam models
Helps your model look more beautiful and have more depth
Super small nib, fine groove.
Oil-based formula, extremely high adhesion, waterproof and scratch-resistant.', 88000.0000, N'Available', 200, 0, N'p4image1.jpg', NULL, NULL)
INSERT [dbo].[Product] ([ProductID], [Name], [CategoryID], [Image], [Description], [Price], [Status], [QuantityInStock], [Discount], [Image2], [Image3], [Image4]) VALUES (11, N'RX-93-Ν2 HI-NU GUNDAM - HI VGUNDAM - RG - 1/144 - MÔ HÌNH GUNPLA CHÍNH HÃNG BANDAI', 1, N'image1p7.png', N'INFORMATION RX-93-Ν2 HI-NU GUNDAM - RG - 1/144 - GENUINE BANDAI GUNPLA MODEL
RG Level with rate 1/144
High detail, working joints. Apply by pressing, no glue required
Belongs to Series: Mobile Suit Gunma
Equipment: Beam Rifle, Nu Hyper Bazooka, Shield, Beam Saber
Decal stickers (See decal sticker instructions)
See the best practices for Gundunda with Gundunda Marker
Cannot attach. (Buy separately here)
Genuine Bandai Gunpla product', 1280000.0000, N'Available', 100, 0, N'image2p7.png', N'image3p7.png', N'image4p7.png')
INSERT [dbo].[Product] ([ProductID], [Name], [CategoryID], [Image], [Description], [Price], [Status], [QuantityInStock], [Discount], [Image2], [Image3], [Image4]) VALUES (12, N'GUNDAM POKEMON ANIME MODEL DISPLAY BOX 20X20X20CM', 4, N'p5image1.jpg', N'INFORMATION OF GUNDAM POKEMON ANIME MODEL DISPLAY BOX 20X20X20CM
High quality model display box
Dimensions: 20 x 20 x 20 cm
A set includes: 1 base, 1 top cover, 3 clear mica sides, 1 front side with magnet, 2 steps, set of screws, mica glue, paper tape to support fixation during assembly.
Suitable for Pokemon, Gundam SD, HG, RG models with moderate sized anime figures.
Thick 2mm mica material, high transparency, does not affect the color of the model.', 425000.0000, N'Available', 50, 0, N'p5image2.jpg', N'p5image3.jpg', N'p5image4.jpg')
INSERT [dbo].[Product] ([ProductID], [Name], [CategoryID], [Image], [Description], [Price], [Status], [QuantityInStock], [Discount], [Image2], [Image3], [Image4]) VALUES (13, N'METAL ROLLED MODEL PURNING KNIFE', 2, N'p123i1.png', N'METAL ROLLED MODEL PURNING KNIFE INFORMATION
Helps trim excess plastic parts, or shape the model according to the player''s wishes.
Stainless steel material, sharp blade
Moderate weight metal handle to support force, engraved grooves to limit slipping.
Compact design, cylindrical shape like a pen, fits comfortably in the hand, easy to operate
The default product set includes 1 aluminum knife handle and 5 blades.
Other types of blades can be purchased separately.', 38000.0000, N'Available', 200, 10, N'p123i2.png', N'p123i3.png', N'p123i4.png')
INSERT [dbo].[Product] ([ProductID], [Name], [CategoryID], [Image], [Description], [Price], [Status], [QuantityInStock], [Discount], [Image2], [Image3], [Image4]) VALUES (14, N'RX-0 UNICORN GUNDAM VER. KA - MGEX - 1/100 - GENUINE BANDAI GUNPLA', 1, N'gundam1.png', N'INFORMATION RX-0 UNICORN GUNDAM VER. KA (MGEX - 1/100) - GENUINE BANDAI GUNPLA
MG level at 1/100 scale
High detail, flexible moving skeleton. Assembled with click-joint style, no need to use glue
Belongs to Series: Mobile Suit Gundam Unicorn
Equipment: Beam Magnum, Hyper Bazooka, Shield x 3, Beam Gatling Gun x 6
Possessing a new style LED lighting system, super beautiful color changing
Decal stickers (See instructions for applying decals)
See how to beautify a Gundam with Gundam Marker
There is a base and support base
Genuine Bandai Gunpla product', 5841000.0000, N'Avaliable', 20, 30, N'gundam2.png', N'gundam3.png', N'gundam4.png')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Employee')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Shipper')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (4, N'Customer')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Customer]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Account1] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Account1]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Account1] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Account1]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Employee]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Shipper] FOREIGN KEY([ShipperID])
REFERENCES [dbo].[Shipper] ([ShipperID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Shipper]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_TransactStatus] FOREIGN KEY([TransactStatusID])
REFERENCES [dbo].[TransactStatus] ([TransactStatusID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_TransactStatus]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
/****** Object:  Trigger [dbo].[TriggerAddAccount]    Script Date: 3/22/2024 10:09:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TriggerAddAccount]
ON [dbo].[Account]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Employee (AccountID)
    SELECT i.AccountID
    FROM inserted i
    WHERE i.RoleID IN (2, 3);

    INSERT INTO Customer (AccountID, Active)
    SELECT i.AccountID, i.Active
    FROM inserted i
    WHERE i.RoleID = 4;
END;
GO
ALTER TABLE [dbo].[Account] ENABLE TRIGGER [TriggerAddAccount]
GO
USE [master]
GO
ALTER DATABASE [ManagerShopPRN211] SET  READ_WRITE 
GO
