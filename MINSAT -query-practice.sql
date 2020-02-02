Select Description, MinSAT	
	from Major m
		where MinSAT < (Select  Sat 
	from Student s
		where Lastname = 'Biggs')
