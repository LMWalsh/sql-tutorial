select i.Lastname as 'Last Name', Count(c.id) as '# of Classes'
	from Instructor i
		join Class c 
			on i.Id = c.InstructorId
				group by i.Lastname
					order by '# of Classes'
				