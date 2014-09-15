create procedure previlegies
@roleid int
as
select dbo.Role.RoleName as R,dbo.Privilege.privileges from Role 
full outer  JOIN dbo.roletoprivilege on dbo.Role.id=dbo.roletoprivilege.role
full  JOIN dbo.Privilege on dbo.Privilege.id=dbo.roletoprivilege.privileges
WHERE dbo.Role.id=@roleid;
