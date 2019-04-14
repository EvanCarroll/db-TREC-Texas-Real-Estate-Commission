CREATE EXTENSION IF NOT EXISTS citext;

SET CLIENT_ENCODING = 'UTF8';

DROP SCHEMA IF EXISTS trec CASCADE;
CREATE SCHEMA trec;
COMMENT ON SCHEMA trec IS 'Texas Real Estate Commission - https://trec.texas.gov/';

SET SEARCH_PATH = 'trec';

\i sql/01_TREC_Website.sql
\i sql/02_Counties.sql
\i sql/03_LicenseHolders.sql
\i sql/99_view.sql
