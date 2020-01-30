SELECT s.Id as 'Student Id', concat(s.firstname, ' ', s.lastname) as 'Name',
		c.Id as 'Course Number', concat(c.Subject, ' ',c.Section) as 'Class',
		concat(i.Firstname, ' ', i.Lastname) as 'Instructor', m.Description as 'Major'
	from Student s
	join StudentClassRel sc
		on s.Id = sc.StudentId
	join Class c
		on sc.ClassId = c.Id
	join Instructor i
		on i.id = c.InstructorId
	Join Major m
		on s.MajorId = m.Id