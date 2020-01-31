select distinct Description from OrderLines

Delete from OrderLines where id in (
select Id from OrderLines  
	where Description = 'Timex'
	)
	
