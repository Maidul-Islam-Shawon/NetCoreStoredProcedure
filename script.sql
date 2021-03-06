/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [NetCoreSp]    Script Date: 16/07/2022 17:58:24 ******/
CREATE DATABASE [NetCoreSp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NetCoreSp', FILENAME = N'C:\Users\shawon\NetCoreSp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NetCoreSp_log', FILENAME = N'C:\Users\shawon\NetCoreSp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [NetCoreSp] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NetCoreSp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NetCoreSp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NetCoreSp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NetCoreSp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NetCoreSp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NetCoreSp] SET ARITHABORT OFF 
GO
ALTER DATABASE [NetCoreSp] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [NetCoreSp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NetCoreSp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NetCoreSp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NetCoreSp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NetCoreSp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NetCoreSp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NetCoreSp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NetCoreSp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NetCoreSp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NetCoreSp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NetCoreSp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NetCoreSp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NetCoreSp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NetCoreSp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NetCoreSp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NetCoreSp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NetCoreSp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NetCoreSp] SET  MULTI_USER 
GO
ALTER DATABASE [NetCoreSp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NetCoreSp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NetCoreSp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NetCoreSp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NetCoreSp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NetCoreSp] SET QUERY_STORE = OFF
GO
USE [NetCoreSp]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [NetCoreSp]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 16/07/2022 17:58:24 ******/
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
/****** Object:  Table [dbo].[appointments]    Script Date: 16/07/2022 17:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appointments](
	[AppointmentID] [int] IDENTITY(1,1) NOT NULL,
	[ReturnCode] [int] NOT NULL,
 CONSTRAINT [PK_appointments] PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Output]    Script Date: 16/07/2022 17:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Output](
	[AppointmentId] [int] IDENTITY(1,1) NOT NULL,
	[ReturnCode] [int] NOT NULL,
	[SubmittedTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Output] PRIMARY KEY CLUSTERED 
(
	[AppointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfiles]    Script Date: 16/07/2022 17:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmailAddress] [nvarchar](200) NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[OIdProvider] [nvarchar](max) NULL,
	[OId] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserProfiles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[CreateAppointmentSp]    Script Date: 16/07/2022 17:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[CreateAppointmentSp]
		@ClinicId int,
		@AppointmentDate nvarchar(30),
		@FirstName varchar(30),
        @LastName varchar(20),
        @PatientID int,
        @AppointmentStartTime varchar,
        @AppointmentEndTime varchar

AS
BEGIN
SET NOCOUNT ON;

INSERT appointments VALUES(1)

SELECT TOP 1 AppointmentID, ReturnCode, getDate() SubmittedTime FROM appointments
ORDER BY appointmentID DESC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateUser]    Script Date: 16/07/2022 17:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[sp_CreateUser](
    @emailAddress VARCHAR(100), 
    @passwordHash VARCHAR(100), 
    @oidProvider VARCHAR(100), 
    @oid VARCHAR(100), 
    @Id int out)
AS
BEGIN

INSERT INTO UserProfiles
	(EmailAddress,PasswordHash,OIdProvider,OId)
VALUES(@emailAddress, @passwordHash, @oidProvider, @oid);

-- the state of the output param is set to the Id of the created user record
SELECT @Id=Id FROM UserProfiles WHERE EmailAddress=@emailAddress;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUsers]    Script Date: 16/07/2022 17:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[sp_GetUsers]
		@emailAddress varchar(100),
		@passwordHash varchar(100)

AS
BEGIN

SELECT * FROM dbo.UserProfiles WHERE EmailAddress=@emailAddress and PasswordHash=@passwordHash
END
GO
USE [master]
GO
ALTER DATABASE [NetCoreSp] SET  READ_WRITE 
GO
