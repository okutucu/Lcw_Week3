Select Product.Name,Product.Price, Discount.Description From Product inner join Discount
on Product.DiscountID = Discount.Id


Create View GetDiscount
AS
Select Product.Name,Product.Price, Discount.Description From Product inner join Discount
on Product.DiscountID = Discount.Id

Select * from GetDiscount
Where Price > 400
Order By Name



