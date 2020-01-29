SELECT * 
from student
where gpa <3.0
order by sat desc;

select Student.Id ,concat(firstname,' ',Lastname) as 'Name', SAT, GPA, 
isnull(Description, 'Undecided')as 'Major',
isnull(MinSAT, '') as 'Min SAT Required'
from student
left join Major
on major.id = student.majorId
--select * from student;