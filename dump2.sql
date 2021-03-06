USE [master]
GO
/****** Object:  Database [WeidonDb]    Script Date: 27/01/2021 18:53:33 ******/
CREATE DATABASE [WeidonDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WeidonDb', FILENAME = N'D:\Dev\SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\WeidonDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WeidonDb_log', FILENAME = N'D:\Dev\SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\WeidonDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [WeidonDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WeidonDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WeidonDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WeidonDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WeidonDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WeidonDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WeidonDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [WeidonDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WeidonDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WeidonDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WeidonDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WeidonDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WeidonDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WeidonDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WeidonDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WeidonDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WeidonDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WeidonDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WeidonDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WeidonDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WeidonDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WeidonDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WeidonDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WeidonDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WeidonDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WeidonDb] SET  MULTI_USER 
GO
ALTER DATABASE [WeidonDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WeidonDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WeidonDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WeidonDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WeidonDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WeidonDb] SET QUERY_STORE = OFF
GO
USE [WeidonDb]
GO
/****** Object:  Table [dbo].[Characters]    Script Date: 27/01/2021 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Characters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[IdDeity] [int] NULL,
	[IdMythology] [int] NOT NULL,
	[Mythology] [varchar](500) NULL,
	[Myth] [varchar](500) NULL,
	[IdMyth] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deity]    Script Date: 27/01/2021 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[AlternativeNames] [varchar](1000) NULL,
	[Mythology] [varchar](500) NULL,
	[IdMythology] [int] NOT NULL,
	[Roles] [varchar](500) NULL,
	[Etymology] [varchar](max) NULL,
	[Origin] [varchar](max) NULL,
	[Symbolism] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeityImages]    Script Date: 27/01/2021 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeityImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdDeity] [int] NOT NULL,
	[ImagePath] [varchar](max) NULL,
 CONSTRAINT [PK_DeityImages2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquivalentDeities]    Script Date: 27/01/2021 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquivalentDeities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdDeity] [int] NOT NULL,
	[EquivalentDeityName] [varchar](50) NULL,
	[EquivalentDeityId] [int] NULL,
 CONSTRAINT [PK_EquivalentDeities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquivalentMyths]    Script Date: 27/01/2021 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquivalentMyths](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdMyth] [int] NOT NULL,
	[EquivalentMyth] [varchar](max) NULL,
	[EquivalentMythId] [int] NULL,
 CONSTRAINT [PK_EquivalentMyths2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Myth]    Script Date: 27/01/2021 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Myth](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[AlternativeNames] [varchar](1000) NULL,
	[IdMythology] [int] NOT NULL,
	[Mythology] [varchar](500) NULL,
	[Meaning] [varchar](max) NULL,
	[Story] [varchar](max) NULL,
	[Origin] [varchar](max) NULL,
	[EquivalentMyths] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MythImages]    Script Date: 27/01/2021 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MythImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdMyth] [int] NOT NULL,
	[ImagePath] [varchar](max) NULL,
 CONSTRAINT [PK_MythImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mythology]    Script Date: 27/01/2021 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mythology](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Content] [varchar](max) NULL,
	[Area] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MythologyImages]    Script Date: 27/01/2021 18:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MythologyImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdMythology] [int] NOT NULL,
	[ImagePath] [varchar](max) NULL,
 CONSTRAINT [PK_MythologyImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Characters]  WITH CHECK ADD FOREIGN KEY([IdDeity])
REFERENCES [dbo].[Deity] ([Id])
GO
ALTER TABLE [dbo].[Characters]  WITH CHECK ADD FOREIGN KEY([IdMyth])
REFERENCES [dbo].[Myth] ([Id])
GO
ALTER TABLE [dbo].[Deity]  WITH CHECK ADD FOREIGN KEY([IdMythology])
REFERENCES [dbo].[Mythology] ([Id])
GO
ALTER TABLE [dbo].[DeityImages]  WITH CHECK ADD  CONSTRAINT [FK_DeityImages_Deity] FOREIGN KEY([IdDeity])
REFERENCES [dbo].[Deity] ([Id])
GO
ALTER TABLE [dbo].[DeityImages] CHECK CONSTRAINT [FK_DeityImages_Deity]
GO
ALTER TABLE [dbo].[EquivalentDeities]  WITH CHECK ADD  CONSTRAINT [FK_EquivalentDeities_Deity] FOREIGN KEY([IdDeity])
REFERENCES [dbo].[Deity] ([Id])
GO
ALTER TABLE [dbo].[EquivalentDeities] CHECK CONSTRAINT [FK_EquivalentDeities_Deity]
GO
ALTER TABLE [dbo].[EquivalentMyths]  WITH CHECK ADD  CONSTRAINT [FK_EquivalentMyths_Myth] FOREIGN KEY([IdMyth])
REFERENCES [dbo].[Myth] ([Id])
GO
ALTER TABLE [dbo].[EquivalentMyths] CHECK CONSTRAINT [FK_EquivalentMyths_Myth]
GO
ALTER TABLE [dbo].[Myth]  WITH CHECK ADD  CONSTRAINT [FK_Mythology] FOREIGN KEY([IdMythology])
REFERENCES [dbo].[Mythology] ([Id])
GO
ALTER TABLE [dbo].[Myth] CHECK CONSTRAINT [FK_Mythology]
GO
ALTER TABLE [dbo].[MythImages]  WITH CHECK ADD  CONSTRAINT [FK_MythImages_Myth] FOREIGN KEY([IdMyth])
REFERENCES [dbo].[Myth] ([Id])
GO
ALTER TABLE [dbo].[MythImages] CHECK CONSTRAINT [FK_MythImages_Myth]
GO
ALTER TABLE [dbo].[MythologyImages]  WITH CHECK ADD  CONSTRAINT [FK_MythologyImages_Mythology] FOREIGN KEY([IdMythology])
REFERENCES [dbo].[Mythology] ([Id])
GO
ALTER TABLE [dbo].[MythologyImages] CHECK CONSTRAINT [FK_MythologyImages_Mythology]
GO
USE [master]
GO
ALTER DATABASE [WeidonDb] SET  READ_WRITE 
GO
