USE [master]
GO
/****** Object:  Database [ProyectoSanatorio]    Script Date: 27/03/2020 23:49:21 ******/
CREATE DATABASE [ProyectoSanatorio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProyectoSanatorio', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ProyectoSanatorio.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProyectoSanatorio_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ProyectoSanatorio_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ProyectoSanatorio] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProyectoSanatorio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProyectoSanatorio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProyectoSanatorio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProyectoSanatorio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProyectoSanatorio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProyectoSanatorio] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProyectoSanatorio] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProyectoSanatorio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProyectoSanatorio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProyectoSanatorio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProyectoSanatorio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProyectoSanatorio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProyectoSanatorio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProyectoSanatorio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProyectoSanatorio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProyectoSanatorio] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProyectoSanatorio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProyectoSanatorio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProyectoSanatorio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProyectoSanatorio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProyectoSanatorio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProyectoSanatorio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProyectoSanatorio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProyectoSanatorio] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProyectoSanatorio] SET  MULTI_USER 
GO
ALTER DATABASE [ProyectoSanatorio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProyectoSanatorio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProyectoSanatorio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProyectoSanatorio] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProyectoSanatorio] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProyectoSanatorio] SET QUERY_STORE = OFF
GO
USE [ProyectoSanatorio]
GO
/****** Object:  Table [dbo].[Gasto_Hospital]    Script Date: 27/03/2020 23:49:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gasto_Hospital](
	[Precio_Dosis] [money] NOT NULL,
	[Codigo_Medicamento] [int] NOT NULL,
	[Precio_Envase] [money] NOT NULL,
 CONSTRAINT [PK_Gasto_Hospital] PRIMARY KEY CLUSTERED 
(
	[Precio_Envase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Informe]    Script Date: 27/03/2020 23:49:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Informe](
	[No_Informe] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[Tipo_Medicamento] [int] NOT NULL,
	[Dosis_Paciente] [numeric](5, 3) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [time](4) NOT NULL,
	[Medico] [int] NOT NULL,
 CONSTRAINT [PK_Informe] PRIMARY KEY CLUSTERED 
(
	[No_Informe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingreso]    Script Date: 27/03/2020 23:49:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingreso](
	[No_Ingreso] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[Fecha_Inicial] [date] NOT NULL,
	[Fecha_Dalta] [date] NOT NULL,
	[Diagnostico] [varchar](150) NOT NULL,
	[Medico_Asignado] [int] NOT NULL,
 CONSTRAINT [PK_Ingreso] PRIMARY KEY CLUSTERED 
(
	[No_Ingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicamento]    Script Date: 27/03/2020 23:49:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicamento](
	[No_Registro] [int] NOT NULL,
	[Nombre_Comercial] [varchar](50) NOT NULL,
	[Nombre_Clinico] [varchar](50) NOT NULL,
	[Dosis_Por_Envase] [numeric](5, 3) NOT NULL,
	[Compuesto_Quimico] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Medicamento] PRIMARY KEY CLUSTERED 
(
	[No_Registro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 27/03/2020 23:49:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico](
	[No_Colegiado] [int] NOT NULL,
	[Especialidad] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Dirección] [varchar](50) NOT NULL,
	[Telefono] [numeric](8, 0) NOT NULL,
 CONSTRAINT [PK_Medico] PRIMARY KEY CLUSTERED 
(
	[No_Colegiado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 27/03/2020 23:49:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[No_Historia_Clinica] [int] NOT NULL,
	[No_Seguridad_Social] [int] NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Telefono] [numeric](8, 0) NOT NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[No_Historia_Clinica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 27/03/2020 23:49:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[Codigo_Proveedor] [int] NOT NULL,
	[Codigo_Medicamento] [int] NOT NULL,
	[Ubicacion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[Codigo_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 27/03/2020 23:49:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicio](
	[ID_Paciente] [int] NOT NULL,
	[Diagnostico] [varchar](150) NOT NULL,
	[Periodo_Hospitalidad] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Servicio] PRIMARY KEY CLUSTERED 
(
	[Diagnostico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Gasto_Hospital]  WITH NOCHECK ADD  CONSTRAINT [FK_Gasto_Hospital_Medicamento] FOREIGN KEY([Codigo_Medicamento])
REFERENCES [dbo].[Medicamento] ([No_Registro])
GO
ALTER TABLE [dbo].[Gasto_Hospital] CHECK CONSTRAINT [FK_Gasto_Hospital_Medicamento]
GO
ALTER TABLE [dbo].[Informe]  WITH NOCHECK ADD  CONSTRAINT [FK_Informe_Medicamento] FOREIGN KEY([Tipo_Medicamento])
REFERENCES [dbo].[Medicamento] ([No_Registro])
GO
ALTER TABLE [dbo].[Informe] CHECK CONSTRAINT [FK_Informe_Medicamento]
GO
ALTER TABLE [dbo].[Informe]  WITH NOCHECK ADD  CONSTRAINT [FK_Informe_Medico] FOREIGN KEY([Medico])
REFERENCES [dbo].[Medico] ([No_Colegiado])
GO
ALTER TABLE [dbo].[Informe] CHECK CONSTRAINT [FK_Informe_Medico]
GO
ALTER TABLE [dbo].[Ingreso]  WITH NOCHECK ADD  CONSTRAINT [FK_Ingreso_Medico] FOREIGN KEY([Medico_Asignado])
REFERENCES [dbo].[Medico] ([No_Colegiado])
GO
ALTER TABLE [dbo].[Ingreso] CHECK CONSTRAINT [FK_Ingreso_Medico]
GO
ALTER TABLE [dbo].[Ingreso]  WITH NOCHECK ADD  CONSTRAINT [FK_Ingreso_Paciente] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Paciente] ([No_Historia_Clinica])
GO
ALTER TABLE [dbo].[Ingreso] CHECK CONSTRAINT [FK_Ingreso_Paciente]
GO
ALTER TABLE [dbo].[Ingreso]  WITH NOCHECK ADD  CONSTRAINT [FK_Ingreso_Servicio] FOREIGN KEY([Diagnostico])
REFERENCES [dbo].[Servicio] ([Diagnostico])
GO
ALTER TABLE [dbo].[Ingreso] CHECK CONSTRAINT [FK_Ingreso_Servicio]
GO
ALTER TABLE [dbo].[Proveedor]  WITH NOCHECK ADD  CONSTRAINT [FK_Proveedor_Medicamento] FOREIGN KEY([Codigo_Medicamento])
REFERENCES [dbo].[Medicamento] ([No_Registro])
GO
ALTER TABLE [dbo].[Proveedor] CHECK CONSTRAINT [FK_Proveedor_Medicamento]
GO
ALTER TABLE [dbo].[Servicio]  WITH NOCHECK ADD  CONSTRAINT [FK_Servicio_Paciente] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Paciente] ([No_Historia_Clinica])
GO
ALTER TABLE [dbo].[Servicio] CHECK CONSTRAINT [FK_Servicio_Paciente]
GO
USE [master]
GO
ALTER DATABASE [ProyectoSanatorio] SET  READ_WRITE 
GO
