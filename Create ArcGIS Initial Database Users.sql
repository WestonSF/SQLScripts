-- First select the database to be used from the dropdown in SQL Server Management Studio, then change the passwords below before running the script --

-- Create the logins and assign server roles --
CREATE LOGIN sde WITH PASSWORD = 'Password1', CHECK_POLICY = OFF;
CREATE LOGIN gisadmin WITH PASSWORD = 'Password1', CHECK_POLICY = OFF;
CREATE LOGIN giseditor WITH PASSWORD = 'Password1', CHECK_POLICY = OFF;
CREATE LOGIN gisviewer WITH PASSWORD = 'Password1', CHECK_POLICY = OFF;
EXEC sp_addsrvrolemember @loginame = 'sde', @rolename = 'processadmin';
EXEC sp_addsrvrolemember @loginame = 'gisadmin', @rolename = 'processadmin';
GO

-- Create user schemas --
CREATE SCHEMA sde;
GO
CREATE SCHEMA gisadmin;
GO
CREATE SCHEMA giseditor;
GO
CREATE SCHEMA gisviewer;
GO

-- Create users and assign roles --
CREATE USER sde FOR LOGIN sde WITH DEFAULT_SCHEMA = sde;
CREATE USER gisadmin FOR LOGIN gisadmin WITH DEFAULT_SCHEMA = gisadmin;
EXEC sp_addrolemember 'db_owner', 'gisadmin';
EXEC sp_addrolemember 'db_datawriter', 'gisadmin';
EXEC sp_addrolemember 'db_datareader', 'gisadmin';
CREATE USER giseditor FOR LOGIN giseditor WITH DEFAULT_SCHEMA = giseditor;
EXEC sp_addrolemember 'db_datawriter', 'giseditor';
EXEC sp_addrolemember 'db_datareader', 'giseditor';
CREATE USER gisviewer FOR LOGIN gisviewer WITH DEFAULT_SCHEMA = gisviewer;
EXEC sp_addrolemember 'db_datareader', 'gisviewer';
GO

-- Grant access for users --
GRANT CONNECT, DELETE, EXECUTE, INSERT, SELECT, UPDATE TO giseditor;
GRANT CONNECT, SELECT TO gisviewer;
GO