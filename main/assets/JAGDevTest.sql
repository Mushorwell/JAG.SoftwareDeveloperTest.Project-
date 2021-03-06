USE [master]
GO
/****** Object:  Database [JAGDevTest]    Script Date: 2017-02-17 01:00:53 PM ******/
CREATE DATABASE [JAGDevTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JAGDevTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\JAGDevTest.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'JAGDevTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\JAGDevTest_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [JAGDevTest] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JAGDevTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JAGDevTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JAGDevTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JAGDevTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JAGDevTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JAGDevTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [JAGDevTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JAGDevTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JAGDevTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JAGDevTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JAGDevTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JAGDevTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JAGDevTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JAGDevTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JAGDevTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JAGDevTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JAGDevTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JAGDevTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JAGDevTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JAGDevTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JAGDevTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JAGDevTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JAGDevTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JAGDevTest] SET RECOVERY FULL 
GO
ALTER DATABASE [JAGDevTest] SET  MULTI_USER 
GO
ALTER DATABASE [JAGDevTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JAGDevTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JAGDevTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JAGDevTest] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [JAGDevTest] SET DELAYED_DURABILITY = DISABLED 
GO
USE [JAGDevTest]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 2017-02-17 01:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Client](
	[ClientId] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lead]    Script Date: 2017-02-17 01:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lead](
	[LeadId] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](255) NOT NULL,
	[LastName] [varchar](255) NOT NULL,
	[CellNumber] [varchar](10) NOT NULL,
	[Email] [varchar](25) NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Lead] PRIMARY KEY CLUSTERED 
(
	[LeadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LeadDistribution]    Script Date: 2017-02-17 01:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeadDistribution](
	[LeadDistributionId] [bigint] IDENTITY(1,1) NOT NULL,
	[LeadId] [bigint] NOT NULL,
	[ClientId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_LeadDistribution] PRIMARY KEY CLUSTERED 
(
	[LeadDistributionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Client] ([ClientId], [Name], [CreatedDateTime]) VALUES (N'bc99e6be-33f9-4604-a2ac-98df0d5db56e', N'OUT', CAST(N'2017-02-01 17:51:32.717' AS DateTime))
INSERT [dbo].[Client] ([ClientId], [Name], [CreatedDateTime]) VALUES (N'3c617126-be92-466b-8c4b-df321592b144', N'King', CAST(N'2017-02-01 17:51:32.717' AS DateTime))
INSERT [dbo].[Client] ([ClientId], [Name], [CreatedDateTime]) VALUES (N'e1d0dbba-7374-4f91-9782-e295d3ad8940', N'Mom', CAST(N'2017-02-01 17:51:32.717' AS DateTime))
INSERT [dbo].[Client] ([ClientId], [Name], [CreatedDateTime]) VALUES (N'b99e959d-ba25-4508-9ffe-e3a1aa0e7959', N'Budget', CAST(N'2017-02-01 17:51:32.717' AS DateTime))
SET IDENTITY_INSERT [dbo].[Lead] ON 

INSERT [dbo].[Lead] ([LeadId], [FirstName], [LastName], [CellNumber], [Email], [CreatedDateTime]) VALUES (2, N'Joe', N'Soap', N'0811239874', N'dirty@man.com', CAST(N'2017-02-01 17:54:15.100' AS DateTime))
INSERT [dbo].[Lead] ([LeadId], [FirstName], [LastName], [CellNumber], [Email], [CreatedDateTime]) VALUES (3, N'Joe', N'Blogs', N'0838009874', N'ihave@thembogs.net', CAST(N'2017-02-01 17:54:15.100' AS DateTime))
INSERT [dbo].[Lead] ([LeadId], [FirstName], [LastName], [CellNumber], [Email], [CreatedDateTime]) VALUES (4, N'Jane', N'Doe', N'0831000913', N'jane@doe.com', CAST(N'2017-02-01 17:54:15.100' AS DateTime))
INSERT [dbo].[Lead] ([LeadId], [FirstName], [LastName], [CellNumber], [Email], [CreatedDateTime]) VALUES (5, N'John', N'Doe', N'0831000917', N'john@doe.com', CAST(N'2017-02-01 17:54:15.103' AS DateTime))
SET IDENTITY_INSERT [dbo].[Lead] OFF
SET IDENTITY_INSERT [dbo].[LeadDistribution] ON 

INSERT [dbo].[LeadDistribution] ([LeadDistributionId], [LeadId], [ClientId]) VALUES (1, 5, N'b99e959d-ba25-4508-9ffe-e3a1aa0e7959')
INSERT [dbo].[LeadDistribution] ([LeadDistributionId], [LeadId], [ClientId]) VALUES (2, 3, N'3c617126-be92-466b-8c4b-df321592b144')
INSERT [dbo].[LeadDistribution] ([LeadDistributionId], [LeadId], [ClientId]) VALUES (3, 3, N'bc99e6be-33f9-4604-a2ac-98df0d5db56e')
INSERT [dbo].[LeadDistribution] ([LeadDistributionId], [LeadId], [ClientId]) VALUES (4, 2, N'3c617126-be92-466b-8c4b-df321592b144')
INSERT [dbo].[LeadDistribution] ([LeadDistributionId], [LeadId], [ClientId]) VALUES (5, 2, N'b99e959d-ba25-4508-9ffe-e3a1aa0e7959')
SET IDENTITY_INSERT [dbo].[LeadDistribution] OFF
ALTER TABLE [dbo].[LeadDistribution]  WITH CHECK ADD  CONSTRAINT [FK_LeadDistribution_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([ClientId])
GO
ALTER TABLE [dbo].[LeadDistribution] CHECK CONSTRAINT [FK_LeadDistribution_Client]
GO
ALTER TABLE [dbo].[LeadDistribution]  WITH CHECK ADD  CONSTRAINT [FK_LeadDistribution_Lead] FOREIGN KEY([LeadId])
REFERENCES [dbo].[Lead] ([LeadId])
GO
ALTER TABLE [dbo].[LeadDistribution] CHECK CONSTRAINT [FK_LeadDistribution_Lead]
GO
USE [master]
GO
ALTER DATABASE [JAGDevTest] SET  READ_WRITE 
GO
