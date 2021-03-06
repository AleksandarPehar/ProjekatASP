USE [master]
GO
/****** Object:  Database [GameProjekat]    Script Date: 7/2/2020 1:57:23 PM ******/
CREATE DATABASE [GameProjekat]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GameProjekat', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GameProjekat.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GameProjekat_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GameProjekat_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GameProjekat] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GameProjekat].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GameProjekat] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GameProjekat] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GameProjekat] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GameProjekat] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GameProjekat] SET ARITHABORT OFF 
GO
ALTER DATABASE [GameProjekat] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GameProjekat] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GameProjekat] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GameProjekat] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GameProjekat] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GameProjekat] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GameProjekat] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GameProjekat] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GameProjekat] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GameProjekat] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GameProjekat] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GameProjekat] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GameProjekat] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GameProjekat] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GameProjekat] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GameProjekat] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GameProjekat] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GameProjekat] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GameProjekat] SET  MULTI_USER 
GO
ALTER DATABASE [GameProjekat] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GameProjekat] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GameProjekat] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GameProjekat] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GameProjekat] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GameProjekat] SET QUERY_STORE = OFF
GO
USE [GameProjekat]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/2/2020 1:57:23 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 7/2/2020 1:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CompanyName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consoles]    Script Date: 7/2/2020 1:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[ConsoleName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Consoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game_Consoles]    Script Date: 7/2/2020 1:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game_Consoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[GameId] [int] NULL,
	[ConsoleId] [int] NULL,
 CONSTRAINT [PK_Game_Consoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game_Genres]    Script Date: 7/2/2020 1:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game_Genres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[GameId] [int] NULL,
	[GenreId] [int] NULL,
 CONSTRAINT [PK_Game_Genres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Games]    Script Date: 7/2/2020 1:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Games](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[ReleseDate] [datetime2](7) NOT NULL,
	[Picture] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
 CONSTRAINT [PK_Games] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 7/2/2020 1:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[GenereName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rent]    Script Date: 7/2/2020 1:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[GameId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Rent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/2/2020 1:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[RoleName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/2/2020 1:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200630180007_setup', N'3.1.5')
GO
SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [CompanyName]) VALUES (3, CAST(N'2020-06-11T00:00:00.0000000' AS DateTime2), NULL, 0, N'Ubisoft')
INSERT [dbo].[Companies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [CompanyName]) VALUES (4, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'Rock Star')
INSERT [dbo].[Companies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [CompanyName]) VALUES (5, CAST(N'2020-06-13T00:00:00.0000000' AS DateTime2), NULL, 0, N'Nintendo')
INSERT [dbo].[Companies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [CompanyName]) VALUES (6, CAST(N'2020-06-14T00:00:00.0000000' AS DateTime2), NULL, 0, N'Bethesda')
INSERT [dbo].[Companies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [CompanyName]) VALUES (7, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'Microsoft')
INSERT [dbo].[Companies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [CompanyName]) VALUES (8, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'Electronic Arts')
INSERT [dbo].[Companies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [CompanyName]) VALUES (9, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'Square Enix')
SET IDENTITY_INSERT [dbo].[Companies] OFF
GO
SET IDENTITY_INSERT [dbo].[Consoles] ON 

INSERT [dbo].[Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [ConsoleName]) VALUES (1, CAST(N'2020-06-11T00:00:00.0000000' AS DateTime2), NULL, 0, N'XBox')
INSERT [dbo].[Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [ConsoleName]) VALUES (5, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'PLaystation')
INSERT [dbo].[Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [ConsoleName]) VALUES (6, CAST(N'2020-06-13T00:00:00.0000000' AS DateTime2), NULL, 0, N'PC')
INSERT [dbo].[Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [ConsoleName]) VALUES (7, CAST(N'2020-06-14T00:00:00.0000000' AS DateTime2), NULL, 0, N'Switch')
SET IDENTITY_INSERT [dbo].[Consoles] OFF
GO
SET IDENTITY_INSERT [dbo].[Game_Consoles] ON 

INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (1, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 7, 6)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (2, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 8, 1)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (4, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 8, 5)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (5, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 9, 6)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (6, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 9, 1)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (7, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 9, 5)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (8, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 10, 7)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (9, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 11, 6)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (10, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 11, 1)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (11, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 11, 5)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (12, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 12, 6)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (13, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 12, 1)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (14, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 13, 7)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (15, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 14, 6)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (16, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 14, 5)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (17, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 15, 1)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (18, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 16, 6)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (19, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 17, 6)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (20, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 18, 6)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (21, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 19, 6)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (22, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 19, 5)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (23, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 19, 1)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (24, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 20, 1)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (25, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 20, 5)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (26, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 21, 6)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (27, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 22, 6)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (28, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 23, 1)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (29, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 23, 5)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (30, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 23, 6)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (31, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 24, 5)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (32, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 25, 5)
INSERT [dbo].[Game_Consoles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [ConsoleId]) VALUES (33, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 26, 7)
SET IDENTITY_INSERT [dbo].[Game_Consoles] OFF
GO
SET IDENTITY_INSERT [dbo].[Game_Genres] ON 

INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (1, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 7, 1)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (2, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 7, 3)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (3, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 8, 1)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (4, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 8, 3)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (5, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 9, 1)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (6, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 9, 5)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (7, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 10, 2)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (8, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 10, 6)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (9, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 11, 1)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (10, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 11, 5)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (11, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 12, 2)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (12, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 12, 3)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (13, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 12, 1)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (14, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 13, 1)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (15, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 13, 3)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (16, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 14, 1)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (17, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 14, 3)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (18, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 15, 1)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (19, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 15, 3)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (20, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 16, 1)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (21, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 16, 8)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (22, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 17, 1)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (23, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 17, 8)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (24, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 18, 2)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (25, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 18, 9)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (26, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 19, 2)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (27, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 19, 9)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (28, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 20, 1)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (29, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 20, 3)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (30, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 21, 1)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (31, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 21, 3)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (32, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 22, 1)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (33, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 22, 3)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (34, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 23, 1)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (35, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 23, 5)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (36, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 24, 2)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (37, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 24, 7)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (38, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 25, 2)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (39, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 25, 9)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (40, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 26, 2)
INSERT [dbo].[Game_Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [GenreId]) VALUES (41, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 26, 9)
SET IDENTITY_INSERT [dbo].[Game_Genres] OFF
GO
SET IDENTITY_INSERT [dbo].[Games] ON 

INSERT [dbo].[Games] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [Title], [ReleseDate], [Picture], [CompanyId]) VALUES (7, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'Assassins Creed', CAST(N'2007-11-13T00:00:00.0000000' AS DateTime2), N'picture1.jpg', 3)
INSERT [dbo].[Games] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [Title], [ReleseDate], [Picture], [CompanyId]) VALUES (8, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'Red Dead Redemption', CAST(N'2010-05-18T00:00:00.0000000' AS DateTime2), N'picture2.jpg', 4)
INSERT [dbo].[Games] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [Title], [ReleseDate], [Picture], [CompanyId]) VALUES (9, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'Skyrim', CAST(N'2011-11-11T00:00:00.0000000' AS DateTime2), N'picture3.jpg', 6)
INSERT [dbo].[Games] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [Title], [ReleseDate], [Picture], [CompanyId]) VALUES (10, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'Super Mario Kart 9', CAST(N'2014-05-29T00:00:00.0000000' AS DateTime2), N'picture4.jpg', 5)
INSERT [dbo].[Games] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [Title], [ReleseDate], [Picture], [CompanyId]) VALUES (11, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'Fallout 4', CAST(N'2015-11-10T00:00:00.0000000' AS DateTime2), N'picture5.jpg', 6)
INSERT [dbo].[Games] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [Title], [ReleseDate], [Picture], [CompanyId]) VALUES (12, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'Grand Theft Auto 5', CAST(N'2013-10-17T00:00:00.0000000' AS DateTime2), N'picture6.jpg', 4)
INSERT [dbo].[Games] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [Title], [ReleseDate], [Picture], [CompanyId]) VALUES (13, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'Breath of the Wild', CAST(N'2017-03-03T00:00:00.0000000' AS DateTime2), N'picture7.jpg', 5)
INSERT [dbo].[Games] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [Title], [ReleseDate], [Picture], [CompanyId]) VALUES (14, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'Red Dead Redemption 2', CAST(N'2018-09-26T00:00:00.0000000' AS DateTime2), N'picture8.jpg', 4)
INSERT [dbo].[Games] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [Title], [ReleseDate], [Picture], [CompanyId]) VALUES (15, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'Halo', CAST(N'2001-11-15T00:00:00.0000000' AS DateTime2), N'picture9.jpg', 7)
INSERT [dbo].[Games] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [Title], [ReleseDate], [Picture], [CompanyId]) VALUES (16, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'Minecraft', CAST(N'2009-05-17T00:00:00.0000000' AS DateTime2), N'picture10.jpg', 7)
INSERT [dbo].[Games] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [Title], [ReleseDate], [Picture], [CompanyId]) VALUES (17, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'Sims 4', CAST(N'2014-09-02T00:00:00.0000000' AS DateTime2), N'picture11.jpg', 8)
INSERT [dbo].[Games] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [Title], [ReleseDate], [Picture], [CompanyId]) VALUES (18, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'Battlefild 5', CAST(N'2018-11-09T00:00:00.0000000' AS DateTime2), N'picture12.jpg', 8)
INSERT [dbo].[Games] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [Title], [ReleseDate], [Picture], [CompanyId]) VALUES (19, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'Battlefront 2', CAST(N'2017-01-17T00:00:00.0000000' AS DateTime2), N'picture13.jpg', 8)
INSERT [dbo].[Games] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [Title], [ReleseDate], [Picture], [CompanyId]) VALUES (20, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'Tom Raider', CAST(N'2013-05-05T00:00:00.0000000' AS DateTime2), N'picture14.jpg', 9)
INSERT [dbo].[Games] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [Title], [ReleseDate], [Picture], [CompanyId]) VALUES (21, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'Just Cause 4', CAST(N'2018-12-04T00:00:00.0000000' AS DateTime2), N'picture15.jpg', 9)
INSERT [dbo].[Games] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [Title], [ReleseDate], [Picture], [CompanyId]) VALUES (22, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'Sleeping Dogs', CAST(N'2012-08-14T00:00:00.0000000' AS DateTime2), N'picture16.jpg', 9)
INSERT [dbo].[Games] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [Title], [ReleseDate], [Picture], [CompanyId]) VALUES (23, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'New Vegas', CAST(N'2010-10-19T00:00:00.0000000' AS DateTime2), N'picture17.jpg', 6)
INSERT [dbo].[Games] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [Title], [ReleseDate], [Picture], [CompanyId]) VALUES (24, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'For Honor', CAST(N'2017-06-14T00:00:00.0000000' AS DateTime2), N'picture18.jpg', 3)
INSERT [dbo].[Games] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [Title], [ReleseDate], [Picture], [CompanyId]) VALUES (25, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'Rainbow Six Siege', CAST(N'2015-12-01T00:00:00.0000000' AS DateTime2), N'picture19.jupg', 3)
INSERT [dbo].[Games] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [Title], [ReleseDate], [Picture], [CompanyId]) VALUES (26, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'Super Smash Bros Ultimate', CAST(N'2018-12-07T00:00:00.0000000' AS DateTime2), N'picture20.jpg', 5)
SET IDENTITY_INSERT [dbo].[Games] OFF
GO
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GenereName]) VALUES (1, CAST(N'2020-06-11T00:00:00.0000000' AS DateTime2), NULL, 0, N'Singleplayer')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GenereName]) VALUES (2, CAST(N'2020-06-11T00:00:00.0000000' AS DateTime2), NULL, 0, N'Multiplayer')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GenereName]) VALUES (3, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'Action')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GenereName]) VALUES (4, CAST(N'2020-06-13T00:00:00.0000000' AS DateTime2), NULL, 0, N'Horro')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GenereName]) VALUES (5, CAST(N'2020-06-14T00:00:00.0000000' AS DateTime2), NULL, 0, N'RPG')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GenereName]) VALUES (6, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'Race')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GenereName]) VALUES (7, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'Fighting')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GenereName]) VALUES (8, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'Simulation')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GenereName]) VALUES (9, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'FPS')
SET IDENTITY_INSERT [dbo].[Genres] OFF
GO
SET IDENTITY_INSERT [dbo].[Rent] ON 

