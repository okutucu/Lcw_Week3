Create Proc UrunGetir
(
	@Fiyat Money
)As
Select * from Product Where Price > @Fiyat
Return @@Rowcount

Exec UrunGetir 150

Declare @Sonuc int
Exec @Sonuc = UrunGetir 150
print CAST(@Sonuc as nvarchar(MAX)) + 'Adet ürün bu iþlemden etkilenmiþtir'


Create Proc sp_InsertProduct
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


Exec sp_InsertProduct 'Þapka', 'Kep' ,'225','2','3'


Create Proc sp_UpdateProduct
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

Exec sp_UpdateProduct 2,'Mont', 'Kýþ Montu' ,'1222','1','1'




Create Proc sp_DeleteProduct
(
	@Id int
)
AS
Begin
	Delete from  Product Where Id = @Id
End

Exec sp_DeleteProduct 1