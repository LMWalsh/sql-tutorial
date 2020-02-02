

select * from MajorClassRel mc
	join Major m on
		m.ID = mc.MajorID
	join Class c on
		c.Id = mc.ClassId
			where mc.MajorID = 2

select c.Id as 'Code',
		c.Subject as 'Class',
		c.Section
			from Major m
			join MajorClassRel mc
			on mc.MajorId = m.ID
			join Class c
			on c.Id = mc.ClassId
				where Description = 'Accounting'
