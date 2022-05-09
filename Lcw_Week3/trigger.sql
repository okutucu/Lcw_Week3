Create trigger trigger_add
on Product
after insert
as
Select * from Product

Insert Product(Name,Description,DiscountID,InvertoryID,Price)
Values ('Atký','Kýþ atkýsý',1,2,400)

-- Discount tablosundan bir veri silindiðinde tüm ürünlerin fiyatýný 2katýna çýkartan trigger.
Create trigger product_del
on Discount
after delete
as
Update Product Set Price *=2
Select * from Product

Delete from Discount where Id = 5

-- Herhangi bir iþlem yaptýðýmýzda loglama yöntemleri için trigger kullanýlabilir. 
-- Trigger ile bir tabloda iþ yapýldý takdirde diðer tablolarýda etkileyebiliriz.
-- Log tablosu açýp product vb. tablolarda ekleme güncelleme gibi yapýlan iþlemlerin kim tarafýndan 
-- ve hangi tarihte yapýldýðýný loglayabiliriz.

