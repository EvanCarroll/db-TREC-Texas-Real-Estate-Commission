SET SEARCH_PATH=trec;
DROP VIEW IF EXISTS view_all_licenses;
CREATE OR REPLACE VIEW view_all_licenses AS
WITH county AS ( SELECT county_code,county_name FROM county )
SELECT lh.license_number
, lh.full_name
, lh.related_license_full_name
, lh.email
, lh.phone
, lh.is_designated_supervisor
, lh.license_expiration
, l.license_type_description AS license_type
, ls.license_status_description AS license_status
, m.county_name AS mailing_county
, p.county_name AS physical_county
, lh.addr_physical_city, lh.addr_mailing_city
, lh.addr_physical_zip_code, lh.addr_mailing_zip_code
FROM license_holders AS lh
  JOIN license_type AS l USING (license_type_code)
  JOIN license_status AS ls USING (license_status_code)
  JOIN county AS p ON ( lh.addr_physical_county_code = p.county_code )
  JOIN county AS m ON ( lh.addr_mailing_county_code = m.county_code );
