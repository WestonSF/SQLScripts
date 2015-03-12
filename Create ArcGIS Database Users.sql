-- Set passwords --
DECLARE @sdePassword varchar(30) = 'Password1'; 
DECLARE @sdeadminPassword varchar(30) = 'Password1'; 
DECLARE @agsviewerPassword varchar(30) = 'Password1'; 

CREATE LOGIN sde WITH PASSWORD = ''' + @sdePassword + ''';
CREATE LOGIN sdeadmin WITH PASSWORD = ''' + @sdeadminPassword + ''';
CREATE LOGIN agsviewer WITH PASSWORD = ''' + @agsviewerPassword + ''';
EXEC sp_addsrvrolemember @loginame = 'sde', @rolename = 'processadmin';
EXEC sp_addsrvrolemember @loginame = 'sdeadmin', @rolename = 'processadmin';
GO

-- Create users for database 1 --
USE arcgis_context_db;
GO

CREATE SCHEMA sde;
GO

CREATE SCHEMA sdeadmin;
GO

CREATE SCHEMA agsviewer;
GO

CREATE USER sde FOR LOGIN sde WITH DEFAULT_SCHEMA = sde;
EXEC sp_addrolemember 'db_owner', 'sde';
EXEC sp_addrolemember 'db_accessadmin', 'sde';
EXEC sp_addrolemember 'db_datawriter', 'sde';
EXEC sp_addrolemember 'db_datareader', 'sde';
CREATE USER sdeadmin FOR LOGIN sdeadmin WITH DEFAULT_SCHEMA = sdeadmin;
EXEC sp_addrolemember 'db_owner', 'sdeadmin';
EXEC sp_addrolemember 'db_accessadmin', 'sdeadmin';
EXEC sp_addrolemember 'db_datawriter', 'sdeadmin';
EXEC sp_addrolemember 'db_datareader', 'sdeadmin';
CREATE USER agsviewer FOR LOGIN agsviewer WITH DEFAULT_SCHEMA = agsviewer;
EXEC sp_addrolemember 'db_datareader', 'agsviewer';
GO

-- Create users for database 2 --
USE arcgis_corporate_db;
GO

CREATE SCHEMA sde;
GO

CREATE SCHEMA sdeadmin;
GO

CREATE SCHEMA agsviewer;
GO

CREATE USER sde FOR LOGIN sde WITH DEFAULT_SCHEMA = sde;
EXEC sp_addrolemember 'db_owner', 'sde';
EXEC sp_addrolemember 'db_accessadmin', 'sde';
EXEC sp_addrolemember 'db_datawriter', 'sde';
EXEC sp_addrolemember 'db_datareader', 'sde';
CREATE USER sdeadmin FOR LOGIN sdeadmin WITH DEFAULT_SCHEMA = sdeadmin;
EXEC sp_addrolemember 'db_owner', 'sdeadmin';
EXEC sp_addrolemember 'db_accessadmin', 'sdeadmin';
EXEC sp_addrolemember 'db_datawriter', 'sdeadmin';
EXEC sp_addrolemember 'db_datareader', 'sdeadmin';
CREATE USER agsviewer FOR LOGIN agsviewer WITH DEFAULT_SCHEMA = agsviewer;
EXEC sp_addrolemember 'db_datareader', 'agsviewer';
GO

-- Create users for database 3 --
USE arcgis_publish_db;
GO

CREATE SCHEMA sde;
GO

CREATE SCHEMA sdeadmin;
GO

CREATE SCHEMA agsviewer;
GO

CREATE USER sde FOR LOGIN sde WITH DEFAULT_SCHEMA = sde;
EXEC sp_addrolemember 'db_owner', 'sde';
EXEC sp_addrolemember 'db_accessadmin', 'sde';
EXEC sp_addrolemember 'db_datawriter', 'sde';
EXEC sp_addrolemember 'db_datareader', 'sde';
CREATE USER sdeadmin FOR LOGIN sdeadmin WITH DEFAULT_SCHEMA = sdeadmin;
EXEC sp_addrolemember 'db_owner', 'sdeadmin';
EXEC sp_addrolemember 'db_accessadmin', 'sdeadmin';
EXEC sp_addrolemember 'db_datawriter', 'sdeadmin';
EXEC sp_addrolemember 'db_datareader', 'sdeadmin';
CREATE USER agsviewer FOR LOGIN agsviewer WITH DEFAULT_SCHEMA = agsviewer;
EXEC sp_addrolemember 'db_datareader', 'agsviewer';
GO

-- Create users for database 4 --
USE arcgis_external_db;
GO

CREATE SCHEMA sde;
GO

CREATE SCHEMA sdeadmin;
GO

CREATE SCHEMA agsviewer;
GO

CREATE USER sde FOR LOGIN sde WITH DEFAULT_SCHEMA = sde;
EXEC sp_addrolemember 'db_owner', 'sde';
EXEC sp_addrolemember 'db_accessadmin', 'sde';
EXEC sp_addrolemember 'db_datawriter', 'sde';
EXEC sp_addrolemember 'db_datareader', 'sde';
CREATE USER sdeadmin FOR LOGIN sdeadmin WITH DEFAULT_SCHEMA = sdeadmin;
EXEC sp_addrolemember 'db_owner', 'sdeadmin';
EXEC sp_addrolemember 'db_accessadmin', 'sdeadmin';
EXEC sp_addrolemember 'db_datawriter', 'sdeadmin';
EXEC sp_addrolemember 'db_datareader', 'sdeadmin';
CREATE USER agsviewer FOR LOGIN agsviewer WITH DEFAULT_SCHEMA = agsviewer;
EXEC sp_addrolemember 'db_datareader', 'agsviewer';
GO