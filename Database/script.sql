USE [master]
GO
/****** Object:  Database [mioPharma-db]    Script Date: 8/10/2022 21:46:33 ******/
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/10/2022 21:46:33 ******/
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
/****** Object:  Table [dbo].[Clientes]    Script Date: 8/10/2022 21:46:33 ******/
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
/****** Object:  Table [dbo].[Medicamentos]    Script Date: 8/10/2022 21:46:33 ******/
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 8/10/2022 21:46:33 ******/
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
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221005045717_Initial', N'6.0.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221005050115_Initial2', N'6.0.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221005053652_3', N'6.0.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221007065154_Update', N'6.0.9')
GO
SET IDENTITY_INSERT [dbo].[Medicamentos] ON 

INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (1, N'Crecitin', 15.29, N'240ml', 200, N'Vitaminico Antianemico Estimulante del apetito Promueve el crecimiento', N'https://matronly-strap.000webhostapp.com/img/PROD21125.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD55400.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (2, N'Calcicom', 5.99, N'120ml', 150, N'suspension vitaminada de calcio', N'https://matronly-strap.000webhostapp.com/img/PROD41165.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD34281.png', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (3, N'Comnitussin D', 6.71, N'120ml', 210, N'Expectorante', N'https://matronly-strap.000webhostapp.com/img/PROD28341.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD80664.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (4, N'Complejo B', 3.4, N'180ml', 45, N'Multivitaminico antianemico', N'https://matronly-strap.000webhostapp.com/img/PROD69601.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD68817.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (5, N'Dolan', 4.75, N'120ml', 75, N'Estados febriles de todo tipo', N'https://matronly-strap.000webhostapp.com/img/PROD83596.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD64970.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (6, N'Enteropax ', 8.49, N'120ml', 56, N'Indicado en diarreas infecciosas', N'https://matronly-strap.000webhostapp.com/img/PROD11156.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD68788.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (7, N'Ferritol forte', 16.3, N'180ml', 145, N'Preventivo de las anemias ferroptivas', N'https://matronly-strap.000webhostapp.com/img/PROD34636.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD87058.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (8, N'Sulfatrim', 8.5, N'120ml', 78, N'infecciones vias respiratorias', N'https://matronly-strap.000webhostapp.com/img/PROD97924.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD98370.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (9, N'komilon', 8.5, N'120ml', 156, N'estimulante de apetito', N'https://matronly-strap.000webhostapp.com/img/PROD84647.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD16547.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (10, N'Neurfosfaton', 11.5, N'15ml', 198, N'Estimulante de la actividad cerebral.', N'https://matronly-strap.000webhostapp.com/img/PROD43920.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD80733.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (11, N'Ginseng jalea real ', 19.54, N'100ml', 147, N'Estimulante cerebral', N'https://matronly-strap.000webhostapp.com/img/PROD30969.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD39363.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (12, N'Hemanina forte', 15, N'15ml', 145, N'molestias nerviosas', N'https://matronly-strap.000webhostapp.com/img/PROD79437.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD99530.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (13, N'Komilon adulto', 8, N'15ml', 130, N'estimulante del apetito en adultos', N'https://matronly-strap.000webhostapp.com/img/PROD49695.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD55054.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (14, N'Higa crombic ferrum', 15.55, N'15ml', 142, N'desintoxicante del higado', N'https://matronly-strap.000webhostapp.com/img/PROD32527.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD67591.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (15, N'Mentevital forte', 12.69, N'15ml', 250, N'reduce fatiga mental', N'https://matronly-strap.000webhostapp.com/img/PROD64209.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD28315.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (16, N'Neuro ferritol', 12, N'15ml', 120, N'Estimulante cerebral', N'https://matronly-strap.000webhostapp.com/img/PROD56868.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD70072.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (17, N'Parasitol', 5.16, N'10ml', 254, N'tratamiento de Lombrices, solitarias', N'https://matronly-strap.000webhostapp.com/img/PROD75024.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD23458.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (18, N'Sinesstres', 20.99, N'15ml', 156, N'Estimulante de la actividad cerebral', N'https://matronly-strap.000webhostapp.com/img/PROD68523.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD55053.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (19, N'Neuro bh plus', 9.27, N'50cap', 135, N'fatiga', N'https://matronly-strap.000webhostapp.com/img/PROD50460.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD49351.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (20, N'Neuronutron', 8.02, N'50cap', 175, N'Estimulante actividad cerebral', N'https://matronly-strap.000webhostapp.com/img/PROD26289.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD92307.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (21, N'Prolife', 25, N'50cap', 350, N'antioxidante celular', N'https://matronly-strap.000webhostapp.com/img/PROD17633.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD86817.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (22, N'Supervital forte', 25, N'100cap', 325, N'complemento dietetico', N'https://matronly-strap.000webhostapp.com/img/PROD50710.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD92651.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (23, N'Komilon plus', 9.54, N'50cap', 156, N'estimulante del apetito', N'https://matronly-strap.000webhostapp.com/img/PROD40252.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD72317.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (24, N'Cevicom', 22.9, N'0.5oz', 325, N'regeneracion celular', N'https://matronly-strap.000webhostapp.com/img/PROD17394.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD14078.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (25, N'Diclofan', 6.75, N'15ml', 45, N'anti inflmatorio', N'https://matronly-strap.000webhostapp.com/img/PROD55098.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD63761.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (26, N'Ginseng dorado', 10.21, N'100cap', 320, N'anti fatiga', N'https://matronly-strap.000webhostapp.com/img/PROD18525.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD82155.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (27, N'Mebapol', 7.85, N'100mg', 125, N'erradicacion de parasitos', N'https://matronly-strap.000webhostapp.com/img/PROD43853.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD84801.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (28, N'Raskafin', 7.45, N'30ml', 201, N'afecciones cutaneas', N'https://matronly-strap.000webhostapp.com/img/PROD60333.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD85837.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (29, N'Loratydine', 5.52, N'100ml', 321, N'rinitis alergica', N'https://matronly-strap.000webhostapp.com/img/PROD47329.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD22301.jpg', 1)
INSERT [dbo].[Medicamentos] ([Id], [Nombre], [Precio], [Presentacion], [Existencias], [Descripcion], [Img_Composicion], [Img_Medicamento], [EstadoM]) VALUES (30, N'Secnidol forte', 7.5, N'30ml', 254, N'tratamiento eficaz amibas', N'https://matronly-strap.000webhostapp.com/img/PROD67926.jpg', N'https://matronly-strap.000webhostapp.com/img/PROD18585.jpg', 1)
SET IDENTITY_INSERT [dbo].[Medicamentos] OFF
GO
ALTER TABLE [dbo].[Medicamentos] ADD  DEFAULT ((0)) FOR [EstadoM]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((0)) FOR [TipoU]
GO
USE [master]
GO
ALTER DATABASE [mioPharma-db] SET  READ_WRITE 
GO
