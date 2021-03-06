USE [master]
GO
/****** Object:  Database [LcwWeek3DB]    Script Date: 5.05.2022 17:42:09 ******/
CREATE DATABASE [LcwWeek3DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LcwWeek3DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.OGUZ\MSSQL\DATA\LcwWeek3DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LcwWeek3DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.OGUZ\MSSQL\DATA\LcwWeek3DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LcwWeek3DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LcwWeek3DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LcwWeek3DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LcwWeek3DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LcwWeek3DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LcwWeek3DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LcwWeek3DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LcwWeek3DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LcwWeek3DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LcwWeek3DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LcwWeek3DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LcwWeek3DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LcwWeek3DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LcwWeek3DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LcwWeek3DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LcwWeek3DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LcwWeek3DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LcwWeek3DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LcwWeek3DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LcwWeek3DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LcwWeek3DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LcwWeek3DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LcwWeek3DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LcwWeek3DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LcwWeek3DB] SET RECOVERY FULL 
GO
ALTER DATABASE [LcwWeek3DB] SET  MULTI_USER 
GO
ALTER DATABASE [LcwWeek3DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LcwWeek3DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LcwWeek3DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LcwWeek3DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LcwWeek3DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LcwWeek3DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LcwWeek3DB', N'ON'
GO
ALTER DATABASE [LcwWeek3DB] SET QUERY_STORE = OFF
GO
USE [LcwWeek3DB]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5.05.2022 17:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Price] [decimal](18, 0) NULL,
	[DiscountID] [int] NULL,
	[InvertoryID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 5.05.2022 17:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[Discount_Percent] [decimal](18, 0) NULL,
	[Active] [bit] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[Deleted] [datetime] NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[GetDiscount]    Script Date: 5.05.2022 17:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[GetDiscount]
AS
Select Product.Name,Product.Price, Discount.Description From Product inner join Discount
on Product.DiscountID = Discount.Id
GO
/****** Object:  Table [dbo].[Admin_Type]    Script Date: 5.05.2022 17:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin_Type](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Admin_Type] [nvarchar](50) NULL,
	[Permissions] [nvarchar](50) NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
 CONSTRAINT [PK_Admin_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdminUser]    Script Date: 5.05.2022 17:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[First_Name] [nvarchar](50) NULL,
	[Last_Name] [nvarchar](50) NULL,
	[Last_Login] [datetime] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[TypeID] [int] NULL,
 CONSTRAINT [PK_AdminUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Unq_Tel] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart_Item]    Script Date: 5.05.2022 17:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart_Item](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NULL,
	[SessionID] [int] NULL,
	[ProductID] [int] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
 CONSTRAINT [PK_Cart_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5.05.2022 17:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Desciption] [nvarchar](50) NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[Deleted] [datetime] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 5.05.2022 17:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Total] [decimal](18, 0) NULL,
	[UserID] [int] NULL,
	[PaymentID] [int] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
 CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Items]    Script Date: 5.05.2022 17:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Items](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
 CONSTRAINT [PK_Order_Items] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment_Details]    Script Date: 5.05.2022 17:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_Details](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[Amount] [int] NULL,
	[Provider] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
 CONSTRAINT [PK_Payment_Details] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Category]    Script Date: 5.05.2022 17:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Category](
	[ProductID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_Product_Category] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Invertory]    Script Date: 5.05.2022 17:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Invertory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Created] [timestamp] NULL,
	[Modified] [datetime] NULL,
	[Deleted] [datetime] NULL,
 CONSTRAINT [PK_Product_Invertory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shopping_Session]    Script Date: 5.05.2022 17:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shopping_Session](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Total] [decimal](18, 0) NULL,
	[UserID] [int] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
 CONSTRAINT [PK_Shopping_Session] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5.05.2022 17:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[First_Name] [nvarchar](50) NULL,
	[Last_Name] [nvarchar](50) NULL,
	[Telephone] [int] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_User] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Adress]    Script Date: 5.05.2022 17:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Adress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Adress_1] [nvarchar](50) NULL,
	[Adress_2] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[Postal_Code] [nvarchar](50) NULL,
	[Telephone] [nvarchar](50) NULL,
 CONSTRAINT [PK_User_Adress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Payment]    Script Date: 5.05.2022 17:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Payment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Payment_Type] [nvarchar](50) NULL,
	[Provider] [nvarchar](50) NULL,
	[Account_No] [int] NULL,
	[expriy] [datetime] NULL,
 CONSTRAINT [PK_User_Payment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX2]    Script Date: 5.05.2022 17:42:10 ******/
CREATE NONCLUSTERED INDEX [IX2] ON [dbo].[Category]
(
	[Name] ASC,
	[Desciption] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX1]    Script Date: 5.05.2022 17:42:10 ******/
CREATE NONCLUSTERED INDEX [IX1] ON [dbo].[Product]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AdminUser]  WITH CHECK ADD  CONSTRAINT [FK_AdminUser_Admin_Type] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Admin_Type] ([Id])
GO
ALTER TABLE [dbo].[AdminUser] CHECK CONSTRAINT [FK_AdminUser_Admin_Type]
GO
ALTER TABLE [dbo].[Cart_Item]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Item_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Cart_Item] CHECK CONSTRAINT [FK_Cart_Item_Product]
GO
ALTER TABLE [dbo].[Cart_Item]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Item_Shopping_Session] FOREIGN KEY([SessionID])
REFERENCES [dbo].[Shopping_Session] ([Id])
GO
ALTER TABLE [dbo].[Cart_Item] CHECK CONSTRAINT [FK_Cart_Item_Shopping_Session]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_Order_Details_Payment_Details] FOREIGN KEY([PaymentID])
REFERENCES [dbo].[Payment_Details] ([Id])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_Order_Details_Payment_Details]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_Order_Details_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_Order_Details_User]
GO
ALTER TABLE [dbo].[Order_Items]  WITH CHECK ADD  CONSTRAINT [FK_Order_Items_Order_Details] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order_Details] ([Id])
GO
ALTER TABLE [dbo].[Order_Items] CHECK CONSTRAINT [FK_Order_Items_Order_Details]
GO
ALTER TABLE [dbo].[Order_Items]  WITH CHECK ADD  CONSTRAINT [FK_Order_Items_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Order_Items] CHECK CONSTRAINT [FK_Order_Items_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Discount] FOREIGN KEY([DiscountID])
REFERENCES [dbo].[Discount] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Discount]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Product_Invertory] FOREIGN KEY([InvertoryID])
REFERENCES [dbo].[Product_Invertory] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Product_Invertory]
GO
ALTER TABLE [dbo].[Product_Category]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product_Category] CHECK CONSTRAINT [FK_Product_Category_Category]
GO
ALTER TABLE [dbo].[Product_Category]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Product_Category] CHECK CONSTRAINT [FK_Product_Category_Product]
GO
ALTER TABLE [dbo].[Shopping_Session]  WITH CHECK ADD  CONSTRAINT [FK_Shopping_Session_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Shopping_Session] CHECK CONSTRAINT [FK_Shopping_Session_User]
GO
ALTER TABLE [dbo].[User_Adress]  WITH CHECK ADD  CONSTRAINT [FK_User_Adress_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[User_Adress] CHECK CONSTRAINT [FK_User_Adress_User]
GO
ALTER TABLE [dbo].[User_Payment]  WITH CHECK ADD  CONSTRAINT [FK_User_Payment_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[User_Payment] CHECK CONSTRAINT [FK_User_Payment_User]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteProduct]    Script Date: 5.05.2022 17:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sp_DeleteProduct]
(
	@Id int
)
AS
Begin
	Delete from  Product Where Id = @Id
