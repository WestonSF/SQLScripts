USE [GIS_Vector_Core]
GO
create view vwLIMs as SELECT * FROM OPENQUERY(NCS, 
'select record_id, lim_type, debtor_id, caller_name, business_name, who_took, file_11_key, valuation_no, location, CAST(date_received AS CHAR) AS date_received, CAST(date_completed AS CHAR)AS date_completed, process_days, update_time 

from ncs.rg_rep_lims');
GO

