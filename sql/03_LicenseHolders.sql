CREATE TABLE license_holders (
  license_type_code           license_type_code REFERENCES license_type,
  license_number              text, -- not unique and has hyphon,
  full_name                   public.citext,
  suffix                      text,
  license_status_code         smallint REFERENCES license_status,
  original_license            date,
  license_expiration          date,
  education_status            smallint REFERENCES requirement_status,
  mce_status                  smallint REFERENCES requirement_status,
  is_designated_supervisor    bool REFERENCES designated_supervisor,
  phone                       text,
  email                       text,
  addr_mailing_line_1         text,
  addr_mailing_line_2         text,
  addr_mailing_line_3         text,
  addr_mailing_city           text,
  addr_mailing_state_code     text,
  addr_mailing_zip_code       text,
  addr_mailing_county_code    smallint REFERENCES county,
  addr_physical_line_1        text,
  addr_physical_line_2        text,
  addr_physical_line_3        text,
  addr_physical_city          text,
  addr_physical_state_code    text,
  addr_physical_zip_code      text,
  addr_physical_county_code   smallint REFERENCES county,
  related_license_type        text,
  related_license_number      text,
  related_license_full_name   text,
  related_license_suffix      text,
  relationship_start_date     date,
  agency_identifier           text,
  full_name_last_first        public.citext
);

COMMENT ON TABLE license_holders IS 'Broker and Sales Agent, Inspector, and Easement data'

-- Note the \b quote char is a workaround to disable quoting
-- https://stackoverflow.com/a/20402913/124486

\echo Loading trec - Broker and Sales Agent License Holder Information
\COPY license_holders FROM './processed/trecfile.txt'  WITH ( FORMAT CSV, DELIMITER E'\t', QUOTE E'\b');

\echo Loading erw - Easement or Right-Of-Ways agents License Holder Information
\COPY license_holders FROM './processed/erwfile.txt'   WITH ( FORMAT CSV, DELIMITER E'\t', QUOTE E'\b');

\echo Loading license - Inspector License Holder Information
\COPY license_holders FROM './processed/inspfile.txt'  WITH ( FORMAT CSV, DELIMITER E'\t', QUOTE E'\b');
