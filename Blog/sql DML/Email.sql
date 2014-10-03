EXECUTE msdb.dbo.sysmail_add_account_sp
@account_name = 'Oleksandr',
@description = 'Sent Mail using MSDB',
@email_address = 'olkly85@gmail.com',
@display_name = 'Oleksandr Klymchuk',
@username='olkly85@gmail.com',
@password='oleksandr2007',
@mailserver_name = 'gmail.com'

EXECUTE msdb.dbo.sysmail_add_profile_sp
@profile_name = 'Oleksandr',
@description = 'Profile used to send mail'


EXECUTE msdb.dbo.sysmail_add_profileaccount_sp
@profile_name = 'Oleksandr',
@account_name = 'Oleksandr',
@sequence_number = 1

EXECUTE msdb.dbo.sysmail_add_principalprofile_sp
@profile_name = 'Oleksandr',
@principal_name = 'public',
@is_default = 1 ;

/*test*/
SELECT *FROM msdb.dbo.sysmail_account
SELECT *FROM msdb.dbo.sysmail_configuration
SELECT *FROM msdb.dbo.sysmail_principalprofile
SELECT *FROM msdb.dbo.sysmail_profile
SELECT *FROM msdb.dbo.sysmail_profileaccount
SELECT *FROM msdb.dbo.sysmail_profileaccount


sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
sp_configure 'Database Mail XPs', 1;
GO
RECONFIGURE
GO

/*send email*/

exec msdb.dbo.sp_send_dbmail @profile_name = 'Oleksandr', 
@recipients = 'olkly85@gmail.com', 
@subject = 'Mail Test', 
@body = 'Mail Sent Successfully', @body_format = 'text'

