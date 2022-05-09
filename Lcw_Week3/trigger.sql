Create trigger trigger_add
on Product
after insert
as
Select * from Product

Insert Product(Name,Description,DiscountID,InvertoryID,Price)
Values ('Atk�','K�� atk�s�',1,2,400)

-- Discount tablosundan bir veri silindi�inde t�m �r�nlerin fiyat�n� 2kat�na ��kartan trigger.
Create trigger product_del
on Discount
after delete
as
Update Product Set Price *=2
Select * from Product

Delete from Discount where Id = 5

-- Herhangi bir i�lem yapt���m�zda loglama y�ntemleri i�in trigger kullan�labilir. 
-- Trigger ile bir tabloda i� yap�ld� takdirde di�er tablolar�da etkileyebiliriz.
-- Log tablosu a��p product vb. tablolarda ekleme g�ncelleme gibi yap�lan i�lemlerin kim taraf�ndan 
-- ve hangi tarihte yap�ld���n� loglayabiliriz.

