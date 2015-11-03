-- Creates licences spatial view - Joins parcels to replicated NCS licences tables
USE [GIS_Vector_Core]
GO

CREATE view gisadmin.vwLicence as select gisadmin.Parcel.OBJECTID, gisadmin.Parcel.Shape, NCSRGLICENCE.valuation_id AS Valuation_ID, CAST(NCSRGLICENCE.ra_unique_id AS bigint) AS Property_Number, NCSRGLICENCE.licence_id AS Licence_No, NCSRGLICENCE.licence_det AS Licence_Group, NCSRGLICENCE.business_name AS Business_Name, NCSRGLICENCE.business_desc AS Business_Desc, NCSRGDETAIL.detail_1 AS Business_Activity, NCSRGLICENCE.business_address_1 AS Business_Address1, NCSRGLICENCE.business_address_2 AS Business_Address2, NCSRGLICENCE.business_address_3 AS Business_Address3, NCSRGLICENCE.location_addr AS Location, NCSRGLICENCE.valuation_id AS Valuation_No, NCSRGLICENCE.status AS Status, NCSRGLICENCE.status_det AS Status_Desc, CAST(NCSRGLICENCE.status_date AS CHAR) AS Status_Date, CAST(NCSRGLICENCE.application_date AS CHAR) AS Application_Date, CAST(NCSRGLICENCE.start_date AS CHAR) AS StartDate, CAST(NCSRGLICENCE.expiry_date AS CHAR) AS ExpiryDate, CAST(NCSRGLICENCE.last_inspection_date AS CHAR) AS LastInspectionDate

FROM ((NCSRGPROPERTYRECORD RIGHT JOIN NCSRGLICENCE ON NCSRGPROPERTYRECORD.ra_unique_id = NCSRGLICENCE.ra_unique_id) LEFT JOIN NCSRGLICENCEENDORSEMENT ON NCSRGLICENCE.rg_key_id = NCSRGLICENCEENDORSEMENT.rg_key_id) LEFT JOIN NCSRGDETAIL ON NCSRGLICENCEENDORSEMENT.activity_id = NCSRGDETAIL.details_id
JOIN gisadmin.Parcel
ON gisadmin.NCSRGPROPERTYRECORD.upi_id = gisadmin.Parcel.PAR_ID
GO