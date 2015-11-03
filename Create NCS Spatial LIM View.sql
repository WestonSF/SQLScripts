-- Creates LIM spatial view - Joins parcels to replicated NCS LIM tables
USE [GIS_Vector_Core]
GO

CREATE view gisadmin.vwLIM as select gisadmin.Parcel.OBJECTID, gisadmin.Parcel.Shape, NCSRGREPLIM.record_id, NCSRGREPLIM.lim_type, NCSRGREPLIM.debtor_id, NCSRGREPLIM.caller_name, NCSRGREPLIM.business_name, NCSRGREPLIM.who_took, NCSRGREPLIM.file_11_key, NCSRGREPLIM.valuation_no, NCSRGREPLIM.location, CAST(NCSRGREPLIM.date_received AS CHAR) AS date_received, CAST(NCSRGREPLIM.date_completed AS CHAR)AS date_completed, NCSRGREPLIM.process_days, NCSRGREPLIM.update_time 

FROM ((NCSRAProperty INNER JOIN NCSRGREPLIM ON NCSRAProperty.valuation_id = NCSRGREPLIM.valuation_no) INNER JOIN NCSRAStreet ON NCSRAProperty.street_id = NCSRAStreet.street_id) LEFT JOIN NCSRGPropertyRecord ON NCSRAProperty.ra_unique_id = NCSRGPropertyRecord.ra_unique_id
JOIN gisadmin.Parcel
ON gisadmin.NCSRGPROPERTYRECORD.upi_id = gisadmin.Parcel.PAR_ID
GO