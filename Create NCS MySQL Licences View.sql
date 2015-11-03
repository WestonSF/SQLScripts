-- Creates licences database view via a linked server to the NCS MySQL database (Need to setup linked server connection in SQL server first)
USE [GIS_Vector_Core]
GO
create view vwLicences as SELECT * FROM OPENQUERY(NCS, 
'select rg_licences.valuation_id AS Valuation_ID, rg_property_records.upi_id AS Parcel_ID, rg_licences.ra_unique_id AS Property_Number, rg_licences.licence_id AS Licence_No, rg_licences.licence_det AS Licence_Group, rg_licences.business_name AS Business_Name, rg_licences.business_address_1 AS Business_Address1, rg_licences.business_address_2 AS Business_Address2, rg_licences.business_address_3 AS Business_Address3, rg_licences.location_addr AS Location, rg_licences.valuation_id AS Valuation_No, rg_licences.status AS Status, rg_licences.status_det AS Status_Desc, CAST(rg_licences.status_date AS CHAR) AS Status_Date, CAST(rg_licences.application_date AS CHAR) AS Application_Date, CAST(rg_licences.start_date AS CHAR) AS StartDate, CAST(rg_licences.expiry_date AS CHAR) AS ExpiryDate, CAST(rg_licences.last_inspection_date AS CHAR) AS LastInspectionDate

FROM rg_property_records RIGHT JOIN rg_licences ON rg_property_records.ra_unique_id = rg_licences.ra_unique_id');
GO

