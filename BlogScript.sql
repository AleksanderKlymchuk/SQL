CREATE TABLE STATUSES
(
  S_id int not null IDENTITY (1,1) PRIMARY KEY,
  [Status] varchar (255)

)
CREATE TABLE BLOGGERS
( B_id int not null IDENTITY(1,1) PRIMARY KEY,
  FirstName varchar (255) not null,
  LastName varchar (255) not null,
  Email varchar (255) not null,
  Photo varchar (255),
  Dateofregistering date DEFAULT GETDATE(),
)
CREATE TABLE BLOG_POST
( BP_id int not null IDENTITY (1,1) PRIMARY KEY,
  Title varchar (255) not null,
  Content nvarchar(max),
  Photo varchar (255),
  Date_of_creation datetime DEFAULT GETDATE(),
  Date_of_update datetime, 
  S_id int not null FOREIGN KEY REFERENCES STATUSES(S_id),
  B_id int not null FOREIGN KEY REFERENCES BLOGGERS (B_id)
)
CREATE TABLE CATEGORIES
(
  C_id int not null IDENTITY (1,1) PRIMARY KEY,
  Category varchar(255),
  Chaild_id int not null FOREIGN KEY REFERENCES CATEGORIES (C_id)
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
  Tag varchar (255)
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
  [Role] varchar not null 
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
  [Privileges] varchar not null
)
CREATE TABLE Privileges_To_Role
(
  PR_id int not null IDENTITY (1,1) PRIMARY KEY,
  R_id int not null FOREIGN KEY REFERENCES ROLES(R_id),
  P_id int not null FOREIGN KEY REFERENCES PRIVILEGES(P_id)

) 

