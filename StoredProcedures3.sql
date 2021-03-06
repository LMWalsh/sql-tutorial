USE [testcapstone]
GO
/****** Object:  StoredProcedure [dbo].[AddLineItem]    Script Date: 2/4/2020 12:33:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[AddLineItem]
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