INSERT [dbo].[Rent] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [UserId]) VALUES (2, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 13, 1)
INSERT [dbo].[Rent] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [UserId]) VALUES (3, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 21, 6)
INSERT [dbo].[Rent] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [UserId]) VALUES (7, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 7, 2)
INSERT [dbo].[Rent] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [UserId]) VALUES (8, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 14, 1)
INSERT [dbo].[Rent] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [UserId]) VALUES (9, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 26, 3)
INSERT [dbo].[Rent] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [UserId]) VALUES (10, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 7, 3)
INSERT [dbo].[Rent] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [UserId]) VALUES (11, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 12, 2)
INSERT [dbo].[Rent] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [UserId]) VALUES (12, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 25, 1)
INSERT [dbo].[Rent] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [UserId]) VALUES (13, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 25, 2)
INSERT [dbo].[Rent] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [UserId]) VALUES (14, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 8, 6)
INSERT [dbo].[Rent] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [UserId]) VALUES (15, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 16, 3)
INSERT [dbo].[Rent] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [UserId]) VALUES (16, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 23, 1)
INSERT [dbo].[Rent] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [UserId]) VALUES (17, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 17, 4)
INSERT [dbo].[Rent] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [UserId]) VALUES (18, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 24, 4)
INSERT [dbo].[Rent] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [UserId]) VALUES (19, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 11, 4)
INSERT [dbo].[Rent] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [UserId]) VALUES (20, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 19, 2)
INSERT [dbo].[Rent] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [UserId]) VALUES (21, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 7, 6)
INSERT [dbo].[Rent] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [UserId]) VALUES (22, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 13, 2)
INSERT [dbo].[Rent] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [UserId]) VALUES (23, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 24, 3)
INSERT [dbo].[Rent] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [GameId], [UserId]) VALUES (25, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, 13, 3)
SET IDENTITY_INSERT [dbo].[Rent] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [RoleName]) VALUES (1, CAST(N'2020-06-09T00:00:00.0000000' AS DateTime2), NULL, 0, N'Admin')
INSERT [dbo].[Roles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [RoleName]) VALUES (2, CAST(N'2020-06-09T00:00:00.0000000' AS DateTime2), NULL, 0, N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [FirstName], [LastName], [Email], [Password], [RoleId]) VALUES (1, CAST(N'2020-06-09T00:00:00.0000000' AS DateTime2), NULL, 0, N'Aleksandar', N'Pehar', N'acapehar@gmail.com', N'sifra1', 1)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [FirstName], [LastName], [Email], [Password], [RoleId]) VALUES (2, CAST(N'2020-06-09T00:00:00.0000000' AS DateTime2), NULL, 0, N'Pera', N'Peric', N'pera@gmail.com', N'sifra1', 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [FirstName], [LastName], [Email], [Password], [RoleId]) VALUES (3, CAST(N'2020-06-12T00:00:00.0000000' AS DateTime2), NULL, 0, N'Mika', N'Mikic', N'mika@gmail.com', N'sifra1', 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [FirstName], [LastName], [Email], [Password], [RoleId]) VALUES (4, CAST(N'2020-06-11T00:00:00.0000000' AS DateTime2), NULL, 0, N'Laza', N'Lazic', N'laza@gmail.com', N'sifra1', 1)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [FirstName], [LastName], [Email], [Password], [RoleId]) VALUES (6, CAST(N'2020-06-13T00:00:00.0000000' AS DateTime2), NULL, 0, N'Marko', N'Morkovic', N'mare@gmail.com', N'sifra1', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_Game_Consoles_ConsoleId]    Script Date: 7/2/2020 1:57:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Game_Consoles_ConsoleId] ON [dbo].[Game_Consoles]
(
	[ConsoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Game_Consoles_GameId]    Script Date: 7/2/2020 1:57:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Game_Consoles_GameId] ON [dbo].[Game_Consoles]
