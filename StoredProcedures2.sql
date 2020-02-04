CREATE Procedure AddLineItem
	@RequestDescription nvarchar(30),
	@ProductPartNbr nvarchar(30),
	@Quantity int = 1
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @RequestId int, @ProductId int;

	SELECT @RequestId = Id from Requests where Description = @RequestDescription;

	SELECT @ProductId = Id from Products where PartNbr = @ProductPartNbr;

	Insert into RequestLine (RequestId, ProductId, Quantity)
			values(@RequestId, @ProductId, @Quantity);
END
Go
EXEC AddLineItem @RequestDescription = 'Echo', @ProductPartNbr = '11111';
Go

SELECT * from RequestLine where RequestId =1
--Select * from Requests
--Select * from Products