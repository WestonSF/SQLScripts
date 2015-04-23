-- Setup variables
DECLARE @database varchar(MAX) = 'SummitGIS'; 
DECLARE @authentication varchar(MAX) = 'Windows'; -- Windows or SQL Server
DECLARE @userName varchar(MAX) = 'SFM\kyran.dromgool'; -- If windows authentication, needs to be Domain\User
DECLARE @userPassword varchar(MAX) = ''; -- Not needed if windows authentication
DECLARE @permissions varchar(MAX) = 'Edit'; -- View or Edit

-- Create the queries
DECLARE @queryUserName varchar(MAX);
IF (@authentication = 'SQL Server')
	SET @queryUserName = @userName;
ELSE
	SET @queryUserName = '[' + @userName + ']';
DECLARE @createWindowsLogin varchar(MAX) = 'CREATE LOGIN ' + @queryUserName + ' FROM WINDOWS';
DECLARE @createSQLLogin varchar(MAX) = 'CREATE LOGIN ' + @queryUserName +' WITH PASSWORD ='''+ @userPassword +'''';
DECLARE @useDatabase varchar(MAX) = 'USE ' + @database;
DECLARE @createSchema varchar(MAX) = 'CREATE SCHEMA ' + @queryUserName;
DECLARE @createUser varchar(MAX) = 'CREATE USER ' + @queryUserName + ' FOR LOGIN ' + @queryUserName + ' WITH DEFAULT_SCHEMA = ' + @queryUserName;
DECLARE @grantAccess varchar(MAX);
IF (@permissions = 'View')
	SET @grantAccess = 'GRANT CONNECT, SELECT TO ' + @queryUserName;
ELSE
	SET @grantAccess = 'GRANT CONNECT, DELETE, EXECUTE, INSERT, SELECT, UPDATE TO ' + @queryUserName;

-- Create login
IF (@authentication = 'SQL Server')
	EXEC (@createSQLLogin);
ELSE
	EXEC (@createWindowsLogin);

-- Execute on database
EXEC (@useDatabase);
EXEC (@createSchema);
EXEC (@createUser);
EXEC (@grantAccess);
IF (@permissions = 'View')
	EXEC sp_addrolemember 'db_datareader', @userName;
ELSE
	EXEC sp_addrolemember 'db_datawriter', @userName;
	EXEC sp_addrolemember 'db_datareader', @userName;
GO