(
	[GameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Game_Genres_GameId]    Script Date: 7/2/2020 1:57:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Game_Genres_GameId] ON [dbo].[Game_Genres]
(
	[GameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Game_Genres_GenreId]    Script Date: 7/2/2020 1:57:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Game_Genres_GenreId] ON [dbo].[Game_Genres]
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Games_CompanyId]    Script Date: 7/2/2020 1:57:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Games_CompanyId] ON [dbo].[Games]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Rent_GameId]    Script Date: 7/2/2020 1:57:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Rent_GameId] ON [dbo].[Rent]
(
	[GameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Rent_UserId]    Script Date: 7/2/2020 1:57:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Rent_UserId] ON [dbo].[Rent]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_RoleId]    Script Date: 7/2/2020 1:57:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Users_RoleId] ON [dbo].[Users]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Game_Consoles]  WITH CHECK ADD  CONSTRAINT [FK_Game_Consoles_Consoles_ConsoleId] FOREIGN KEY([ConsoleId])
REFERENCES [dbo].[Consoles] ([Id])
GO
ALTER TABLE [dbo].[Game_Consoles] CHECK CONSTRAINT [FK_Game_Consoles_Consoles_ConsoleId]
GO
ALTER TABLE [dbo].[Game_Consoles]  WITH CHECK ADD  CONSTRAINT [FK_Game_Consoles_Games_GameId] FOREIGN KEY([GameId])
REFERENCES [dbo].[Games] ([Id])
GO
ALTER TABLE [dbo].[Game_Consoles] CHECK CONSTRAINT [FK_Game_Consoles_Games_GameId]
GO
ALTER TABLE [dbo].[Game_Genres]  WITH CHECK ADD  CONSTRAINT [FK_Game_Genres_Games_GameId] FOREIGN KEY([GameId])
REFERENCES [dbo].[Games] ([Id])
GO
ALTER TABLE [dbo].[Game_Genres] CHECK CONSTRAINT [FK_Game_Genres_Games_GameId]
GO
ALTER TABLE [dbo].[Game_Genres]  WITH CHECK ADD  CONSTRAINT [FK_Game_Genres_Genres_GenreId] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([Id])
GO
ALTER TABLE [dbo].[Game_Genres] CHECK CONSTRAINT [FK_Game_Genres_Genres_GenreId]
GO
ALTER TABLE [dbo].[Games]  WITH CHECK ADD  CONSTRAINT [FK_Games_Companies_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
GO
ALTER TABLE [dbo].[Games] CHECK CONSTRAINT [FK_Games_Companies_CompanyId]
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD  CONSTRAINT [FK_Rent_Games_GameId] FOREIGN KEY([GameId])
REFERENCES [dbo].[Games] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rent] CHECK CONSTRAINT [FK_Rent_Games_GameId]
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD  CONSTRAINT [FK_Rent_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rent] CHECK CONSTRAINT [FK_Rent_Users_UserId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles_RoleId]
GO
USE [master]
GO
ALTER DATABASE [GameProjekat] SET  READ_WRITE 
GO
