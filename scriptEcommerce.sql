USE [master]
GO
/****** Object:  Database [Ecommerce]    Script Date: 07-Oct-21 1:05:18 PM ******/
CREATE DATABASE [Ecommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ecommerce', FILENAME = N'C:\Users\julia.furnari\Ecommerce.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Ecommerce_log', FILENAME = N'C:\Users\julia.furnari\Ecommerce_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Ecommerce] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ecommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ecommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ecommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ecommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ecommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ecommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ecommerce] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Ecommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ecommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ecommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ecommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ecommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ecommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ecommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ecommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ecommerce] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Ecommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ecommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ecommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ecommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ecommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ecommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ecommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ecommerce] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Ecommerce] SET  MULTI_USER 
GO
ALTER DATABASE [Ecommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ecommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ecommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ecommerce] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Ecommerce] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Ecommerce] SET QUERY_STORE = OFF
GO
USE [Ecommerce]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Ecommerce]
GO
/****** Object:  Table [dbo].[Carta]    Script Date: 07-Oct-21 1:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carta](
	[CodiceCarta] [char](16) NOT NULL,
	[Tipo] [nvarchar](30) NOT NULL,
	[Scadenza] [date] NOT NULL,
	[Saldo] [decimal](18, 0) NOT NULL,
	[CodiceCliente] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CodiceCarta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 07-Oct-21 1:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[CodiceCliente] [nvarchar](10) NOT NULL,
	[Nome] [nvarchar](30) NOT NULL,
	[Cognome] [nvarchar](30) NOT NULL,
	[DataDiNascita] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CodiceCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Indirizzo]    Script Date: 07-Oct-21 1:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Indirizzo](
	[IdIndirizzo] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [nvarchar](30) NOT NULL,
	[Città] [nvarchar](30) NOT NULL,
	[Via] [nvarchar](30) NOT NULL,
	[Cap] [int] NOT NULL,
	[NumeroCivico] [int] NOT NULL,
	[Provincia] [nvarchar](30) NOT NULL,
	[Nazione] [nvarchar](30) NOT NULL,
	[CodiceCliente] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK__Indirizz__330CF8CA6675FF4A] PRIMARY KEY CLUSTERED 
(
	[IdIndirizzo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ordine]    Script Date: 07-Oct-21 1:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ordine](
	[IdOrdine] [int] NOT NULL,
	[Stato] [nvarchar](20) NOT NULL,
	[DataOrdine] [date] NOT NULL,
	[Totale] [decimal](18, 0) NOT NULL,
	[CodiceCliente] [nvarchar](10) NOT NULL,
	[CodiceCarta] [char](16) NOT NULL,
	[IdIndirizzo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdOrdine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdineProdotto]    Script Date: 07-Oct-21 1:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdineProdotto](
	[IdOrdine] [int] NOT NULL,
	[CodiceProdotto] [nvarchar](10) NOT NULL,
	[Quantità] [int] NOT NULL,
	[SubTotale] [decimal](18, 0) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prodotto]    Script Date: 07-Oct-21 1:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prodotto](
	[CodiceProdotto] [nvarchar](10) NOT NULL,
	[Nome] [nvarchar](30) NOT NULL,
	[Descrizione] [nvarchar](30) NOT NULL,
	[Prezzo] [decimal](18, 0) NOT NULL,
	[QuantitàDisponibile] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CodiceProdotto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Carta]  WITH CHECK ADD FOREIGN KEY([CodiceCliente])
REFERENCES [dbo].[Cliente] ([CodiceCliente])
GO
ALTER TABLE [dbo].[Indirizzo]  WITH CHECK ADD  CONSTRAINT [FK__Indirizzo__Codic__2B3F6F97] FOREIGN KEY([CodiceCliente])
REFERENCES [dbo].[Cliente] ([CodiceCliente])
GO
ALTER TABLE [dbo].[Indirizzo] CHECK CONSTRAINT [FK__Indirizzo__Codic__2B3F6F97]
GO
ALTER TABLE [dbo].[Ordine]  WITH CHECK ADD FOREIGN KEY([CodiceCarta])
REFERENCES [dbo].[Carta] ([CodiceCarta])
GO
ALTER TABLE [dbo].[Ordine]  WITH CHECK ADD FOREIGN KEY([CodiceCliente])
REFERENCES [dbo].[Cliente] ([CodiceCliente])
GO
ALTER TABLE [dbo].[Ordine]  WITH CHECK ADD  CONSTRAINT [FK__Ordine__IdIndiri__31EC6D26] FOREIGN KEY([IdIndirizzo])
REFERENCES [dbo].[Indirizzo] ([IdIndirizzo])
GO
ALTER TABLE [dbo].[Ordine] CHECK CONSTRAINT [FK__Ordine__IdIndiri__31EC6D26]
GO
ALTER TABLE [dbo].[OrdineProdotto]  WITH CHECK ADD FOREIGN KEY([CodiceProdotto])
REFERENCES [dbo].[Prodotto] ([CodiceProdotto])
GO
ALTER TABLE [dbo].[OrdineProdotto]  WITH CHECK ADD FOREIGN KEY([IdOrdine])
REFERENCES [dbo].[Ordine] ([IdOrdine])
GO
ALTER TABLE [dbo].[Carta]  WITH CHECK ADD  CONSTRAINT [CHK_TipoCarta] CHECK  (([Tipo]='Debito' OR [Tipo]='Credito'))
GO
ALTER TABLE [dbo].[Carta] CHECK CONSTRAINT [CHK_TipoCarta]
GO
ALTER TABLE [dbo].[Indirizzo]  WITH CHECK ADD  CONSTRAINT [CHK_TipoIndirizzo] CHECK  (([Tipo]='Residenza' OR [Tipo]='Domicilio'))
GO
ALTER TABLE [dbo].[Indirizzo] CHECK CONSTRAINT [CHK_TipoIndirizzo]
GO
ALTER TABLE [dbo].[Ordine]  WITH CHECK ADD  CONSTRAINT [CHK_StatoOrdine] CHECK  (([Stato]='Provvisorio' OR [Stato]='Confermato'))
GO
ALTER TABLE [dbo].[Ordine] CHECK CONSTRAINT [CHK_StatoOrdine]
GO
/****** Object:  StoredProcedure [dbo].[InsertClienteCartaIndirizzo]    Script Date: 07-Oct-21 1:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertClienteCartaIndirizzo]

@codiceCliente nvarchar(10),
@nome nvarchar(30),
@cognome nvarchar(30),
@dataDiNascita date,
@codiceCarta char(16),
@tipoCarta nvarchar(30),
@scadenza nvarchar(30),
@saldo decimal,
@tipoIndirizzo nvarchar(30),
@città nvarchar(30),
@via nvarchar(30),
@cap int,
@numeroCivico int,
@provincia nvarchar(30),
@nazione nvarchar(30),
@codiceIndirizzo int

as 
begin
--Transazione
begin tran
begin try
insert into Cliente values(@codiceCliente, @nome, @cognome, @dataDiNascita); 
if (@scadenza >= GetDate())
insert into Carta values(@codiceCarta, @tipoCarta, @scadenza, @saldo, @codiceCliente);
insert into Indirizzo values(@codiceIndirizzo,@tipoIndirizzo, @città, @via, @numeroCivico, @provincia, @nazione, @codiceCliente); 
if @@ERROR>0 rollback;
commit;
end try
begin catch
select @@ERROR rollback
end catch
end
GO
USE [master]
GO
ALTER DATABASE [Ecommerce] SET  READ_WRITE 
GO
