IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'kiraskitchens_cms')
CREATE database kiraskitchens_cms;
GO

USE [master]
GO

IF NOT EXISTS(SELECT 1 FROM [kiraskitchens_cms].sys.database_principals WHERE name = 'kiraskitchens')
CREATE LOGIN [kiraskitchens] WITH PASSWORD=N'Pass@word', DEFAULT_DATABASE=[kiraskitchens_cms], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF;
GO

USE [kiraskitchens_cms]
GO

IF NOT EXISTS(SELECT 1 FROM [kiraskitchens_cms].sys.database_principals WHERE name = 'kiraskitchens')
BEGIN
CREATE USER [kiraskitchens] FOR LOGIN [kiraskitchens];
ALTER USER [kiraskitchens] WITH DEFAULT_SCHEMA=[dbo];
ALTER ROLE [db_owner] ADD MEMBER [kiraskitchens];
END
GO