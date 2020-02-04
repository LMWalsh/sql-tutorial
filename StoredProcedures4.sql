Create Procedure GetAllRequests
AS
BEGIN
	SET NOCOUNT ON

	SELECT * from Requests
		where Total = 0;
END
Go
EXEC GetAllRequests;
Go

Create Procedure UpdateRequestTotal

	@RequestId int
AS
BEGIN
-- calculate total for request
	SET NOCOUNT ON
		Update Requests  set Total =
	(Select sum(rl.Quantity * p.Price) as 'Request Total'
		from Requests r
		join Requestline rl
			on rl.RequestId = r.Id
		join Products p
			on p.ID =rl.ProductId
		Where r.id = @RequestId)
		where id = @RequestId;
END
	go