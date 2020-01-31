select * 
	from orders o
	join customers c
		on c.id = o.CustomerId
	where o.id = 23;

Update customers set
	sales = 
(select sum(ol.Quantity * ol.Price)
	from Orderlines ol
	where ol.OrdersId = 23)
	where customers.ID = 29;



select * from orders o
join orderlines ol
 on ol.OrdersId = o.Id
 JOIN customers c
 on c.ID = o.CustomerId
 where c.Id = 29

 Select * from Customers
 where City = 'Columbus'
