select city, sum(sales) as 'Total sales for Cincy & Cle', 
max(sales) as 'Highest Sales',
min(sales) as 'Lowest Sales',
avg(sales) as 'Average Sales',
count(*) as 'Nbr of customers'
from customers

--where sales > 50000
group by city
having sum(sales) > 600000
--order by 'Sales' desc

