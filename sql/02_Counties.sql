-- Downloaded from
-- https://www.trec.texas.gov/sites/default/files/high-value-data-sets/county.txt
-- county_name can not actually be UNIQUE (ex, JIM and SAN)
CREATE TABLE county (
	county_code smallint        PRIMARY KEY,
	county_name public.citext
);
\COPY county FROM ./download/county.txt;

-- Not sure if 000, 'Out of State' is required
