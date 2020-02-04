CREATE Procedure SetRequestStatus
	@RequestId int,
	@IsApproved bit = 1
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Status nvarchar(10);
	IF @IsApproved = 1
BEGIN
	Set	@Status = 'APPROVED';
END
IF @IsApproved = 0
BEGIN
	Set @Status = 'REJECTED';
	END
	
UPDATE Requests Set
		Status = @Status 
		WHERE Id = @RequestId;
END
Go



CREATE Procedure SetRequestToApproved
	@RequestId int
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Requests Set
		Status = 'APPROVED' 
		WHERE Id = @RequestId;
END
Go

CREATE Procedure SetRequestToRejected
	@RequestId int
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Requests Set
		Status = 'REJECTED' 
		WHERE Id = @RequestId;
END
Go