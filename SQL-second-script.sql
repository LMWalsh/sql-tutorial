select concat(firstname,' ', lastname) as 'Instructor', yearsExperience, 
C.Id as 'Course Code',i.IsTenured,
concat (subject,' ',section) as 'Class'
 from instructor i

 join class c 
  on i.id = c.instructorId
  where i.IsTenured =1
  order by i.Lastname