USE [master]
GO
/****** Object:  Database [HotelManager]    Script Date: 3/6/2020 5:01:22 PM ******/
CREATE DATABASE [HotelManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HotelManager.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HotelManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HotelManager_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HotelManager] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelManager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HotelManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelManager] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HotelManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HotelManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelManager] SET RECOVERY FULL 
GO
ALTER DATABASE [HotelManager] SET  MULTI_USER 
GO
ALTER DATABASE [HotelManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelManager] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HotelManager] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HotelManager', N'ON'
GO
USE [HotelManager]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 3/6/2020 5:01:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Booking](
	[IdBooking] [varchar](50) NOT NULL,
	[dateBookingFrom] [datetime] NOT NULL,
	[dateBookingTo] [datetime] NOT NULL,
	[statusBooking] [varchar](50) NOT NULL,
	[desBooking] [varchar](50) NULL,
	[totalBooking] [varchar](50) NOT NULL,
	[numberOfNice] [int] NOT NULL,
	[username] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdBooking] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetailBooking]    Script Date: 3/6/2020 5:01:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetailBooking](
	[codeRoom] [varchar](10) NOT NULL,
	[numberOfRoom] [int] NOT NULL,
	[priceDetail] [varchar](50) NOT NULL,
	[hotelID] [varchar](50) NOT NULL,
	[IdBooking] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[hotelID] ASC,
	[IdBooking] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 3/6/2020 5:01:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Discount](
	[codeDiscount] [varchar](50) NOT NULL,
	[percentDiscount] [int] NOT NULL,
	[dateDisFrom] [datetime] NOT NULL,
	[dateDisTo] [datetime] NOT NULL,
	[desDiscount] [varchar](50) NULL,
	[statusDiscount] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[codeDiscount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 3/6/2020 5:01:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hotel](
	[hotelID] [varchar](50) NOT NULL,
	[nameHotel] [varchar](50) NOT NULL,
	[addressHotel] [varchar](50) NOT NULL,
	[rateHotel] [int] NOT NULL,
	[statusHotel] [varchar](50) NOT NULL,
	[desHotel] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[hotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KindOfRoom]    Script Date: 3/6/2020 5:01:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KindOfRoom](
	[IdKindRoom] [varchar](50) NOT NULL,
	[nameKindRoom] [varchar](50) NOT NULL,
	[numberOfPeopleRoom] [int] NOT NULL,
	[desRoom] [varchar](50) NULL,
	[priceOfRoom] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdKindRoom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoomInHotel]    Script Date: 3/6/2020 5:01:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoomInHotel](
	[codeRoom] [varchar](10) NOT NULL,
	[dateRoomFrom] [datetime] NULL,
	[dateRoomTo] [date] NULL,
	[statusRoom] [varchar](50) NOT NULL,
	[hotelID] [varchar](50) NOT NULL,
	[IdKindRoom] [varchar](50) NOT NULL,
 CONSTRAINT [PK__RoomInHo__AC816A788E41D519] PRIMARY KEY CLUSTERED 
(
	[codeRoom] ASC,
	[hotelID] ASC,
	[IdKindRoom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserHaveDiscount]    Script Date: 3/6/2020 5:01:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserHaveDiscount](
	[statusUserDis] [varchar](50) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[codeDiscount] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[codeDiscount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/6/2020 5:01:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[roleUser] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[statusUser] [varchar](50) NOT NULL,
	[dateCreate] [datetime] NOT NULL,
	[fullName] [varchar](50) NOT NULL,
	[addressUser] [varchar](50) NOT NULL,
	[numberPhone] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Discount] ([codeDiscount], [percentDiscount], [dateDisFrom], [dateDisTo], [desDiscount], [statusDiscount]) VALUES (N'bZKlE8HD', 44, CAST(N'2020-03-01 10:32:31.000' AS DateTime), CAST(N'2020-03-13 10:44:09.000' AS DateTime), N'', N'active')
INSERT [dbo].[Discount] ([codeDiscount], [percentDiscount], [dateDisFrom], [dateDisTo], [desDiscount], [statusDiscount]) VALUES (N'DIS', 50, CAST(N'2020-03-05 00:00:00.000' AS DateTime), CAST(N'2020-03-30 00:00:00.000' AS DateTime), N'Khuyen mai 50%', N'active')
INSERT [dbo].[Discount] ([codeDiscount], [percentDiscount], [dateDisFrom], [dateDisTo], [desDiscount], [statusDiscount]) VALUES (N'eaQPiCy2bEF', 72, CAST(N'2020-03-01 02:29:34.000' AS DateTime), CAST(N'2020-03-14 20:55:38.000' AS DateTime), N'', N'active')
INSERT [dbo].[Discount] ([codeDiscount], [percentDiscount], [dateDisFrom], [dateDisTo], [desDiscount], [statusDiscount]) VALUES (N'eQMl1x7', 1, CAST(N'2020-03-02 14:45:52.000' AS DateTime), CAST(N'2020-03-12 04:40:04.000' AS DateTime), N'', N'active')
INSERT [dbo].[Discount] ([codeDiscount], [percentDiscount], [dateDisFrom], [dateDisTo], [desDiscount], [statusDiscount]) VALUES (N'GqicoFSy', 83, CAST(N'2020-03-05 04:25:35.000' AS DateTime), CAST(N'2020-03-11 01:57:37.000' AS DateTime), N'', N'active')
INSERT [dbo].[Discount] ([codeDiscount], [percentDiscount], [dateDisFrom], [dateDisTo], [desDiscount], [statusDiscount]) VALUES (N'kALtN0UpdB', 76, CAST(N'2020-03-05 06:52:24.000' AS DateTime), CAST(N'2020-03-12 19:14:44.000' AS DateTime), N'', N'active')
INSERT [dbo].[Discount] ([codeDiscount], [percentDiscount], [dateDisFrom], [dateDisTo], [desDiscount], [statusDiscount]) VALUES (N'lS26iK45Bb', 2, CAST(N'2020-03-05 04:26:43.000' AS DateTime), CAST(N'2020-03-07 09:00:35.000' AS DateTime), N'', N'active')
INSERT [dbo].[Discount] ([codeDiscount], [percentDiscount], [dateDisFrom], [dateDisTo], [desDiscount], [statusDiscount]) VALUES (N'qj9B0Ru', 23, CAST(N'2020-03-04 13:49:47.000' AS DateTime), CAST(N'2020-03-11 20:38:13.000' AS DateTime), N'', N'active')
INSERT [dbo].[Discount] ([codeDiscount], [percentDiscount], [dateDisFrom], [dateDisTo], [desDiscount], [statusDiscount]) VALUES (N'tQriD4', 34, CAST(N'2020-03-03 09:30:03.000' AS DateTime), CAST(N'2020-03-11 04:24:44.000' AS DateTime), N'', N'active')
INSERT [dbo].[Discount] ([codeDiscount], [percentDiscount], [dateDisFrom], [dateDisTo], [desDiscount], [statusDiscount]) VALUES (N'uoB6Kl', 29, CAST(N'2020-03-04 15:40:53.000' AS DateTime), CAST(N'2020-03-09 12:32:18.000' AS DateTime), N'', N'active')
INSERT [dbo].[Discount] ([codeDiscount], [percentDiscount], [dateDisFrom], [dateDisTo], [desDiscount], [statusDiscount]) VALUES (N'ZwmzyljWn0', 69, CAST(N'2020-03-05 13:37:55.000' AS DateTime), CAST(N'2020-03-10 18:27:46.000' AS DateTime), N'', N'active')
INSERT [dbo].[Hotel] ([hotelID], [nameHotel], [addressHotel], [rateHotel], [statusHotel], [desHotel]) VALUES (N'09R0XJZ', N'Ankunding, Mohr and Daniel', N'3473 Ridgeview Parkway', 5, N'active', N'khach san la khach san ')
INSERT [dbo].[Hotel] ([hotelID], [nameHotel], [addressHotel], [rateHotel], [statusHotel], [desHotel]) VALUES (N'0KBB0ZZ', N'Gleichner, Nienow and Quigley', N'1097 Dottie Drive', 10, N'active', N'khach san la khach san ')
INSERT [dbo].[Hotel] ([hotelID], [nameHotel], [addressHotel], [rateHotel], [statusHotel], [desHotel]) VALUES (N'0RPG3JZ', N'Cartwright-Heaney', N'8 Stone Corner Parkway', 8, N'active', N'khach san la khach san ')
INSERT [dbo].[Hotel] ([hotelID], [nameHotel], [addressHotel], [rateHotel], [statusHotel], [desHotel]) VALUES (N'0SPH3JZ', N'Sporer Group', N'84 Fieldstone Crossing', 6, N'active', N'khach san la khach san ')
INSERT [dbo].[Hotel] ([hotelID], [nameHotel], [addressHotel], [rateHotel], [statusHotel], [desHotel]) VALUES (N'0SPK3KZ', N'Gutkowski Group', N'17 Stephen Point', 2, N'active', N'khach san la khach san ')
INSERT [dbo].[KindOfRoom] ([IdKindRoom], [nameKindRoom], [numberOfPeopleRoom], [desRoom], [priceOfRoom]) VALUES (N'DLXRoom', N'Deluxe Room', 2, N'2 giuong doi', N'500000')
INSERT [dbo].[KindOfRoom] ([IdKindRoom], [nameKindRoom], [numberOfPeopleRoom], [desRoom], [priceOfRoom]) VALUES (N'STDRoom', N'Standard Room', 2, NULL, N'200000')
INSERT [dbo].[KindOfRoom] ([IdKindRoom], [nameKindRoom], [numberOfPeopleRoom], [desRoom], [priceOfRoom]) VALUES (N'SUPRoom', N'Superior Room', 3, N'3 nguoi, co an sang', N'300000')
INSERT [dbo].[KindOfRoom] ([IdKindRoom], [nameKindRoom], [numberOfPeopleRoom], [desRoom], [priceOfRoom]) VALUES (N'SUTRoom', N'Executive Suite Room', 2, N'view dep', N'700000')
INSERT [dbo].[RoomInHotel] ([codeRoom], [dateRoomFrom], [dateRoomTo], [statusRoom], [hotelID], [IdKindRoom]) VALUES (N'011', NULL, NULL, N'ready', N'09R0XJZ', N'STDRoom')
INSERT [dbo].[RoomInHotel] ([codeRoom], [dateRoomFrom], [dateRoomTo], [statusRoom], [hotelID], [IdKindRoom]) VALUES (N'011', NULL, NULL, N'ready', N'0KBB0ZZ', N'STDRoom')
INSERT [dbo].[RoomInHotel] ([codeRoom], [dateRoomFrom], [dateRoomTo], [statusRoom], [hotelID], [IdKindRoom]) VALUES (N'011', NULL, NULL, N'ready', N'0RPG3JZ', N'DLXRoom')
INSERT [dbo].[RoomInHotel] ([codeRoom], [dateRoomFrom], [dateRoomTo], [statusRoom], [hotelID], [IdKindRoom]) VALUES (N'011', NULL, NULL, N'ready', N'0SPH3JZ', N'DLXRoom')
INSERT [dbo].[RoomInHotel] ([codeRoom], [dateRoomFrom], [dateRoomTo], [statusRoom], [hotelID], [IdKindRoom]) VALUES (N'011', CAST(N'2020-03-01 00:00:00.000' AS DateTime), CAST(N'2020-03-04' AS Date), N'ready', N'0SPK3KZ', N'DLXRoom')
INSERT [dbo].[RoomInHotel] ([codeRoom], [dateRoomFrom], [dateRoomTo], [statusRoom], [hotelID], [IdKindRoom]) VALUES (N'012', NULL, NULL, N'ready', N'09R0XJZ', N'SUTRoom')
INSERT [dbo].[RoomInHotel] ([codeRoom], [dateRoomFrom], [dateRoomTo], [statusRoom], [hotelID], [IdKindRoom]) VALUES (N'012', NULL, NULL, N'ready', N'0KBB0ZZ', N'DLXRoom')
INSERT [dbo].[RoomInHotel] ([codeRoom], [dateRoomFrom], [dateRoomTo], [statusRoom], [hotelID], [IdKindRoom]) VALUES (N'012', NULL, NULL, N'ready', N'0RPG3JZ', N'SUPRoom')
INSERT [dbo].[RoomInHotel] ([codeRoom], [dateRoomFrom], [dateRoomTo], [statusRoom], [hotelID], [IdKindRoom]) VALUES (N'012', NULL, NULL, N'ready', N'0SPH3JZ', N'STDRoom')
INSERT [dbo].[RoomInHotel] ([codeRoom], [dateRoomFrom], [dateRoomTo], [statusRoom], [hotelID], [IdKindRoom]) VALUES (N'012', CAST(N'2020-04-01 00:00:00.000' AS DateTime), CAST(N'2020-04-02' AS Date), N'ready', N'0SPK3KZ', N'SUTRoom')
INSERT [dbo].[RoomInHotel] ([codeRoom], [dateRoomFrom], [dateRoomTo], [statusRoom], [hotelID], [IdKindRoom]) VALUES (N'013', NULL, NULL, N'ready', N'09R0XJZ', N'STDRoom')
INSERT [dbo].[RoomInHotel] ([codeRoom], [dateRoomFrom], [dateRoomTo], [statusRoom], [hotelID], [IdKindRoom]) VALUES (N'013', NULL, NULL, N'ready', N'0KBB0ZZ', N'SUPRoom')
INSERT [dbo].[RoomInHotel] ([codeRoom], [dateRoomFrom], [dateRoomTo], [statusRoom], [hotelID], [IdKindRoom]) VALUES (N'013', NULL, NULL, N'ready', N'0RPG3JZ', N'SUTRoom')
INSERT [dbo].[RoomInHotel] ([codeRoom], [dateRoomFrom], [dateRoomTo], [statusRoom], [hotelID], [IdKindRoom]) VALUES (N'013', NULL, NULL, N'ready', N'0SPH3JZ', N'SUTRoom')
INSERT [dbo].[RoomInHotel] ([codeRoom], [dateRoomFrom], [dateRoomTo], [statusRoom], [hotelID], [IdKindRoom]) VALUES (N'013', CAST(N'2020-04-02 00:00:00.000' AS DateTime), CAST(N'2020-04-03' AS Date), N'ready', N'0SPK3KZ', N'STDRoom')
INSERT [dbo].[RoomInHotel] ([codeRoom], [dateRoomFrom], [dateRoomTo], [statusRoom], [hotelID], [IdKindRoom]) VALUES (N'014', NULL, NULL, N'ready', N'09R0XJZ', N'STDRoom')
INSERT [dbo].[RoomInHotel] ([codeRoom], [dateRoomFrom], [dateRoomTo], [statusRoom], [hotelID], [IdKindRoom]) VALUES (N'014', NULL, NULL, N'ready', N'0KBB0ZZ', N'STDRoom')
INSERT [dbo].[RoomInHotel] ([codeRoom], [dateRoomFrom], [dateRoomTo], [statusRoom], [hotelID], [IdKindRoom]) VALUES (N'014', NULL, NULL, N'ready', N'0RPG3JZ', N'STDRoom')
INSERT [dbo].[RoomInHotel] ([codeRoom], [dateRoomFrom], [dateRoomTo], [statusRoom], [hotelID], [IdKindRoom]) VALUES (N'014', NULL, NULL, N'ready', N'0SPH3JZ', N'STDRoom')
INSERT [dbo].[RoomInHotel] ([codeRoom], [dateRoomFrom], [dateRoomTo], [statusRoom], [hotelID], [IdKindRoom]) VALUES (N'014', NULL, NULL, N'ready', N'0SPK3KZ', N'SUPRoom')
INSERT [dbo].[RoomInHotel] ([codeRoom], [dateRoomFrom], [dateRoomTo], [statusRoom], [hotelID], [IdKindRoom]) VALUES (N'015', NULL, NULL, N'ready', N'09R0XJZ', N'DLXRoom')
INSERT [dbo].[RoomInHotel] ([codeRoom], [dateRoomFrom], [dateRoomTo], [statusRoom], [hotelID], [IdKindRoom]) VALUES (N'015', NULL, NULL, N'ready', N'0KBB0ZZ', N'STDRoom')
INSERT [dbo].[RoomInHotel] ([codeRoom], [dateRoomFrom], [dateRoomTo], [statusRoom], [hotelID], [IdKindRoom]) VALUES (N'015', NULL, NULL, N'ready', N'0RPG3JZ', N'STDRoom')
INSERT [dbo].[RoomInHotel] ([codeRoom], [dateRoomFrom], [dateRoomTo], [statusRoom], [hotelID], [IdKindRoom]) VALUES (N'015', NULL, NULL, N'ready', N'0SPH3JZ', N'DLXRoom')
INSERT [dbo].[RoomInHotel] ([codeRoom], [dateRoomFrom], [dateRoomTo], [statusRoom], [hotelID], [IdKindRoom]) VALUES (N'015', NULL, NULL, N'ready', N'0SPK3KZ', N'SUPRoom')
INSERT [dbo].[UserHaveDiscount] ([statusUserDis], [username], [codeDiscount]) VALUES (N'ready', N'hoang', N'bZKlE8HD')
INSERT [dbo].[UserHaveDiscount] ([statusUserDis], [username], [codeDiscount]) VALUES (N'ready', N'hoang', N'DIS')
INSERT [dbo].[Users] ([username], [password], [roleUser], [email], [statusUser], [dateCreate], [fullName], [addressUser], [numberPhone]) VALUES (N'bpanas9', N'op9b33o', N'user', N'bpanas9@netlog.com', N'active', CAST(N'2019-08-03 00:00:00.000' AS DateTime), N'Bryan Panas', N'7 Mariners Cove Crossing', N'8076002094')
INSERT [dbo].[Users] ([username], [password], [roleUser], [email], [statusUser], [dateCreate], [fullName], [addressUser], [numberPhone]) VALUES (N'cchetham8', N'BYbeg1pag', N'user', N'cchetham8@hexun.com', N'active', CAST(N'2019-06-08 00:00:00.000' AS DateTime), N'Constantia Chetham', N'8819 Arapahoe Court', N'8866104387')
INSERT [dbo].[Users] ([username], [password], [roleUser], [email], [statusUser], [dateCreate], [fullName], [addressUser], [numberPhone]) VALUES (N'eshrawley6', N'OqUIVIMuZ', N'user', N'eshrawley6@blogtalkradio.com', N'active', CAST(N'2019-08-11 00:00:00.000' AS DateTime), N'Elizabet Shrawley', N'35 Macpherson Center', N'3778215122')
INSERT [dbo].[Users] ([username], [password], [roleUser], [email], [statusUser], [dateCreate], [fullName], [addressUser], [numberPhone]) VALUES (N'glaydon2', N'gxOcwwy', N'user', N'glaydon2@vkontakte.ru', N'active', CAST(N'2019-03-20 00:00:00.000' AS DateTime), N'Grantley Laydon', N'926 Chinook Center', N'7686214846')
INSERT [dbo].[Users] ([username], [password], [roleUser], [email], [statusUser], [dateCreate], [fullName], [addressUser], [numberPhone]) VALUES (N'hcastellino1', N'6TWLJ1GLb', N'user', N'hcastellino1@multiply.com', N'active', CAST(N'2020-01-05 00:00:00.000' AS DateTime), N'Haily Castellino', N'00136 Katie Avenue', N'6744502155')
INSERT [dbo].[Users] ([username], [password], [roleUser], [email], [statusUser], [dateCreate], [fullName], [addressUser], [numberPhone]) VALUES (N'hoang', N'123', N'user', N'hoang@gmail.com', N'active', CAST(N'2020-03-12 00:00:00.000' AS DateTime), N'hoang', N'no', N'22222222')
INSERT [dbo].[Users] ([username], [password], [roleUser], [email], [statusUser], [dateCreate], [fullName], [addressUser], [numberPhone]) VALUES (N'jsibbs5', N'mRIRwMlmMr', N'user', N'jsibbs5@freewebs.com', N'active', CAST(N'2019-07-13 00:00:00.000' AS DateTime), N'Janene Sibbs', N'03 Moland Crossing', N'9819247656')
INSERT [dbo].[Users] ([username], [password], [roleUser], [email], [statusUser], [dateCreate], [fullName], [addressUser], [numberPhone]) VALUES (N'linhnd', N'123', N'admin', N'linhnguyen1@gmail.com', N'active', CAST(N'2020-03-01 00:00:00.000' AS DateTime), N'Linh Duc', N'no', N'022222222')
INSERT [dbo].[Users] ([username], [password], [roleUser], [email], [statusUser], [dateCreate], [fullName], [addressUser], [numberPhone]) VALUES (N'ojohanssen7', N'Ui0zaoRb', N'user', N'ojohanssen7@reference.com', N'active', CAST(N'2019-11-15 00:00:00.000' AS DateTime), N'Onfroi Johanssen', N'4 Thompson Trail', N'5679360631')
INSERT [dbo].[Users] ([username], [password], [roleUser], [email], [statusUser], [dateCreate], [fullName], [addressUser], [numberPhone]) VALUES (N'ralbers4', N'H9nRjgNJe', N'user', N'ralbers4@wufoo.com', N'active', CAST(N'2020-01-07 00:00:00.000' AS DateTime), N'Reeba Albers', N'8 Sauthoff Plaza', N'1367766183')
INSERT [dbo].[Users] ([username], [password], [roleUser], [email], [statusUser], [dateCreate], [fullName], [addressUser], [numberPhone]) VALUES (N'smunks0', N'lKtTCIGD', N'user', N'smunks0@indiatimes.com', N'active', CAST(N'2019-11-19 00:00:00.000' AS DateTime), N'Shelley Munks', N'1818 Sommers Crossing', N'1359614590')
INSERT [dbo].[Users] ([username], [password], [roleUser], [email], [statusUser], [dateCreate], [fullName], [addressUser], [numberPhone]) VALUES (N'tcabotto3', N'rnLUuhvfrO', N'user', N'tcabotto3@cloudflare.com', N'active', CAST(N'2019-11-22 00:00:00.000' AS DateTime), N'Titos Cabotto', N'4 Superior Plaza', N'6903896895')
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Users] ([username])
GO
ALTER TABLE [dbo].[DetailBooking]  WITH CHECK ADD FOREIGN KEY([hotelID])
REFERENCES [dbo].[Hotel] ([hotelID])
GO
ALTER TABLE [dbo].[DetailBooking]  WITH CHECK ADD FOREIGN KEY([IdBooking])
REFERENCES [dbo].[Booking] ([IdBooking])
GO
ALTER TABLE [dbo].[RoomInHotel]  WITH CHECK ADD  CONSTRAINT [FK__RoomInHot__hotel__1B0907CE] FOREIGN KEY([hotelID])
REFERENCES [dbo].[Hotel] ([hotelID])
GO
ALTER TABLE [dbo].[RoomInHotel] CHECK CONSTRAINT [FK__RoomInHot__hotel__1B0907CE]
GO
ALTER TABLE [dbo].[RoomInHotel]  WITH CHECK ADD  CONSTRAINT [FK__RoomInHot__IdKin__1BFD2C07] FOREIGN KEY([IdKindRoom])
REFERENCES [dbo].[KindOfRoom] ([IdKindRoom])
GO
ALTER TABLE [dbo].[RoomInHotel] CHECK CONSTRAINT [FK__RoomInHot__IdKin__1BFD2C07]
GO
ALTER TABLE [dbo].[UserHaveDiscount]  WITH CHECK ADD FOREIGN KEY([codeDiscount])
REFERENCES [dbo].[Discount] ([codeDiscount])
GO
ALTER TABLE [dbo].[UserHaveDiscount]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Users] ([username])
GO
USE [master]
GO
ALTER DATABASE [HotelManager] SET  READ_WRITE 
GO
