Update OrderLines set
	price= price * .9
	Where id in (
		select ol.id
			from customers c
			join Orders o 
				on c.Id = o.CustomerId
			Join Orderlines ol 
				on o.ID = ol.OrdersId
			where c.sales > 90000
	)


