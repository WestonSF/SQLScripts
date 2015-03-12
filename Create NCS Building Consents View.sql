USE [GIS_Vector_Core]
GO
create view vwBuildingConsents as SELECT * FROM OPENQUERY(NCS, 
'select rg_building_consents.consent_id, rg_property_records.upi_id AS Parcel_ID, ra_properties.ra_unique_id AS Property_Number, ra_properties.valuation_id AS Valuation_No, rg_building_consents.consent_id AS Applicant_Debtor_No, rg_building_consents.applicant_name AS Applicant_Name, ra_properties.house_no AS House_No, ra_streets.address_1 AS Address_1, ra_streets.address_2 AS Address_2, rg_building_consents.legal_description_1 AS Legal, rg_building_consents.legal_description_2 AS Legal_2, rg_building_consents.status AS Status, rg_building_consents.district_plan_details, rg_building_consents.proposed_use, rg_building_consents.proposal, CAST(rg_building_consents.application_date AS CHAR) AS application_date, CAST(rg_building_consents.issue_date AS CHAR) AS issue_date

FROM rg_building_consents INNER JOIN ((ra_properties INNER JOIN ra_streets ON ra_properties.street_id = ra_streets.street_id) LEFT JOIN rg_property_records ON ra_properties.ra_unique_id = rg_property_records.ra_unique_id) ON rg_building_consents.valuation_id = ra_properties.valuation_id');
GO