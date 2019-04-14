Texas Real Estate Commission (TREC)
===

Currently we download from [TREC](https://www.trec.texas.gov/) the following ["High Value Data Sets"](https://www.trec.texas.gov/public/high-value-data-sets)

* Broker and Sales Agent License Holder Information
* Inspector License Holder Information
* Easement or Right-Of-Ways agents License Holder Information

You can find the [data and field definitions on the TREC High Value Data Sets Instructions page](https://www.trec.texas.gov/public/trec-public-information-files-instructions)

Rationale 
---

I'm looking for a broker that is independent in my area, that

1. Won't charge me a desking fee.
2. Doesn't want a percentage cut.
3. Preferably local and clever.

Thus...

	SELECT *
	FROM trec.view_all_licenses
	WHERE license_type = 'Individual Broker'
		AND license_status     = 'Current and active'
		AND mailing_county     = 'HARRIS'
		AND physical_county    = 'HARRIS'
		AND addr_mailing_city  = 'KINGWOOD'
		AND addr_physical_city = 'KINGWOOD';

And, I can go broker shopping.

Instructions
---

Inside this repo, you'll find a script called `init.sh`. Running that script should download and convert the raw data to a format for ingestion. This scripts calls `runall.sql` which handles the creation of the schema and loading the data into PostgreSQL.

Requirements
---

* PostgreSQL
* iconv (to convert from CP850 to UTF-8)
* sed to remove \x00's from the feed.
* curl to download the raw data files.
