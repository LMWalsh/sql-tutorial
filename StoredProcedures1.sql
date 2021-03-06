USE [testcapstone]
GO
/****** Object:  StoredProcedure [dbo].[GetAllRequests]    Script Date: 2/4/2020 10:43:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[GetAllRequests]
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Id int;
	DECLARE cur cursor for
		Select distinct r.Id from Requests r
				join Requestline rl
					on r.id = rl.RequestId;
	OPEN cur;

	FETCH NEXT From cur into @Id;
	WHILE @@FETCH_STATUS = 0
	BEGIN
		--other statements go here
		PRINT 'Request id is ' + CAST(@id as nvarchar(10));
		EXEC UpdateRequestTotal @id;
		FETCH NEXT From cur into @Id;
	END


	CLOSE cur;
	DEALLOCATE cur;
		
END
Go
EXEC GetAllRequests;
Go
Select * from Requests;
go
