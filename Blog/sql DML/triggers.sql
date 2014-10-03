USE Shop 
GO 
SET NOCOUNT ON
GO
alter  TRIGGER UpdateShopLog
ON dbo.ShopOrder 
AFTER INSERT 
AS
DECLARE @OrderId INT
SELECT @OrderId = OrderId FROM INSERTED 

PRINT 'You inserted a row in ShopOrder with id: ' 
Print @OrderId

INSERT INTO ShopLog (OrderId, Activity) VALUES (@OrderId, 'INSERT')
select *from ShopLog 
GO
INSERT INTO DBO.ShopOrder(CustomerId) VALUES(2);

GO
select * from dbo.ShopLog