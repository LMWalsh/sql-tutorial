Update Customers  
	set Sales = Sales *1.10
	where City = 'Columbus'

select * from Customers where City = 'Columbus'

select * from Orderlines

Update Orderlines set
	Price = 69.99
	where Product = 'Echo'

select * from customers
	where sales > 90000