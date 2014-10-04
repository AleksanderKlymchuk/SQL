CREATE PROCEDURE blogscript
AS
BEGIN
BEGIN TRANSACTION 
CREATE TABLE STATUSES
(
  S_id int not null IDENTITY (1,1) PRIMARY KEY,
  [Status] varchar (255) not null

)
CREATE TABLE BLOGGERS
( B_id int not null IDENTITY(1,1) PRIMARY KEY,
  FirstName varchar (255) not null,
  LastName varchar (255) not null,
  Email varchar (255) not null,
  Photo varchar (255),
  Dateofregistering date DEFAULT GETDATE() not null,
)
CREATE TABLE BLOG_POST
( BP_id int not null IDENTITY (1,1) PRIMARY KEY,
  Title varchar (255) not null,
  Content nvarchar(max) not null,
  Photo varchar (255),
  Date_of_creation  datetime DEFAULT GETDATE() not null,
  Date_of_update DATETIME, 
  S_id int not null default 1 FOREIGN KEY REFERENCES STATUSES(S_id),
  B_id int not null FOREIGN KEY REFERENCES BLOGGERS (B_id)
)

CREATE TABLE CATEGORIES
(
  C_id int not null IDENTITY (1,1) PRIMARY KEY,
  Category varchar(255),
  Chaild_id int FOREIGN KEY REFERENCES CATEGORIES (C_id)
)

CREATE TABLE BLOG_TO_CATEGORY
(
  BC_id int not null IDENTITY (1,1) PRIMARY KEY,
  Cat_gid int not null FOREIGN KEY REFERENCES CATEGORIES (C_id),
  B_Id int not null FOREIGN KEY REFERENCES BLOG_POST
)


CREATE TABLE TAGS
(
  T_id int not null IDENTITY (1,1) PRIMARY KEY,
  Tag varchar  (255)not null
) 

CREATE TABLE Blog_To_Tag
(
 BT_id int not null IDENTITY (1,1) PRIMARY KEY ,
 Blog_id int not null FOREIGN KEY REFERENCES BLOG_POST(BP_id),
 Tag_id int not null FOREIGN KEY REFERENCES TAGS(T_id),
)

CREATE TABLE ROLES
(
  R_id int not null IDENTITY (1,1) PRIMARY KEY,
  [Role] varchar(255) not null 
)

CREATE TABLE Role_To_Bloger
(
 RB_id int not null IDENTITY (1,1) PRIMARY KEY,
 R_id int not null FOREIGN KEY REFERENCES ROLES(R_id),
 B_id int not null FOREIGN KEY REFERENCES BLOGGERS(B_id)
)

CREATE TABLE PRIVILEGES
( 
  P_id int not null IDENTITY (1,1) PRIMARY KEY,
  [Privileges] varchar(255) not null
)

CREATE TABLE Privileges_To_Role
(
  PR_id int not null IDENTITY (1,1) PRIMARY KEY,
  R_id int not null FOREIGN KEY REFERENCES ROLES(R_id),
  P_id int not null FOREIGN KEY REFERENCES PRIVILEGES(P_id)

) 
CREATE TABLE BlogUpdate
(
   id int identity(1,1) not null  PRIMARY KEY ,
   B_id int not null,
   time_stamp datetime not null,
   Activity varchar(20) not null

)
COMMIT
END

BEGIN TRY

BEGIN TRANSACTION 
INSERT INTO STATUSES VALUES('pending'),('published'),('Archived'),('Hidden')
 
INSERT INTO PRIVILEGES Values('read'),('write'),('delete'),('update')

INSERT INTO ROLES VALUES ('Admin'),('Athor'),('Commentator')

INSERT INTO Privileges_To_Role VALUES ('1','1'),('1','2'),('1','3'),('1','4'),('2','1'),('2','2'),('2','4'),('3','1'),('3','2')
COMMIT TRANSACTION
PRINT 'TRANSACTION COMMIT'

END TRY
BEGIN CATCH 
  ROLLBACK TRANSACTION
  PRINT 'TRANSACTION ROLLBACKED'
END CATCH 
