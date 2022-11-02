USE [master]
GO
/****** Object:  Database [mioPharma-db]    Script Date: 1/11/2022 22:59:08 ******/
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 1/11/2022 22:59:08 ******/
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
/****** Object:  Table [dbo].[CarritoCompraItems]    Script Date: 1/11/2022 22:59:08 ******/
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
/****** Object:  Table [dbo].[Clientes]    Script Date: 1/11/2022 22:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](45) NOT NULL,
	[Apellido] [nvarchar](45) NOT NULL,
	[Telefono] [nvarchar](max) NOT NULL,
	[Direccion] [nvarchar](250) NOT NULL,
	[Correo] [nvarchar](max) NOT NULL,
	[Clave] [nvarchar](max) NOT NULL,
	[EstadoC] [int] NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicamentos]    Script Date: 1/11/2022 22:59:08 ******/
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
/****** Object:  Table [dbo].[OrdenItems]    Script Date: 1/11/2022 22:59:08 ******/
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
/****** Object:  Table [dbo].[Ordens]    Script Date: 1/11/2022 22:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ordens](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[UserId] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Ordens] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 1/11/2022 22:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](45) NOT NULL,
	[Apellido] [nvarchar](45) NOT NULL,
	[Correo] [nvarchar](max) NOT NULL,
	[Clave] [nvarchar](max) NOT NULL,
	[EstadoU] [int] NOT NULL,
	[TipoU] [int] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_CarritoCompraItems_MedicamentoId]    Script Date: 1/11/2022 22:59:09 ******/
CREATE NONCLUSTERED INDEX [IX_CarritoCompraItems_MedicamentoId] ON [dbo].[CarritoCompraItems]
(
	[MedicamentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrdenItems_MedicamentoId]    Script Date: 1/11/2022 22:59:09 ******/
CREATE NONCLUSTERED INDEX [IX_OrdenItems_MedicamentoId] ON [dbo].[OrdenItems]
(
	[MedicamentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrdenItems_OrdenId]    Script Date: 1/11/2022 22:59:09 ******/
CREATE NONCLUSTERED INDEX [IX_OrdenItems_OrdenId] ON [dbo].[OrdenItems]
(
	[OrdenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Medicamentos] ADD  DEFAULT ((0)) FOR [EstadoM]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((0)) FOR [TipoU]
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
USE [master]
GO
ALTER DATABASE [mioPharma-db] SET  READ_WRITE 
GO
