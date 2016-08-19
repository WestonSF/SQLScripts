-- Creates LIM spatial view - Joins parcels to replicated NCS LIM tables
USE [GIS_Vector_Core]
GO

CREATE view gisadmin.vwLIM as select gisadmin.Parcel.OBJECTID, gisadmin.Parcel.Shape, NCSRGREPLIM.record_id, NCSRGREPLIM.lim_type, NCSRGREPLIM.debtor_id, NCSRGREPLIM.caller_name, NCSRGREPLIM.business_name, NCSRGREPLIM.who_took, NCSRGREPLIM.file_11_key, NCSRGREPLIM.valuation_no AS Valuation_ID, NCSRGREPLIM.location, CAST(CASE WHEN NCSRGREPLIM.date_received = 'None' Then NULL ELSE NCSRGREPLIM.date_received END AS CHAR) AS date_received, CAST(CASE WHEN NCSRGREPLIM.date_completed = 'None' Then NULL ELSE NCSRGREPLIM.date_completed END AS CHAR)AS date_completed, NCSRGREPLIM.process_days, NCSRGREPLIM.update_time 
ON gisadmin.NCSRGPROPERTYRECORD.upi_id = gisadmin.Parcel.PAR_ID
GO