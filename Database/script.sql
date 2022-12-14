USE [master]
GO
/****** Object:  Database [mioPharma-db]    Script Date: 5/11/2022 17:34:49 ******/
CREATE DATABASE [mioPharma-db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mioPharma-db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\mioPharma-db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mioPharma-db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\mioPharma-db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [mioPharma-db] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mioPharma-db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mioPharma-db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mioPharma-db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mioPharma-db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mioPharma-db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mioPharma-db] SET ARITHABORT OFF 
GO
ALTER DATABASE [mioPharma-db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mioPharma-db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mioPharma-db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mioPharma-db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mioPharma-db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mioPharma-db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mioPharma-db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mioPharma-db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mioPharma-db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mioPharma-db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [mioPharma-db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mioPharma-db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mioPharma-db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mioPharma-db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mioPharma-db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mioPharma-db] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [mioPharma-db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mioPharma-db] SET RECOVERY FULL 
GO
ALTER DATABASE [mioPharma-db] SET  MULTI_USER 
GO
ALTER DATABASE [mioPharma-db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mioPharma-db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mioPharma-db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mioPharma-db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [mioPharma-db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [mioPharma-db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'mioPharma-db', N'ON'
GO
ALTER DATABASE [mioPharma-db] SET QUERY_STORE = OFF
GO
USE [mioPharma-db]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/11/2022 17:34:49 ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 5/11/2022 17:34:49 ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/11/2022 17:34:49 ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/11/2022 17:34:49 ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/11/2022 17:34:49 ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/11/2022 17:34:49 ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/11/2022 17:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Apellido] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
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
	[UserLvl] [int] NOT NULL,
	[UserState] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 5/11/2022 17:34:49 ******/
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
/****** Object:  Table [dbo].[CarritoCompraItems]    Script Date: 5/11/2022 17:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarritoCompraItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MedicamentoId] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[CarritoCompraId] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_CarritoCompraItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicamentos]    Script Date: 5/11/2022 17:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicamentos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](45) NOT NULL,
	[Precio] [float] NOT NULL,
	[Presentacion] [nvarchar](250) NOT NULL,
	[Existencias] [float] NOT NULL,
	[Descripcion] [nvarchar](250) NOT NULL,
	[Img_Composicion] [nvarchar](max) NOT NULL,
	[Img_Medicamento] [nvarchar](max) NOT NULL,
	[EstadoM] [int] NOT NULL,
 CONSTRAINT [PK_Medicamentos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenItems]    Script Date: 5/11/2022 17:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [float] NOT NULL,
	[MedicamentoId] [int] NOT NULL,
	[OrdenId] [int] NOT NULL,
 CONSTRAINT [PK_OrdenItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ordens]    Script Date: 5/11/2022 17:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ordens](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Ordens] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221005045717_Initial', N'6.0.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221005050115_Initial2', N'6.0.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221005053652_3', N'6.0.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221007065154_Update', N'6.0.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221030232555_Update_Models', N'6.0.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221031043753_orders', N'6.0.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221031045532_All', N'6.0.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221103054839_Test', N'6.0.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221104193417_UpdateUserTable', N'6.0.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221104194542_AddState', N'6.0.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221105070540_UpdateTables', N'6.0.9')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'64a0e654-2a75-4eec-aaaa-ed63bb135885', N'Admin', N'ADMIN', N'3d24c812-a726-4452-9b28-10d4cfbf633c')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'84ae52ed-dc73-4741-ad7f-1ec5b6f1bf52', N'User', N'USER', N'3c4b2d22-7789-46db-ae2a-4ea735a6dade')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'28260940-519d-4874-84fb-76384e2bd5a7', N'64a0e654-2a75-4eec-aaaa-ed63bb135885')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4cbd9d95-b85f-48cf-b4bf-faa839c6cf8d', N'84ae52ed-dc73-4741-ad7f-1ec5b6f1bf52')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Nombre], [Apellido], [Address], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [UserLvl], [UserState]) VALUES (N'28260940-519d-4874-84fb-76384e2bd5a7', N'Admin', N'User', N'Miopharma', N'admin.user', N'ADMIN.USER', N'admin@miopharma.com', N'ADMIN@MIOPHARMA.COM', 1, N'AQAAAAEAACcQAAAAEEanJ4Xs74iXQnaeS+qlRh6lLh6yY7bRUSEu8Gjv24sWFq9/YiLdclImCNiIugZ1yQ==', N'RZKLM43OW7R5USWJ5VJIRO27KPQNHLZD', N'0f86fc0c-689f-41c0-bd43-221e49884076', N'2055-6000', 0, 0, NULL, 1, 0, 1, 1)
INSERT [dbo].[AspNetUsers] ([Id], [Nombre], [Apellido], [Address], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [UserLvl], [UserState]) VALUES (N'4cbd9d95-b85f-48cf-b4bf-faa839c6cf8d', N'Application', N'User', N'Miopharma', N'app.user', N'APP.USER', N'test_user@miopharma.com', N'TEST_USER@MIOPHARMA.COM', 1, N'AQAAAAEAACcQAAAAEO+kT258uR8oUlRB45Y+LS6jmsK9YIIIW6umqzAV8qcclZWwcqH/yGM8y5wweSzh2A==', N'H6WU47DJTWLLGH2LBH4X24LDRWKYJ7WW', N'1fc67352-964f-4637-b182-38c9f319a89b', N'2055-6000', 0, 0, NULL, 1, 0, 0, 1)
GO
SET IDENTITY_INSERT [dbo].[CarritoCompraItems] ON 

INSERT [dbo].[CarritoCompraItems] ([Id], [MedicamentoId], [Cantidad], [CarritoCompraId]) VALUES (1, 3, 1, N'6ecc4c3f-723f-4b10-a6bb-128601b2887e')
SET IDENTITY_INSERT [dbo].[CarritoCompraItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Medicamentos] ON 

INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (1, N'Crecitin', 15.29, N'240ml', 200, N'Vitaminico Antianemico Estimulante del apetito Promueve el crecimiento', N'https://miopharma-dse.000webhostapp.com/img/CRECITIN2.jpg', N'https://miopharma-dse.000webhostapp.com/img/CRECITIN1.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (2, N'Calcicom', 5.99, N'120ml', 150, N'suspension vitaminada de calcio', N'https://matronly-strap.000webhostapp.com/img/PROD41165.jpg', N'https://miopharma-dse.000webhostapp.com/img/CALCICOM1.jpg', 2)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (3, N'Comnitussin D', 6.71, N'120ml', 210, N'Expectorante', N'https://matronly-strap.000webhostapp.com/img/PROD28341.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD80664.jpg', 2)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (4, N'Complejo B', 3.4, N'180ml', 45, N'Multivitaminico antianemico', N'https://miopharma-dse.000webhostapp.com/img/COMPLEJOB2.jpg', N'https://miopharma-dse.000webhostapp.com/img/COMPLEJOB1.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (5, N'Dolan', 4.75, N'120ml', 75, N'Estados febriles de todo tipo', N'https://miopharma-dse.000webhostapp.com/img/DOLAN2.jpg', N'https://miopharma-dse.000webhostapp.com/img/DOLAN1.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (6, N'Enteropax ', 8.49, N'120ml', 56, N'Indicado en diarreas infecciosas', N'https://miopharma-dse.000webhostapp.com/img/ENTEROPRAX2.jpg', N'https://miopharma-dse.000webhostapp.com/img/ENTEROPRAX1.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (7, N'Ferritol forte', 16.3, N'180ml', 145, N'Preventivo de las anemias ferroptivas', N'https://miopharma-dse.000webhostapp.com/img/FERRITOL2.JPG', N'https://miopharma-dse.000webhostapp.com/img/FERRITOL1.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (8, N'Sulfatrim', 8.5, N'120ml', 78, N'infecciones vias respiratorias', N'https://miopharma-dse.000webhostapp.com/img/SULFATRIM2.jpg', N'https://miopharma-dse.000webhostapp.com/img/SULFATRIM1.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (9, N'komilon', 8.5, N'120ml', 156, N'estimulante de apetito', N'https://miopharma-dse.000webhostapp.com/img/KOMILONJARABE2.jpg', N'https://miopharma-dse.000webhostapp.com/img/KOMILONJARABE.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (10, N'Neurfosfaton', 11.5, N'15ml', 198, N'Estimulante de la actividad cerebral.', N'https://miopharma-dse.000webhostapp.com/img/NEUROFOSFATON2.jpg', N'https://miopharma-dse.000webhostapp.com/img/NEUROFOSFATON1.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (11, N'Ginseng jalea real ', 19.54, N'100ml', 147, N'Estimulante cerebral', N'https://miopharma-dse.000webhostapp.com/img/GINSENG2.jpg', N'https://miopharma-dse.000webhostapp.com/img/GINSENG1.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (12, N'Hemanina forte', 15, N'15ml', 145, N'molestias nerviosas', N'https://miopharma-dse.000webhostapp.com/img/HEMANINA2.jpg', N'https://miopharma-dse.000webhostapp.com/img/HEMANINA1.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (13, N'Komilon adulto', 8, N'15ml', 130, N'estimulante del apetito en adultos', N'https://miopharma-dse.000webhostapp.com/img/KOMILONAD2.jpg', N'https://miopharma-dse.000webhostapp.com/img/KOMILONAD.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (14, N'Higa crombic ferrum', 15.55, N'15ml', 142, N'desintoxicante del higado', N'https://miopharma-dse.000webhostapp.com/img/HIGA2.jpg', N'https://miopharma-dse.000webhostapp.com/img/HIGA1.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (15, N'Mentevital forte', 12.69, N'15ml', 250, N'reduce fatiga mental', N'https://miopharma-dse.000webhostapp.com/img/MENTEVITAL2.jpg', N'https://miopharma-dse.000webhostapp.com/img/MENTEVITAL1.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (16, N'Neuro ferritol', 12, N'15ml', 120, N'Estimulante cerebral', N'https://miopharma-dse.000webhostapp.com/img/NEUROFERRITOL2.jpg', N'https://miopharma-dse.000webhostapp.com/img/NEUROFERRITOL1.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (17, N'Parasitol', 5.16, N'10ml', 254, N'tratamiento de Lombrices, solitarias', N'https://miopharma-dse.000webhostapp.com/img/PARASITOL2.jpg', N'https://miopharma-dse.000webhostapp.com/img/PARASITOL1.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (18, N'Sinesstres', 20.99, N'15ml', 156, N'Estimulante de la actividad cerebral', N'https://miopharma-dse.000webhostapp.com/img/SINESTRES2.jpg', N'https://miopharma-dse.000webhostapp.com/img/SINESTRES1.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (19, N'Neuro bh plus', 9.27, N'50cap', 135, N'fatiga', N'https://miopharma-dse.000webhostapp.com/img/NEUROBH2.jpg', N'https://miopharma-dse.000webhostapp.com/img/NEUROBH1.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (20, N'Neuronutron', 8.02, N'50cap', 175, N'Estimulante actividad cerebral', N'https://miopharma-dse.000webhostapp.com/img/NEURONUTRON2.jpg', N'https://miopharma-dse.000webhostapp.com/img/NEURONUTRON1.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (21, N'Prolife', 25, N'50cap', 350, N'antioxidante celular', N'https://miopharma-dse.000webhostapp.com/img/PROLIFE2.jpg', N'https://miopharma-dse.000webhostapp.com/img/PROLIFE1.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (22, N'Supervital forte', 25, N'100cap', 325, N'complemento dietetico', N'https://miopharma-dse.000webhostapp.com/img/SUPERVITAL2.jpg', N'https://miopharma-dse.000webhostapp.com/img/SUPERVITAL1.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (23, N'Komilon plus', 9.54, N'50cap', 156, N'estimulante del apetito', N'https://miopharma-dse.000webhostapp.com/img/KPLUS2.jpg', N'https://miopharma-dse.000webhostapp.com/img/KPLUS1.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (24, N'Cevicom', 22.9, N'0.5oz', 325, N'regeneracion celular', N'https://miopharma-dse.000webhostapp.com/img/CALCICOM2.jpg', N'https://miopharma-dse.000webhostapp.com/img/CEVICON1.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (25, N'Diclofan', 6.75, N'15ml', 45, N'anti inflmatorio', N'https://miopharma-dse.000webhostapp.com/img/DICLOFAN2.jpg', N'https://miopharma-dse.000webhostapp.com/img/DICLOFAN1.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (26, N'Ginseng dorado', 10.21, N'100cap', 320, N'anti fatiga', N'https://miopharma-dse.000webhostapp.com/img/GINSEND2.png', N'https://miopharma-dse.000webhostapp.com/img/GINSEND1.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (27, N'Mebapol', 7.85, N'100mg', 125, N'erradicacion de parasitos', N'https://miopharma-dse.000webhostapp.com/img/MEBA2.jpg', N'https://miopharma-dse.000webhostapp.com/img/MEBA1.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (28, N'Raskafin', 7.45, N'30ml', 201, N'afecciones cutaneas', N'https://miopharma-dse.000webhostapp.com/img/RASKAFIN2.jpg', N'https://miopharma-dse.000webhostapp.com/img/RASKAFIN.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (29, N'Loratydine', 5.52, N'100ml', 321, N'rinitis alergica', N'https://miopharma-dse.000webhostapp.com/img/LORATADINE2.jpg', N'https://miopharma-dse.000webhostapp.com/img/LORATADINE1.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (30, N'Secnidol forte', 7.5, N'30ml', 254, N'tratamiento eficaz amibas', N'https://miopharma-dse.000webhostapp.com/img/SECNIDOL2.jpg', N'https://miopharma-dse.000webhostapp.com/img/SECNIDOL1.jpg', 1)
SET IDENTITY_INSERT [dbo].[Medicamentos] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 5/11/2022 17:34:49 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 5/11/2022 17:34:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 5/11/2022 17:34:49 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 5/11/2022 17:34:49 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 5/11/2022 17:34:49 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 5/11/2022 17:34:49 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 5/11/2022 17:34:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CarritoCompraItems_MedicamentoId]    Script Date: 5/11/2022 17:34:49 ******/
CREATE NONCLUSTERED INDEX [IX_CarritoCompraItems_MedicamentoId] ON [dbo].[CarritoCompraItems]
(
	[MedicamentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrdenItems_MedicamentoId]    Script Date: 5/11/2022 17:34:49 ******/
CREATE NONCLUSTERED INDEX [IX_OrdenItems_MedicamentoId] ON [dbo].[OrdenItems]
(
	[MedicamentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrdenItems_OrdenId]    Script Date: 5/11/2022 17:34:49 ******/
CREATE NONCLUSTERED INDEX [IX_OrdenItems_OrdenId] ON [dbo].[OrdenItems]
(
	[OrdenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Ordens_UserId]    Script Date: 5/11/2022 17:34:49 ******/
CREATE NONCLUSTERED INDEX [IX_Ordens_UserId] ON [dbo].[Ordens]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT ((0)) FOR [UserLvl]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT ((0)) FOR [UserState]
GO
ALTER TABLE [dbo].[Medicamentos] ADD  DEFAULT ((0)) FOR [EstadoM]
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
ALTER TABLE [dbo].[CarritoCompraItems]  WITH CHECK ADD  CONSTRAINT [FK_CarritoCompraItems_Medicamentos_MedicamentoId] FOREIGN KEY([MedicamentoId])
REFERENCES [dbo].[Medicamentos] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarritoCompraItems] CHECK CONSTRAINT [FK_CarritoCompraItems_Medicamentos_MedicamentoId]
GO
ALTER TABLE [dbo].[OrdenItems]  WITH CHECK ADD  CONSTRAINT [FK_OrdenItems_Medicamentos_MedicamentoId] FOREIGN KEY([MedicamentoId])
REFERENCES [dbo].[Medicamentos] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrdenItems] CHECK CONSTRAINT [FK_OrdenItems_Medicamentos_MedicamentoId]
GO
ALTER TABLE [dbo].[OrdenItems]  WITH CHECK ADD  CONSTRAINT [FK_OrdenItems_Ordens_OrdenId] FOREIGN KEY([OrdenId])
REFERENCES [dbo].[Ordens] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrdenItems] CHECK CONSTRAINT [FK_OrdenItems_Ordens_OrdenId]
GO
ALTER TABLE [dbo].[Ordens]  WITH CHECK ADD  CONSTRAINT [FK_Ordens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ordens] CHECK CONSTRAINT [FK_Ordens_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [mioPharma-db] SET  READ_WRITE 
GO
