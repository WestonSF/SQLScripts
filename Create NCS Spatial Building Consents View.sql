-- Creates building consents spatial view - Joins parcels to replicated NCS building consent tables
USE [GIS_Vector_Core]
GO

CREATE view gisadmin.vwBuildingConsent as select gisadmin.Parcel.OBJECTID, gisadmin.Parcel.Shape, NCSRGBuildingConsent.consent_id, CAST(NCSRAProperty.ra_unique_id AS bigint) AS Property_Number, NCSRAProperty.valuation_id  AS Valuation_ID, NCSRGBuildingConsent.consent_id AS Applicant_Debtor_No, NCSRGBuildingConsent.applicant_name AS Applicant_Name, NCSRAProperty.house_no AS House_No, NCSRAStreet.address_1 AS Address_1, NCSRAStreet.address_2 AS Address_2, NCSRGBuildingConsent.legal_description_1 AS Legal, NCSRGBuildingConsent.legal_description_2 AS Legal_2, NCSRGBuildingConsent.status AS Status, NCSRGBuildingConsent.district_plan_details, NCSRGBuildingConsent.proposed_use, NCSRGBuildingConsent.proposal_1 AS Proposal_1, NCSRGBuildingConsent.proposal_2 AS Proposal_2, NCSRGBuildingConsent.proposal_3 AS Proposal_3, NCSRGBuildingConsent.proposal_4 AS Proposal_4, NCSRGBuildingConsent.proposal_5 AS Proposal_5, CAST(CASE WHEN NCSRGBuildingConsent.application_date = 'None' Then NULL ELSE NCSRGBuildingConsent.application_date END AS CHAR) AS application_date, CAST(CASE WHEN NCSRGBuildingConsent.issue_date = 'None' Then NULL ELSE NCSRGBuildingConsent.issue_date END AS CHAR) AS issue_date

FROM NCSRGBuildingConsent INNER JOIN ((NCSRAProperty INNER JOIN NCSRAStreet ON NCSRAProperty.street_id = NCSRAStreet.street_id) LEFT JOIN NCSRGPropertyRecord ON NCSRAProperty.ra_unique_id = NCSRGPropertyRecord.ra_unique_id) ON NCSRGBuildingConsent.valuation_id = NCSRAProperty.valuation_id
JOIN gisadmin.Parcel
ON gisadmin.NCSRGPROPERTYRECORD.upi_id = gisadmin.Parcel.PAR_ID
GO