CREATE TYPE license_type_code AS ENUM (
	'SALE', 'BRK',  'BLLC', 'BCRP', '6',
	'REB',  'PRIN', 'REIN', 'APIN', 'ILLC',
	'ICRP', 'ERWI', 'ERWO'
);

CREATE TABLE license_type (
  license_type_code         license_type_code PRIMARY KEY,
  license_type_description  text
);
INSERT INTO license_type VALUES
	( 'SALE' , 'Salesperson' ),
	( 'BRK'  , 'Individual Broker' ),
	( 'BLLC' , 'Limited Liability Corporation Broker' ),
	( 'BCRP' , 'Corporation Broker' ),
	( '6'    , 'Partnership Broker' ),
	( 'REB'  , 'Broker Organization Branch' ),
	( 'PRIN' , 'Professional Inspector' ),
	( 'REIN' , 'Real Estate Inspector' ),
	( 'APIN' , 'Apprentice Inspector' ),
	( 'ILLC' , 'Professional Inspector LLC' ),
	( 'ICRP' , 'Professional Inspector Corporation' ),
	( 'ERWI' , 'Easement and Right-of-Way Individual' ),
	( 'ERWO' , 'Easement and Right-of-Way Business' );
COMMENT ON TABLE license_type IS 'Sourced from https://www.trec.texas.gov/public/trec-public-information-files-instructions';

---

CREATE TABLE license_status (
	license_status_code        smallint PRIMARY KEY,
	license_status_description text
);
INSERT INTO license_status VALUES
	( 20, 'Current and active' ),
	( 21, 'Current and inactive' ),
	( 30, 'Probation and active' ),
	( 31, 'Probation and inactive' ),
	( 45, 'Expired' ),
	( 47, 'Suspended' ),
	( 56, 'Relinquished' ),
	( 57, 'Revoked' ),
	( 80, 'Deceased' );
COMMENT ON TABLE license_status IS 'Sourced from https://www.trec.texas.gov/public/trec-public-information-files-instructions';

---

CREATE TABLE requirement_status (
	requirement_status_code         smallint PRIMARY KEY,
	requirement_status_description  text
);
INSERT INTO requirement_status VALUES
	( 0, 'No Requirement' ),
	( 1, 'Outstanding' ),
	( 2, 'Met' );
COMMENT ON TABLE requirement_status IS 'Originally Education Status (CE) and MCE Status -- made it more general (from website)';

---

CREATE TABLE designated_supervisor (
	is_designed_supervisor          bool PRIMARY KEY,
	designed_supervisor_description text
);
INSERT INTO designated_supervisor VALUES
	(false, 'Not Designated Supervisor'),
	(true , 'Designated Supervisor');
COMMENT ON TABLE designated_supervisor IS 'Sourced from https://www.trec.texas.gov/public/trec-public-information-files-instructions';