End
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertProduct]    Script Date: 5.05.2022 17:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sp_InsertProduct]
(
	@Name nvarchar(50),
	@Description nvarchar(50),
	@Price decimal(18,0),
	@DiscountID int,
	@InvertoryID int
)As
Begin
	Insert Into Product(Name,Description,Price,DiscountID,InvertoryID)
	Values (@Name,@Description,@Price,@DiscountID,@InvertoryID)
End
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateProduct]    Script Date: 5.05.2022 17:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sp_UpdateProduct]
(
	@Id int,
	@Name nvarchar(50),
	@Description nvarchar(50),
	@Price decimal(18,0),
	@DiscountID int,
	@InvertoryID int
)AS
Begin
Update Product
Set Name = @Name, Description = @Description, Price = @Price , DiscountID = @DiscountID , InvertoryID = @InvertoryID
Where Id = @Id
End
GO
/****** Object:  StoredProcedure [dbo].[UrunGetir]    Script Date: 5.05.2022 17:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[UrunGetir]
(
	@Fiyat Money
)As
Select * from Product Where Price > @Fiyat
Return @@Rowcount
GO
/****** Object:  Trigger [dbo].[product_del]    Script Date: 5.05.2022 17:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create trigger [dbo].[product_del]
on [dbo].[Discount]
after delete
as
Update Product Set Price *=2
Select * from Product
GO
ALTER TABLE [dbo].[Discount] ENABLE TRIGGER [product_del]
GO
/****** Object:  Trigger [dbo].[trigger_add]    Script Date: 5.05.2022 17:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create trigger [dbo].[trigger_add]
on [dbo].[Product]
after insert
as
Select * from Product
GO
ALTER TABLE [dbo].[Product] ENABLE TRIGGER [trigger_add]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Aynı UserName olamaz' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AdminUser', @level2type=N'CONSTRAINT',@level2name=N'Unq_Tel'
GO
USE [master]
GO
ALTER DATABASE [LcwWeek3DB] SET  READ_WRITE 
GO
