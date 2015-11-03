DECLARE @MyFileName varchar(100);
SELECT @MyFileName = (SELECT 'C:\Data\Backups\SQL Server\Database_' + REPLACE(convert(varchar(50),GetDate(),103), '/', '') + '.bak');
BACKUP DATABASE CluthaGIS TO DISK=@MyFileName;