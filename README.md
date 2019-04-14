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