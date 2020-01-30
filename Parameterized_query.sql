alter procedure SalesRangeByCity
	 @city varchar(30) = 'Cleveland',
	 @lowsales decimal(8,2) = 30000,
	 @highsales decimal(8,2) = 85000
as
BEGIN
--set @lowsales = 40000;
--set @highsales = 70000;

	select * from customers
		where city = @city AND
			sales between @lowsales and @highsales;
 END