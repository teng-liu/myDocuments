
CREATE TABLE public.contract
(
    uuid uuid NOT NULL DEFAULT uuid_generate_v4(),
    name_key text unique,
    content jsonb,
    CONSTRAINT contract_pkey PRIMARY KEY (uuid)
);


CREATE TABLE public.contract_template
(
    uuid uuid NOT NULL DEFAULT uuid_generate_v4(),
    name_key text unique,
    content jsonb,
    CONSTRAINT contract_template_pkey PRIMARY KEY (uuid)
);


CREATE TABLE public.codetable
(
    uuid uuid NOT NULL DEFAULT uuid_generate_v4(),
    name_key text unique,
    content jsonb,
    CONSTRAINT codetable_pkey PRIMARY KEY (uuid)
);



-- contract_template
-- inside json -> grammer for variables
-- grammar-I
-- {
--     "code": "contract-type",
--     "field": "CONTRACT TYPE: $[contract-type::singleselection::Professional Services,Maintenance/Service Support,Standing Offer Contract]"
-- },
-- grammar-II
-- {
--     "code": "contract-type",
--     "field": "CONTRACT TYPE: $[contract-type::singleselection::VVV-codetable-contract_type]"
-- },


insert into public.contract_template (name_key, content)  
    values ('itss-CA-Template', '
{
    "head": {
        "id": "contract-template-itss",
        "code": "contract-template-itss",
        "title": "Default Contract Template",
        "version": "1.0"
    },
    "roles": [
        {
            "role": "contract-author",
            "content": [
                {
                    "code": "contract-title",
                    "field": "TITLE OF THE CONTRACT: $[contract-title::textinput::Type Here. Provide a descriptive title and ensure it matches the title on the contract document]"
                },
                {
                    "code": "vender-name",
                    "field": "VENDOR NAME: $[vendor-name::textinput::Type here]",
                    "requirement": "$[verified::checkbox]I verified that the vendor is registered to do business on PEI (Registry$[registry-link::link::https://www.princeedwardisland.ca/en])"
                },
                {
                    "code": "start-end-date",
                    "field": "START DATE: $[start-date::calander::Type Here]  END DATE: $[start-date::calander::Type Here]"
                },
                {
                    "code": "contract-summary",
                    "field": "CONTRACT SUMMARY: $[contract-summary::textarea::The summary is meant to be a description, in layman’s terms, of what the vendor will provide to government within this contract. It is intended to brief executive leadership about the contract. It should be summarized in 3-4 sentences.]"
                },
                {
                    "code": "contract-type",
                    "field": "CONTRACT TYPE: $[contract-type::singleselection::Professional Services,Maintenance/Service Support,Standing Offer Contract]"
                },
                {
                    "code": "amendment-no",
                    "field": "Amendment No: $[amendment-no::textinput::Type here]"
                },
                {
                    "code": "contract-value",
                    "field": "TOTAL CONTRACT VALUE: $ $[totalvalue::textinput::Type here]",
                    "requirement": "Value/Year (if multi-year, add as needed): 2018-2019: $ $[value-20182019::textinput::Type here] 2019-2020: $ $[value-20192020::textinput::Type here] 2020-2021: $ $[value-20202021::textinput::Type here]"
                },
                {
                    "code": "history-contract-value",
                    "field": "HISTORICAL CONTRACT VALUE",
                    "requirement": "Add Previous Years if same scope of work: 2016-2017: $ $[value-20162017::textinput::Type here] 2017-2018: $ $[value-20172018::textinput::Type here]"
                },
                {
                    "code": "associated-tb-ec",
                    "field": "List associated TB/EC decision#, if applicable $[associated-tb-ec::textinput::Type here]"
                },
                {
                    "code": "contract-notes",
                    "field": "CONTRACT NOTES: $[contract-notes::textarea::Type here  If there are any notes to be highlighted regarding increases in costs, or other relevant notes – please add that detail here]"
                },
                {
                    "code": "vender-selected-by",
                    "field": "Vendor Selected by: $[vender-selected-by::singleselection::Competitive Process, Sole Source, Three Quotes Received]"
                },
                {
                    "code": "background-documentation",
                    "field": "Background Documentation: $[background-doc::multipleselection::Used standard template with no changes, Legal Review Notes Attached, Risk Review Notes Attached, The Contract Review Checklist was completed and is included in the contract package (available on Alfresco)]"
                },
                {
                    "code": "contract-management-items",
                    "field": "Ongoing Follow-up Required: $[ongoing-required::textarea::Identify any conditions in the contract ie reporting dates, multiple payment dates, or credit reviews that needs to be reviewing during the life of the contract]",
                    "requirement": "Option to Extend:  $[option-extend::textarea::Identify any option to extend the contract and provide a note on extension details]"
                },
                {
                    "code": "contract-management-items",
                    "field": "BUDGET SECTION CODES: $[budegt-section::textarea::Section] $[budegt-object::textarea::Object] $[budegt-program::textarea::Program] $[budegt-project::textarea::Project] $[budegt-contract-no::textarea::Contract #] ",
                    "notes": "Authors should confirm budget codes with Manager/Director Contract# is provided by SCC and is required to be referenced in the SOW"
                }
            ]
        },
        {
            "role": "scc",
            "content": {}
        },
        {
            "role": "approvals",
            "content": {}
        }
    ]
}
');
 



--Contract---

insert into public.contract (name_key, content) 
    values('empty-contract-of-itss-control-approval-template','
{
    "body": {
        "start-date": "2019-06-18",
        "totalvalue": "2000",
        "vendor-name": "iWave",
        "amendment-no": "Test-AMDNO-83859",
        "contract-type": "Maintenance/Service Support",
        "contract-title": "TestContract-0603",
        "contract-summary": "this is a test contract, and this is the contract summary",
        "vender-selected-by": "Competitive Process"
    },
    "head": {
        "code": "Test creating contract-iWave",
        "template-key": "itss-control-approval-template"
    }
}
');


insert into public.contract (name_key, content) 
    values('empty-contract-of-itss-control-approval-template','
    {
    "head": {
        "code": "",
        "title":"",
        "template-key": "itss-control-approval-template",
        "generated-date": "",
        "author": "",
        "version":"1.0.0"
    },
    "body": {
        "data": {
            "contract-title": "",
            "vendor-name": "",
            "verified": "",
            "registry-link": "",
            "start-date": "",
            "end-date": "",
            "contract-summary": "",
            "contract-type": "",
            "amendment-no": "",
            "totalvalue": "",
            "value-per-year": {
                "value-20182019":"",
                "value-20192020":"",
                "value-20202021":""
            },
            "value-history-year": {
                "value-20162017":"",
                "value-20172018":""
            },
            "associated-tb-ec": "",
            "contract-notes": "",
            "vender-selected-by": "",
            "background-doc": "",
            "ongoing-required": "",
            "option-extend": "",
            "budegt-section": "",
            "budegt-object": "",
            "budegt-program": "",
            "budegt-project": "",
            "budegt-contract-no": ""
        }
    }
}
');



--codetable--
---codetable---
SELECT content->'body' FROM codetable; 
SELECT content->>'body' FROM codetable where name_key='contract_type';

insert into public.codetable (name_key, content)
    values('contract_type',
	'{
        "head": {
            "code": "contract_type",
            "display": "Contract Type",
            "expire-date": ""
        },
        "body": [
                    {
                        "code": "professional-services",
                        "display": "Professional Services",
                        "order": 1,
                        "start-date": "2016-03-03",
                        "end-date": "2022-03-03"
                    },
                    {
                        "code": "maintenance-service-support",
                        "display": "Maintenance/Service Support",
                        "order": 2,
                        "start-date": "2016-03-03",
                        "end-date": "2022-03-03"
                    },
                    {
                        "code": "standing-offer-contract",
                        "display": "Standing Offer Contract",
                        "order": 3,
                        "start-date": "2016-03-03",
                        "end-date": "2022-03-03"
                    }
                ]
    }' 
		  );

insert into public.codetable (name_key, content)
    values('province',
	'{
        "head": {
            "code": "province",
            "display": "Province",
            "expire-date": "3022-03-03"
        },
        "body": [       
                    {
                        "code": "ontario",
                        "display": "Ontario",
                        "initial": "ON",
                        "start-date": "2016-03-03",
                        "end-date": "3022-03-03"
                    },
                    {
                        "code": "Quebec",
                        "display": "Quebec",
                        "initial": "QB",
                        "start-date": "2016-03-03",
                        "end-date": "3022-03-03"
                    },
                    {
                        "code": "Nova-Scotia",
                        "display": "Nova Scotia",
                        "initial": "NS",
                        "start-date": "2016-03-03",
                        "end-date": "3022-03-03"
                    },
                    {
                        "code": "New-Brunswich",
                        "display": "New Brunswich",
                        "initial": "NB",
                        "start-date": "2016-03-03",
                        "end-date": "3022-03-03"
                    },
                    {
                        "code": "Manitoba",
                        "display": "Manitoba",
                        "initial": "MB",
                        "start-date": "2016-03-03",
                        "end-date": "3022-03-03"
                    },
                    {
                        "code": "ontario",
                        "display": "Ontario",
                        "initial": "ON",
                        "start-date": "2016-03-03",
                        "end-date": "3022-03-03"
                    },
                    {
                        "code": "British-Columbia",
                        "display": "British Columbia",
                        "initial": "BC",
                        "start-date": "2016-03-03",
                        "end-date": "3022-03-03"
                    },
                    {
                        "code": "Prince-Edward-Island",
                        "display": "PE",
                        "initial": "PE",
                        "start-date": "2016-03-03",
                        "end-date": "3022-03-03"
                    },
                    {
                        "code": "Saskatchewan",
                        "display": "Saskatchewan",
                        "initial": "SK",
                        "start-date": "2016-03-03",
                        "end-date": "3022-03-03"
                    },
                    {
                        "code": "Alberta",
                        "display": "Alberta",
                        "initial": "AB",
                        "start-date": "2016-03-03",
                        "end-date": "3022-03-03"
                    },
                    {
                        "code": "Newfoundland-and-Labrador",
                        "display": "Newfoundland and Labrador",
                        "initial": "NL",
                        "start-date": "2016-03-03",
                        "end-date": "3022-03-03"
                    }
        ]
    }' 
		  );


--about update
insert into public.contract (name_key, content) 
    values ('tami-contract-cccc', '{"head-updated":{}}')
    on conflict (name_key)
    do 
        update
            set content='{"head-updated":{}}';

update contract
	set content = (
		jsonb_set(
			content,
			'{data, selected}',
			'1',
			false))::json where uuid='c26eac14-7a02-4564-b864-40cfd28da438';

update tests_summary_data 
	set data = (
		jsonb_set(
			to_jsonb(data), 
			'{misc,gap,pa}', 
			'-1', 
			false))::json where data->'misc'->'gap'->>'pa' = '0';