CREATE PROCEDURE TESTDATA
AS
BEGIN TRY
BEGIN TRANSACTION
INSERT INTO  DBO.BLOGGERS 
VALUES('Test','Test','test@test',null,null)
DECLARE @U_id int
SELECT @U_id=(SELECT TOP 1 B_ID FROM dbo.BLOGGERS ORDER BY B_ID DESC )
print @U_id
INSERT INTO dbo.Role_To_Bloger values(2,@U_id)
INSERT INTO dbo.BLOG_POST(Title,B_ID,[Content],S_id) values ('Celebrity babies',@U_id,'Simon Cowell has revealed that he would like to have a second child with his girlfriend Lauren Silverman. The X Factor judge, 54, made the comment ahead of Saturday nights','1')
DECLARE @B_id int 
SELECT @B_id=(SELECT TOP 1 B_id FROM dbo.BLOG_POST ORDER BY B_id DESC)
PRINT @B_id
INSERT INTO dbo.CATEGORIES VALUES ('Economics',null),('Parenting',null),('Career',null),('Political',null),('Finance',null),('Pet',null),('Gaming',null),('Nature',null),('DIY',null),('Celebrity Gossip',null),('Wine',null),('Medical',null),('Social Media',null),('Cat',null),('Sports',null)

INSERT INTO dbo.BLOG_TO_CATEGORY VALUES (2,@B_id),(10,@B_id)
INSERT INTO dbo.CATEGORIES VALUES('MONEY',1),('Childs',1)
INSERT INTO dbo.TAGS VALUES('How to make money'),('Plan your pregnancy')
INSERT INTO dbo.Blog_To_Tag VALUES(1,2)

COMMIT TRANSACTION 
END TRY
BEGIN CATCH
ROLLBACK TRANSACTION
END CATCH
