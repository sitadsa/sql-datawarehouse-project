/*
===============================
Create Database and Schemas 
=================================

Script Purpose:
This script creates a new database named = 'DataWarehouse' after checking if it already exists.
If database exists, it is dropped and recreated. Additionally, the script is going to create three schemas within the database :
bronze, silver, gold.
*/


----drop and recreate the database 'DataWarehouse'---

IF EXISTS (SELECT 1 FROM sys.databases WHERE name ='DataWarehouse')

BEGIN

 ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
 DROP DATABASE DataWarehouse;

 END;

CREATE DATABASE DataWarehouse;

---Create Schemas ----

CREATE SCHEMA bronze;

CREATE SCHEMA silver;

CREATE SCHEMA gold;
