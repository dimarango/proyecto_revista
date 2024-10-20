USE [master]
GO
/****** Object:  Database [gestion_editorial]    Script Date: 22/09/2024 5:21:51 p. m. ******/
CREATE DATABASE [gestion_editorial]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'gestion_editorial', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\gestion_editorial.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'gestion_editorial_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\gestion_editorial_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [gestion_editorial] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [gestion_editorial].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [gestion_editorial] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [gestion_editorial] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [gestion_editorial] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [gestion_editorial] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [gestion_editorial] SET ARITHABORT OFF 
GO
ALTER DATABASE [gestion_editorial] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [gestion_editorial] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [gestion_editorial] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [gestion_editorial] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [gestion_editorial] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [gestion_editorial] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [gestion_editorial] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [gestion_editorial] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [gestion_editorial] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [gestion_editorial] SET  ENABLE_BROKER 
GO
ALTER DATABASE [gestion_editorial] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [gestion_editorial] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [gestion_editorial] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [gestion_editorial] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [gestion_editorial] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [gestion_editorial] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [gestion_editorial] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [gestion_editorial] SET RECOVERY FULL 
GO
ALTER DATABASE [gestion_editorial] SET  MULTI_USER 
GO
ALTER DATABASE [gestion_editorial] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [gestion_editorial] SET DB_CHAINING OFF 
GO
ALTER DATABASE [gestion_editorial] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [gestion_editorial] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [gestion_editorial] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [gestion_editorial] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'gestion_editorial', N'ON'
GO
ALTER DATABASE [gestion_editorial] SET QUERY_STORE = ON
GO
ALTER DATABASE [gestion_editorial] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [gestion_editorial]
GO
/****** Object:  Table [dbo].[autores]    Script Date: 22/09/2024 5:21:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[autores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero_documento] [varchar](15) NOT NULL,
	[nombres] [varchar](255) NOT NULL,
	[apellido_paterno] [varchar](255) NOT NULL,
	[apellido_materno] [varchar](255) NOT NULL,
	[celular] [varchar](15) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[fecha_registro] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[coautores]    Script Date: 22/09/2024 5:21:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[coautores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero_documento] [varchar](15) NOT NULL,
	[autor_id] [int] NOT NULL,
	[nombres] [varchar](255) NOT NULL,
	[apellido_paterno] [varchar](255) NOT NULL,
	[apellido_materno] [varchar](255) NOT NULL,
	[celular] [varchar](15) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[fecha_registro] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[conceptos]    Script Date: 22/09/2024 5:21:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[conceptos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[concepto] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[evaluaciones]    Script Date: 22/09/2024 5:21:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evaluaciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[manuscrito_id] [int] NOT NULL,
	[fecha_asignacion] [date] NOT NULL,
	[fase_evaluacion] [varchar](20) NULL,
	[evaluador_id] [int] NOT NULL,
	[fecha_concepto] [varchar](20) NOT NULL,
	[concepto_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[evaluadores]    Script Date: 22/09/2024 5:21:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evaluadores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[persona_id] [int] NOT NULL,
	[tipo_evaluador] [varchar](100) NOT NULL,
	[fecha_registro] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[evaluadores_editorial]    Script Date: 22/09/2024 5:21:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evaluadores_editorial](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero_documento] [varchar](15) NOT NULL,
	[nombres] [varchar](255) NOT NULL,
	[apellido_paterno] [varchar](255) NOT NULL,
	[apellido_materno] [varchar](255) NOT NULL,
	[celular] [varchar](15) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[fecha_registro] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[evaluadores_pares]    Script Date: 22/09/2024 5:21:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evaluadores_pares](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero_documento] [varchar](15) NOT NULL,
	[nombres] [varchar](255) NOT NULL,
	[apellido_paterno] [varchar](255) NOT NULL,
	[apellido_materno] [varchar](255) NOT NULL,
	[celular] [varchar](15) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[fecha_registro] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[evaluadores_tecnico]    Script Date: 22/09/2024 5:21:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evaluadores_tecnico](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero_documento] [varchar](15) NOT NULL,
	[nombres] [varchar](255) NOT NULL,
	[apellido_paterno] [varchar](255) NOT NULL,
	[apellido_materno] [varchar](255) NOT NULL,
	[celular] [varchar](15) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[fecha_registro] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manuscritos]    Script Date: 22/09/2024 5:21:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manuscritos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titulo_manuscrito] [varchar](200) NOT NULL,
	[autor_id] [int] NOT NULL,
	[tipo_manuscrito] [varchar](20) NOT NULL,
	[idioma] [varchar](20) NOT NULL,
	[fecha_recepcion] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[autores] ON 

INSERT [dbo].[autores] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (1, N'741896325', N'Daniel', N'Rodríguez', N'Alonso', N'3145896237', N'danielrodriguez@gmail.com', CAST(N'2023-05-12' AS Date))
INSERT [dbo].[autores] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (2, N'963741258', N'Victoria', N'Herrera', N'Soto', N'3162145987', N'victoriaherrera@yahoo.com', CAST(N'2023-06-10' AS Date))
INSERT [dbo].[autores] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (3, N'852369741', N'Lucía', N'González', N'Palacios', N'3121459876', N'luciagonzalez@hotmail.com', CAST(N'2023-07-04' AS Date))
INSERT [dbo].[autores] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (4, N'456123789', N'Andrés', N'Pardo', N'Zapata', N'3137896541', N'andrespardo@gmail.com', CAST(N'2023-08-11' AS Date))
INSERT [dbo].[autores] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (5, N'789654321', N'Diego', N'Cruz', N'Ramírez', N'3174563214', N'diegocruz@gmail.com', CAST(N'2023-09-15' AS Date))
INSERT [dbo].[autores] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (6, N'147852963', N'Mónica', N'Soto', N'Hernández', N'3145982365', N'monicasoto@hotmail.com', CAST(N'2023-10-22' AS Date))
INSERT [dbo].[autores] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (7, N'951753456', N'Adrián', N'Peña', N'Muñoz', N'3127896547', N'adrianpena@gmail.com', CAST(N'2023-11-30' AS Date))
INSERT [dbo].[autores] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (8, N'753951456', N'Patricia', N'Mora', N'Duarte', N'3152145987', N'patriciamora@gmail.com', CAST(N'2024-01-08' AS Date))
INSERT [dbo].[autores] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (9, N'789456123', N'Sergio', N'Medina', N'Salas', N'3187459621', N'sergiomedina@gmail.com', CAST(N'2024-02-05' AS Date))
INSERT [dbo].[autores] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (10, N'852147963', N'Paola', N'Silva', N'Pérez', N'3178965230', N'paolasilva@gmail.com', CAST(N'2024-03-01' AS Date))
SET IDENTITY_INSERT [dbo].[autores] OFF
GO
SET IDENTITY_INSERT [dbo].[coautores] ON 

INSERT [dbo].[coautores] ([id], [numero_documento], [autor_id], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (1, N'963147852', 1, N'Gloria', N'Zapata', N'Pardo', N'3117896542', N'gloriazapata@gmail.com', CAST(N'2023-07-04' AS Date))
INSERT [dbo].[coautores] ([id], [numero_documento], [autor_id], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (2, N'789654789', 2, N'Juan Carlos', N'Alonso', N'Rodríguez', N'3154789652', N'juan.alonso@gmail.com', CAST(N'2023-09-15' AS Date))
INSERT [dbo].[coautores] ([id], [numero_documento], [autor_id], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (3, N'654789123', 3, N'David', N'Castaño', N'González', N'3205896325', N'davidcastano@gmail.com', CAST(N'2023-04-12' AS Date))
INSERT [dbo].[coautores] ([id], [numero_documento], [autor_id], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (4, N'951753852', 4, N'Clara', N'Vargas', N'López', N'3002145789', N'claravargas@yahoo.com', CAST(N'2023-02-05' AS Date))
INSERT [dbo].[coautores] ([id], [numero_documento], [autor_id], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (5, N'789456852', 5, N'Jorge', N'Alvarez', N'Rendón', N'3134789521', N'jorgealvarez@gmail.com', CAST(N'2023-06-11' AS Date))
INSERT [dbo].[coautores] ([id], [numero_documento], [autor_id], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (6, N'258963147', 6, N'Diana', N'Santos', N'Palacios', N'3121459874', N'dianasantos@gmail.com', CAST(N'2023-03-10' AS Date))
INSERT [dbo].[coautores] ([id], [numero_documento], [autor_id], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (7, N'147852369', 7, N'Alejandro', N'Muñoz', N'Peña', N'3168529741', N'alejandromunoz@hotmail.com', CAST(N'2024-02-07' AS Date))
INSERT [dbo].[coautores] ([id], [numero_documento], [autor_id], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (8, N'963258741', 8, N'Natalia', N'Salas', N'Medina', N'3147895263', N'nataliasalas@gmail.com', CAST(N'2023-05-06' AS Date))
INSERT [dbo].[coautores] ([id], [numero_documento], [autor_id], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (9, N'741258963', 9, N'Marta', N'Duarte', N'Mora', N'3007456213', N'martaduarte@gmail.com', CAST(N'2024-01-25' AS Date))
INSERT [dbo].[coautores] ([id], [numero_documento], [autor_id], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (10, N'456789321', 10, N'Oscar', N'Ramírez', N'Cruz', N'3108963251', N'oscarramirez@hotmail.com', CAST(N'2023-08-15' AS Date))
SET IDENTITY_INSERT [dbo].[coautores] OFF
GO
SET IDENTITY_INSERT [dbo].[conceptos] ON 

INSERT [dbo].[conceptos] ([id], [concepto]) VALUES (1, N'Rechazar')
INSERT [dbo].[conceptos] ([id], [concepto]) VALUES (2, N'Pasar a revisión editorial')
INSERT [dbo].[conceptos] ([id], [concepto]) VALUES (3, N'Pasar a pares')
INSERT [dbo].[conceptos] ([id], [concepto]) VALUES (4, N'Aceptar con modificaciones menores')
INSERT [dbo].[conceptos] ([id], [concepto]) VALUES (5, N'Aceptar con modificaciones mayores')
INSERT [dbo].[conceptos] ([id], [concepto]) VALUES (6, N'Aceptar sin modificaciones')
INSERT [dbo].[conceptos] ([id], [concepto]) VALUES (7, N'Aceptar para publicación')
SET IDENTITY_INSERT [dbo].[conceptos] OFF
GO
SET IDENTITY_INSERT [dbo].[evaluaciones] ON 

INSERT [dbo].[evaluaciones] ([id], [manuscrito_id], [fecha_asignacion], [fase_evaluacion], [evaluador_id], [fecha_concepto], [concepto_id]) VALUES (1, 4, CAST(N'2023-04-12' AS Date), N'Revisión preliminar', 2, N'2023-05-01', 3)
INSERT [dbo].[evaluaciones] ([id], [manuscrito_id], [fecha_asignacion], [fase_evaluacion], [evaluador_id], [fecha_concepto], [concepto_id]) VALUES (2, 3, CAST(N'2023-04-15' AS Date), N'Revisión preliminar', 1, N'2023-05-02', 2)
INSERT [dbo].[evaluaciones] ([id], [manuscrito_id], [fecha_asignacion], [fase_evaluacion], [evaluador_id], [fecha_concepto], [concepto_id]) VALUES (3, 3, CAST(N'2023-04-20' AS Date), N'Revisión editorial', 7, N'2023-05-10', 3)
INSERT [dbo].[evaluaciones] ([id], [manuscrito_id], [fecha_asignacion], [fase_evaluacion], [evaluador_id], [fecha_concepto], [concepto_id]) VALUES (4, 4, CAST(N'2023-05-05' AS Date), N'Revisión editorial', 9, N'2023-06-01', 3)
INSERT [dbo].[evaluaciones] ([id], [manuscrito_id], [fecha_asignacion], [fase_evaluacion], [evaluador_id], [fecha_concepto], [concepto_id]) VALUES (5, 5, CAST(N'2023-06-01' AS Date), N'Revisión preliminar', 5, N'2023-06-15', 2)
INSERT [dbo].[evaluaciones] ([id], [manuscrito_id], [fecha_asignacion], [fase_evaluacion], [evaluador_id], [fecha_concepto], [concepto_id]) VALUES (6, 2, CAST(N'2023-06-06' AS Date), N'Revisión preliminar', 3, N'2023-06-25', 3)
INSERT [dbo].[evaluaciones] ([id], [manuscrito_id], [fecha_asignacion], [fase_evaluacion], [evaluador_id], [fecha_concepto], [concepto_id]) VALUES (7, 5, CAST(N'2023-06-20' AS Date), N'Revisión editorial', 10, N'2023-07-10', 3)
INSERT [dbo].[evaluaciones] ([id], [manuscrito_id], [fecha_asignacion], [fase_evaluacion], [evaluador_id], [fecha_concepto], [concepto_id]) VALUES (8, 6, CAST(N'2023-06-20' AS Date), N'Revisión preliminar', 4, N'2023-07-05', 3)
INSERT [dbo].[evaluaciones] ([id], [manuscrito_id], [fecha_asignacion], [fase_evaluacion], [evaluador_id], [fecha_concepto], [concepto_id]) VALUES (9, 2, CAST(N'2023-06-30' AS Date), N'Revisión editorial', 8, N'2023-07-15', 3)
INSERT [dbo].[evaluaciones] ([id], [manuscrito_id], [fecha_asignacion], [fase_evaluacion], [evaluador_id], [fecha_concepto], [concepto_id]) VALUES (10, 1, CAST(N'2023-07-05' AS Date), N'Revisión preliminar', 4, N'2023-08-14', 2)
INSERT [dbo].[evaluaciones] ([id], [manuscrito_id], [fecha_asignacion], [fase_evaluacion], [evaluador_id], [fecha_concepto], [concepto_id]) VALUES (11, 6, CAST(N'2023-07-10' AS Date), N'Revisión editorial', 7, N'2023-07-25', 3)
INSERT [dbo].[evaluaciones] ([id], [manuscrito_id], [fecha_asignacion], [fase_evaluacion], [evaluador_id], [fecha_concepto], [concepto_id]) VALUES (12, 1, CAST(N'2023-07-10' AS Date), N'Revisión editorial', 9, N'2023-08-20', 3)
INSERT [dbo].[evaluaciones] ([id], [manuscrito_id], [fecha_asignacion], [fase_evaluacion], [evaluador_id], [fecha_concepto], [concepto_id]) VALUES (13, 5, CAST(N'2023-07-20' AS Date), N'Revisión pares', 13, N'2023-08-05', 4)
INSERT [dbo].[evaluaciones] ([id], [manuscrito_id], [fecha_asignacion], [fase_evaluacion], [evaluador_id], [fecha_concepto], [concepto_id]) VALUES (14, 2, CAST(N'2023-07-20' AS Date), N'Revisión pares', 11, N'2023-08-15', 7)
INSERT [dbo].[evaluaciones] ([id], [manuscrito_id], [fecha_asignacion], [fase_evaluacion], [evaluador_id], [fecha_concepto], [concepto_id]) VALUES (15, 6, CAST(N'2023-08-01' AS Date), N'Revisión pares', 11, N'2023-08-15', 6)
INSERT [dbo].[evaluaciones] ([id], [manuscrito_id], [fecha_asignacion], [fase_evaluacion], [evaluador_id], [fecha_concepto], [concepto_id]) VALUES (16, 1, CAST(N'2023-08-25' AS Date), N'Revisión pares', 12, N'2023-09-05', 6)
INSERT [dbo].[evaluaciones] ([id], [manuscrito_id], [fecha_asignacion], [fase_evaluacion], [evaluador_id], [fecha_concepto], [concepto_id]) VALUES (17, 7, CAST(N'2024-02-10' AS Date), N'Revisión preliminar', 5, N'2024-03-01', 2)
INSERT [dbo].[evaluaciones] ([id], [manuscrito_id], [fecha_asignacion], [fase_evaluacion], [evaluador_id], [fecha_concepto], [concepto_id]) VALUES (18, 7, CAST(N'2024-03-10' AS Date), N'Revisión editorial', 10, N'2024-03-20', 3)
INSERT [dbo].[evaluaciones] ([id], [manuscrito_id], [fecha_asignacion], [fase_evaluacion], [evaluador_id], [fecha_concepto], [concepto_id]) VALUES (19, 7, CAST(N'2024-04-01' AS Date), N'Revisión pares', 15, N'2024-04-15', 7)
SET IDENTITY_INSERT [dbo].[evaluaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[evaluadores] ON 

INSERT [dbo].[evaluadores] ([id], [persona_id], [tipo_evaluador], [fecha_registro]) VALUES (1, 1, N'Evaluador editorial', CAST(N'2024-01-17' AS Date))
INSERT [dbo].[evaluadores] ([id], [persona_id], [tipo_evaluador], [fecha_registro]) VALUES (2, 1, N'Evaluador par', CAST(N'2023-06-19' AS Date))
INSERT [dbo].[evaluadores] ([id], [persona_id], [tipo_evaluador], [fecha_registro]) VALUES (3, 1, N'Evaluador técnico', CAST(N'2020-01-20' AS Date))
INSERT [dbo].[evaluadores] ([id], [persona_id], [tipo_evaluador], [fecha_registro]) VALUES (4, 2, N'Evaluador editorial', CAST(N'2021-11-18' AS Date))
INSERT [dbo].[evaluadores] ([id], [persona_id], [tipo_evaluador], [fecha_registro]) VALUES (5, 2, N'Evaluador par', CAST(N'2022-09-29' AS Date))
INSERT [dbo].[evaluadores] ([id], [persona_id], [tipo_evaluador], [fecha_registro]) VALUES (6, 2, N'Evaluador técnico', CAST(N'2022-09-21' AS Date))
INSERT [dbo].[evaluadores] ([id], [persona_id], [tipo_evaluador], [fecha_registro]) VALUES (7, 3, N'Evaluador editorial', CAST(N'2023-04-14' AS Date))
INSERT [dbo].[evaluadores] ([id], [persona_id], [tipo_evaluador], [fecha_registro]) VALUES (8, 3, N'Evaluador par', CAST(N'2023-05-20' AS Date))
INSERT [dbo].[evaluadores] ([id], [persona_id], [tipo_evaluador], [fecha_registro]) VALUES (9, 3, N'Evaluador técnico', CAST(N'2023-04-11' AS Date))
INSERT [dbo].[evaluadores] ([id], [persona_id], [tipo_evaluador], [fecha_registro]) VALUES (10, 4, N'Evaluador editorial', CAST(N'2023-05-18' AS Date))
INSERT [dbo].[evaluadores] ([id], [persona_id], [tipo_evaluador], [fecha_registro]) VALUES (11, 4, N'Evaluador par', CAST(N'2023-06-10' AS Date))
INSERT [dbo].[evaluadores] ([id], [persona_id], [tipo_evaluador], [fecha_registro]) VALUES (12, 4, N'Evaluador técnico', CAST(N'2023-05-15' AS Date))
INSERT [dbo].[evaluadores] ([id], [persona_id], [tipo_evaluador], [fecha_registro]) VALUES (13, 5, N'Evaluador editorial', CAST(N'2023-06-05' AS Date))
INSERT [dbo].[evaluadores] ([id], [persona_id], [tipo_evaluador], [fecha_registro]) VALUES (14, 5, N'Evaluador par', CAST(N'2023-07-01' AS Date))
INSERT [dbo].[evaluadores] ([id], [persona_id], [tipo_evaluador], [fecha_registro]) VALUES (15, 5, N'Evaluador técnico', CAST(N'2023-06-02' AS Date))
SET IDENTITY_INSERT [dbo].[evaluadores] OFF
GO
SET IDENTITY_INSERT [dbo].[evaluadores_editorial] ON 

INSERT [dbo].[evaluadores_editorial] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (1, N'1126358963', N'Sara', N'Castro', N'Rendón', N'3216398452', N'saracastro@hotmail.com', CAST(N'2024-01-17' AS Date))
INSERT [dbo].[evaluadores_editorial] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (2, N'15896475', N'Mauricio', N'Yepes', N'Ospina', N'3045263923', N'mauricioyepes@hotmail.com', CAST(N'2021-11-18' AS Date))
INSERT [dbo].[evaluadores_editorial] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (3, N'256987654', N'Laura', N'Marín', N'Castaño', N'3178965231', N'lauramarin@gmail.com', CAST(N'2023-04-14' AS Date))
INSERT [dbo].[evaluadores_editorial] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (4, N'357951456', N'Pablo', N'Vélez', N'López', N'3194561237', N'pablovelez@gmail.com', CAST(N'2023-05-18' AS Date))
INSERT [dbo].[evaluadores_editorial] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (5, N'963852741', N'Carmen', N'García', N'Martínez', N'3114789635', N'carmengarcia@hotmail.com', CAST(N'2023-06-05' AS Date))
SET IDENTITY_INSERT [dbo].[evaluadores_editorial] OFF
GO
SET IDENTITY_INSERT [dbo].[evaluadores_pares] ON 

INSERT [dbo].[evaluadores_pares] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (1, N'698632', N'Sebastian', N'Matasanos', N'Zarama', N'3158896523', N'sebastianmatasanos@gmail.com', CAST(N'2023-06-19' AS Date))
INSERT [dbo].[evaluadores_pares] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (2, N'5896222', N'Carolina', N'Santamaría', N'Agudelo', N'3002638863', N'carolinasantamaria@hotmail.com', CAST(N'2022-09-29' AS Date))
INSERT [dbo].[evaluadores_pares] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (3, N'753951147', N'Alberto', N'Ortega', N'Gómez', N'3114789521', N'albertoortega@hotmail.com', CAST(N'2023-05-20' AS Date))
INSERT [dbo].[evaluadores_pares] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (4, N'963852147', N'Daniela', N'Ríos', N'Santos', N'3158965237', N'danielarios@gmail.com', CAST(N'2023-06-10' AS Date))
INSERT [dbo].[evaluadores_pares] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (5, N'357159753', N'Mario', N'López', N'García', N'3147859632', N'mariolopez@yahoo.com', CAST(N'2023-07-01' AS Date))
SET IDENTITY_INSERT [dbo].[evaluadores_pares] OFF
GO
SET IDENTITY_INSERT [dbo].[evaluadores_tecnico] ON 

INSERT [dbo].[evaluadores_tecnico] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (1, N'5896365', N'Carlos', N'Marín', N'Zapata', N'3205678542', N'carlosmarin@yahoo.es', CAST(N'2020-01-20' AS Date))
INSERT [dbo].[evaluadores_tecnico] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (2, N'2596352', N'Camila', N'Salazar', N'Agudelo', N'3102639863', N'camilasalazar@gmail.com', CAST(N'2022-09-21' AS Date))
INSERT [dbo].[evaluadores_tecnico] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (3, N'741852963', N'David', N'Pérez', N'Gómez', N'3127859625', N'davidperez@hotmail.com', CAST(N'2023-04-11' AS Date))
INSERT [dbo].[evaluadores_tecnico] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (4, N'369852147', N'Ana', N'Morales', N'Vargas', N'3145896321', N'anam@gmail.com', CAST(N'2023-05-15' AS Date))
INSERT [dbo].[evaluadores_tecnico] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_registro]) VALUES (5, N'753951456', N'Elena', N'Ríos', N'Santos', N'3004789652', N'elena@hotmail.com', CAST(N'2023-06-02' AS Date))
SET IDENTITY_INSERT [dbo].[evaluadores_tecnico] OFF
GO
SET IDENTITY_INSERT [dbo].[manuscritos] ON 

INSERT [dbo].[manuscritos] ([id], [titulo_manuscrito], [autor_id], [tipo_manuscrito], [idioma], [fecha_recepcion]) VALUES (1, N'Ingeniería Ambiental y Sostenibilidad', 1, N'investigación', N'español', CAST(N'2023-07-02' AS Date))
INSERT [dbo].[manuscritos] ([id], [titulo_manuscrito], [autor_id], [tipo_manuscrito], [idioma], [fecha_recepcion]) VALUES (2, N'Revolución de la Industria 4.0', 2, N'reflexión', N'español', CAST(N'2023-09-12' AS Date))
INSERT [dbo].[manuscritos] ([id], [titulo_manuscrito], [autor_id], [tipo_manuscrito], [idioma], [fecha_recepcion]) VALUES (3, N'Estudio sobre Energías Renovables', 3, N'reflexión', N'español', CAST(N'2023-04-15' AS Date))
INSERT [dbo].[manuscritos] ([id], [titulo_manuscrito], [autor_id], [tipo_manuscrito], [idioma], [fecha_recepcion]) VALUES (4, N'Inteligencia Artificial: Nuevas Fronteras', 4, N'investigación', N'inglés', CAST(N'2023-02-05' AS Date))
INSERT [dbo].[manuscritos] ([id], [titulo_manuscrito], [autor_id], [tipo_manuscrito], [idioma], [fecha_recepcion]) VALUES (5, N'Impacto del Cambio Climático en la Biodiversidad', 5, N'revisión', N'español', CAST(N'2023-06-10' AS Date))
INSERT [dbo].[manuscritos] ([id], [titulo_manuscrito], [autor_id], [tipo_manuscrito], [idioma], [fecha_recepcion]) VALUES (6, N'El Futuro de la Robótica', 6, N'revisión', N'español', CAST(N'2023-03-11' AS Date))
INSERT [dbo].[manuscritos] ([id], [titulo_manuscrito], [autor_id], [tipo_manuscrito], [idioma], [fecha_recepcion]) VALUES (7, N'Nuevas Tecnologías en el Siglo XXI', 7, N'reflexión', N'inglés', CAST(N'2024-02-01' AS Date))
INSERT [dbo].[manuscritos] ([id], [titulo_manuscrito], [autor_id], [tipo_manuscrito], [idioma], [fecha_recepcion]) VALUES (8, N'Biotecnología y Avances Médicos', 8, N'investigación', N'español', CAST(N'2023-05-10' AS Date))
INSERT [dbo].[manuscritos] ([id], [titulo_manuscrito], [autor_id], [tipo_manuscrito], [idioma], [fecha_recepcion]) VALUES (9, N'Blockchain: Desafíos y Oportunidades', 9, N'revisión', N'inglés', CAST(N'2024-01-25' AS Date))
INSERT [dbo].[manuscritos] ([id], [titulo_manuscrito], [autor_id], [tipo_manuscrito], [idioma], [fecha_recepcion]) VALUES (10, N'Ciencias del Comportamiento en la Era Digital', 10, N'reflexión', N'español', CAST(N'2023-08-10' AS Date))
SET IDENTITY_INSERT [dbo].[manuscritos] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__autores__7B886A63BCF33E09]    Script Date: 22/09/2024 5:21:52 p. m. ******/
ALTER TABLE [dbo].[autores] ADD UNIQUE NONCLUSTERED 
(
	[numero_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__coautore__7B886A63625E6E7D]    Script Date: 22/09/2024 5:21:52 p. m. ******/
ALTER TABLE [dbo].[coautores] ADD UNIQUE NONCLUSTERED 
(
	[numero_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__evaluado__7B886A6371194E87]    Script Date: 22/09/2024 5:21:52 p. m. ******/
ALTER TABLE [dbo].[evaluadores_editorial] ADD UNIQUE NONCLUSTERED 
(
	[numero_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__evaluado__7B886A63BB6AC23E]    Script Date: 22/09/2024 5:21:52 p. m. ******/
ALTER TABLE [dbo].[evaluadores_pares] ADD UNIQUE NONCLUSTERED 
(
	[numero_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__evaluado__7B886A6355006AD4]    Script Date: 22/09/2024 5:21:52 p. m. ******/
ALTER TABLE [dbo].[evaluadores_tecnico] ADD UNIQUE NONCLUSTERED 
(
	[numero_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__manuscri__2E339AC46D23E601]    Script Date: 22/09/2024 5:21:52 p. m. ******/
ALTER TABLE [dbo].[manuscritos] ADD UNIQUE NONCLUSTERED 
(
	[titulo_manuscrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[coautores]  WITH CHECK ADD  CONSTRAINT [fk_autores_coautores] FOREIGN KEY([autor_id])
REFERENCES [dbo].[autores] ([id])
GO
ALTER TABLE [dbo].[coautores] CHECK CONSTRAINT [fk_autores_coautores]
GO
ALTER TABLE [dbo].[evaluaciones]  WITH CHECK ADD  CONSTRAINT [fk_conceptos_evaluaciones] FOREIGN KEY([concepto_id])
REFERENCES [dbo].[conceptos] ([id])
GO
ALTER TABLE [dbo].[evaluaciones] CHECK CONSTRAINT [fk_conceptos_evaluaciones]
GO
ALTER TABLE [dbo].[evaluaciones]  WITH CHECK ADD  CONSTRAINT [fk_evaluadores_evaluaciones] FOREIGN KEY([evaluador_id])
REFERENCES [dbo].[evaluadores] ([id])
GO
ALTER TABLE [dbo].[evaluaciones] CHECK CONSTRAINT [fk_evaluadores_evaluaciones]
GO
ALTER TABLE [dbo].[evaluaciones]  WITH CHECK ADD  CONSTRAINT [fk_manuscritos_evaluaciones] FOREIGN KEY([manuscrito_id])
REFERENCES [dbo].[manuscritos] ([id])
GO
ALTER TABLE [dbo].[evaluaciones] CHECK CONSTRAINT [fk_manuscritos_evaluaciones]
GO
ALTER TABLE [dbo].[manuscritos]  WITH CHECK ADD  CONSTRAINT [fk_manuscritos_autores] FOREIGN KEY([autor_id])
REFERENCES [dbo].[autores] ([id])
GO
ALTER TABLE [dbo].[manuscritos] CHECK CONSTRAINT [fk_manuscritos_autores]
GO
USE [master]
GO
ALTER DATABASE [gestion_editorial] SET  READ_WRITE 
GO
