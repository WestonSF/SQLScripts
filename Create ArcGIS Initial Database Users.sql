-- Setup variables
DECLARE @database varchar(MAX) = 'Database'; 
DECLARE @sdePassword varchar(30) = 'Password1'; 
DECLARE @sdeadminPassword varchar(30) = 'Password1'; 
DECLARE @agsviewerPassword varchar(30) = 'Password1'; 

-- Create the queries
DECLARE @useDatabase varchar(MAX) = 'USE ' + @database;
CREATE LOGIN sde WITH PASSWORD = ''' + @sdePassword + ''';
CREATE LOGIN sdeadmin WITH PASSWORD = ''' + @sdeadminPassword + ''';
CREATE LOGIN agsviewer WITH PASSWORD = ''' + @agsviewerPassword + ''';
EXEC sp_addsrvrolemember @loginame = 'sde', @rolename = 'processadmin';
EXEC sp_addsrvrolemember @loginame = 'sdeadmin', @rolename = 'processadmin';

-- Create users for database --
EXEC (@useDatabase);
GO

CREATE SCHEMA sde;
GO

CREATE SCHEMA sdeadmin;
GO

CREATE SCHEMA agsviewer;
GO

CREATE USER sde FOR LOGIN sde WITH DEFAULT_SCHEMA = sde;
CREATE USER sdeadmin FOR LOGIN sdeadmin WITH DEFAULT_SCHEMA = sdeadmin;
EXEC sp_addrolemember 'db_owner', 'sdeadmin';
EXEC sp_addrolemember 'db_datawriter', 'sdeadmin';
EXEC sp_addrolemember 'db_datareader', 'sdeadmin';
CREATE USER agsviewer FOR LOGIN agsviewer WITH DEFAULT_SCHEMA = agsviewer;
EXEC sp_addrolemember 'db_datareader', 'agsviewer';
GO