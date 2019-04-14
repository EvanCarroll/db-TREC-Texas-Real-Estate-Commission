-- Downloaded from
-- https://www.trec.texas.gov/sites/default/files/high-value-data-sets/county.txt
CREATE TABLE county (
	county_code smallint PRIMARY KEY,
	county_name text
);
\COPY trec.county FROM ./download/county.txt;

-- Not sure if 000, 'Out of State' is required
