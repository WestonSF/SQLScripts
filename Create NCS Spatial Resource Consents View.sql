-- Creates resource consents spatial view - Joins parcels to replicated NCS resource consent tables
USE [GIS_Vector_Core]
GO

CREATE view gisadmin.vwResourceConsent as SELECT gisadmin.Parcel.OBJECTID, gisadmin.Parcel.Shape, NCSRGResourceConsent.consent_id, CAST(gisadmin.NCSRAPROPERTY.ra_unique_id AS bigint) AS Property_Number, NCSRAProperty.valuation_id  AS Valuation_ID, NCSRGResourceConsent.consent_id AS Applicant_Debtor_No, NCSRGResourceConsent.applicant_name AS Applicant_Name, NCSRGResourceConsent.consent_type AS Consent_Type, NCSRGResourceConsent.proposal_1 AS Proposal_1, NCSRGResourceConsent.proposal_2 AS Proposal_2, NCSRGResourceConsent.proposal_3 AS Proposal_3, NCSRGResourceConsent.proposal_4 AS Proposal_4, NCSRGResourceConsent.proposal_5 AS Proposal_5, NCSRAProperty.house_no AS House_No, NCSRAStreet.address_1 AS Address_1, NCSRAStreet.address_2 AS Address_2, NCSRGResourceConsent.legal_description_1 AS Legal, NCSRGResourceConsent.legal_description_2 AS Legal_2, NCSRGResourceConsent.status AS Status, NCSRGResourceConsent.decision AS Decision, NCSRGResourceConsent.conditions_yn AS Conditions_YN, NCSRGResourceConsent.hearing_yn AS Hearing_YN, NCSRGResourceConsent.notified_yn AS Notified_YN, NCSRGResourceConsent.notifiable_yn AS Notifiable_YN, CAST(CASE WHEN NCSRGResourceConsent.application_date = 'None' Then NULL ELSE NCSRGResourceConsent.application_date END AS CHAR) AS application_date, CAST(CASE WHEN NCSRGResourceConsent.decision_notificn_date  = 'None' Then NULL ELSE NCSRGResourceConsent.decision_notificn_date END AS CHAR) AS decision_notificn_date,  NCSRGResourceConsent.decision_details, NCSRGResourceConsent.status_details, NCSRGResourceConsent.consent_type_details, NCSRGResourceConsent.district_plan_zone_details

FROM ((NCSRAProperty INNER JOIN NCSRGResourceConsent ON NCSRAProperty.valuation_id = NCSRGResourceConsent.valuation_id) INNER JOIN NCSRAStreet ON NCSRAProperty.street_id = NCSRAStreet.street_id) LEFT JOIN NCSRGPropertyRecord ON NCSRAProperty.ra_unique_id = NCSRGPropertyRecord.ra_unique_id
JOIN gisadmin.Parcel
ON gisadmin.NCSRGPROPERTYRECORD.upi_id = gisadmin.Parcel.PAR_ID
GO