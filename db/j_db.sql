
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

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

CREATE TABLE public.definition
(
    uuid uuid NOT NULL DEFAULT uuid_generate_v4(),
    name_key text unique,
    content jsonb,
    CONSTRAINT definition_pkey PRIMARY KEY (uuid)
);
----role-event----

CREATE TABLE public.role
(
    uuid uuid NOT NULL DEFAULT uuid_generate_v4(),
    name_key text unique,
    content jsonb,
    CONSTRAINT role_pkey PRIMARY KEY (uuid)
);

CREATE TABLE public.user
(
    uuid uuid NOT NULL DEFAULT uuid_generate_v4(),
    name_key text unique,
    content jsonb,
    CONSTRAINT user_pkey PRIMARY KEY (uuid)
);

CREATE TABLE public.action
(
    uuid uuid NOT NULL DEFAULT uuid_generate_v4(),
    name_key text unique,
    content jsonb,
    CONSTRAINT action_pkey PRIMARY KEY (uuid)
);

CREATE TABLE public.event
(
    uuid uuid NOT NULL DEFAULT uuid_generate_v4(),
    name_key text unique,
    content jsonb,
    CONSTRAINT event_pkey PRIMARY KEY (uuid)
);

CREATE TABLE public.m_role_action
(
    uuid uuid NOT NULL DEFAULT uuid_generate_v4(),
    name_key text unique,
    content jsonb,
    CONSTRAINT role_action_pkey PRIMARY KEY (uuid)
);


CREATE TABLE public.process_action
(
    uuid uuid NOT NULL DEFAULT uuid_generate_v4(),
    name_key text unique,
    content jsonb,
    CONSTRAINT process_action_pkey PRIMARY KEY (uuid)
);



insert into public.process_action (name_key, content)
    values
('contractCorrectionL1', '{"head": { "code":"contractCorrectionL1", "display":"Make Correction for Level1 issue", "version": "1.0", "category":"process.contract.modification" }}'),
('contractCorrectionL100', '{"head": { "code":"contractCorrectionL100", "display":"Make Correction for PartB reported issue", "version": "1.0", "category":"process.contract.modification" }}'),
('contractCorrectionL2', '{"head": { "code":"contractCorrectionL2", "display":"Make Correction for Level2 issue", "version": "1.0", "category":"process.contract.modification" }}'),
('contractCorrectionL3', '{"head": { "code":"contractCorrectionL3", "display":"Make Correction for Level3 issue", "version": "1.0", "category":"process.contract.modification" }}'),
('contractCorrectionL4', '{"head": { "code":"contractCorrectionL4", "display":"Make Correction for Level4 issue", "version": "1.0", "category":"process.contract.modification" }}'),
('contractCorrectionL5', '{"head": { "code":"contractCorrectionL5", "display":"Make Correction for Level5 issue", "version": "1.0", "category":"process.contract.modification" }}'),
('contractPrepare', '{"head": { "code":"contractPrepare", "display":"Prepare Contract", "version": "1.0", "category":"process.contract.creation" }}'),
('finalize', '{"head": { "code":"finalize", "display":"Finalize Contract (Backup, Broadcast)", "version": "1.0", "category":"process.contract.finalization" }}'),
('level1Approve', '{"head": { "code":"level1Approve", "display":"First Level Contract Approval", "version": "1.0", "category":"process.contract.approval" }}'),
('level1Decline', '{"head": { "code":"level1Decline", "display":"First Level Contract Refusal", "version": "1.0", "category":"process.contract.approval" }}'),
('level2Approve', '{"head": { "code":"level2Approve", "display":"Second Level Contract Approval", "version": "1.0", "category":"process.contract.approval" }}'),
('level2Decline', '{"head": { "code":"level2Decline", "display":"Second Level Contract Refusal", "version": "1.0", "category":"process.contract.approval" }}'),
('level3Approve', '{"head": { "code":"level3Approve", "display":"Third Level Contract Approval", "version": "1.0", "category":"process.contract.approval" }}'),
('level3Decline', '{"head": { "code":"level3Decline", "display":"Third Level Contract Refusal", "version": "1.0", "category":"process.contract.approval" }}'),
('level4Approve', '{"head": { "code":"level4Approve", "display":"Forth Level Contract Approval", "version": "1.0", "category":"process.contract.approval" }}'),
('level4Decline', '{"head": { "code":"level4Decline", "display":"Forth Level Contract Refusal", "version": "1.0", "category":"process.contract.approval" }}'),
('level5Approve', '{"head": { "code":"level5Approve", "display":"Fifth Level Contract Approval", "version": "1.0", "category":"process.contract.approval" }}'),
('level5Decline', '{"head": { "code":"level5Decline", "display":"Fifth Level Contract Refusal", "version": "1.0", "category":"process.contract.approval" }}'),
('next', '{"head": { "code":"next", "display":"Next", "version": "1.0", "category":"process.auto" }}'),
('partASign', '{"head": { "code":"partASign", "display":"Sign Contract as Part A", "version": "1.0", "category":"process.contract.sign" }}'),
('partBacceptTemplate', '{"head": { "code":"partBacceptTemplate", "display":"Accept Template as Part B", "version": "1.0", "category":"process.template" }}'),
('partBSign', '{"head": { "code":"partBSign", "display":"Sign Contract as Part B", "version": "1.0", "category":"process.contract.sign" }}'),
('partBSignDecline', '{"head": { "code":"partBSignDecline", "display":"Decline Sign Contract as Part B", "version": "1.0", "category":"process.contract.sign" }}'),
('preparePartASign', '{"head": { "code":"preparePartASign", "display":"Prepare Sign for Part A", "version": "1.0", "category":"process.contract.sign" }}'),
('preparePartBSign', '{"head": { "code":"preparePartBSign", "display":"Prepare Sign for Part B", "version": "1.0", "category":"process.contract.sign" }}'),
('templatePrepare', '{"head": { "code":"templatePrepare", "display":"Prepare Template", "version": "1.0", "category":"process.template" }}');








--about update
--upsert
insert into public.contract (name_key, content) 
    values ('tami-contract-cccc', '{"head-updated":{}}')
    on conflict (name_key)
    do 
        update
            set content='{"head-updated":{}}';

--update
update contract
	set content = (
		jsonb_set(
			content,
			'{data, selected}',
			'1',
			false))::json where uuid='c26eac14-7a02-4564-b864-40cfd28da438';

--update path-> value
update tests_summary_data 
	set data = (
		jsonb_set(
			to_jsonb(data), 
			'{misc,gap,pa}', 
			'-1', 
			false))::json where data->'misc'->'gap'->>'pa' = '0';





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
--     "field": "CONTRACT TYPE: $[contract-type::singleselection::VVV:codetable:contract_type]"
-- },


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
    values('vender_selected_by',
	'{
        "head": {
            "code": "vender_selected_by",
            "display": "Vender Selected By",
            "expire-date": ""
        },
        "body": [
                    {
                        "code": "competitive_process",
                        "display": "Competitive Process",
                        "order": 1,
                        "start-date": "2016-03-03",
                        "end-date": "2022-03-03"
                    },
                    {
                        "code": "sole_source",
                        "display": "Sole Source",
                        "order": 2,
                        "start-date": "2016-03-03",
                        "end-date": "2022-03-03"
                    },
                    {
                        "code": "three_quotes_received",
                        "display": "Three Quotes Received",
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
                        "code": "Prince-Edward-Island",
                        "display": "Prince Edward Island",
                        "initial": "PE",
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
                        "code": "Manitoba",
                        "display": "Manitoba",
                        "initial": "MB",
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


-----defination---

insert into public.definition (name_key, content) 
    values ('agreement', '
    {
        "head": {
            "code": "agreement",
            "template-key": " ",
            "author": "author-guy"
        },
        "body": "\"Agreement\" means this Memorandum of Agreement and all attached schedules, and \"Memorandum of Agreement\" means this Agreement excluding all attached schedules;"
    }'),
    ('contractor', '
    {
        "head": {
            "code": "contractor",
            "template-key": " ",
            "author": "author-guy"
        },
        "body": "\"Contractor\" means [INSERT CONTRACTOR’S FULL LEGAL NAME HERE];"
    }'),
    ('fiscal_year', '
    {
        "head": {
            "code": "fiscal_year",
            "template-key": " ",
            "author": "author-guy"
        },
        "body": "\"Fiscal Year\" means a 12 month period beginning on April 1st in a year and ending on March 31st in the following year;"
    }'),

    ('government', '
    {
        "head": {
            "code": "government",
            "template-key": " ",
            "author": "author-guy"
        },
        "body": "\"Government\" means Government of Prince Edward Island, as represented by the Minister of Finance;"
    }'),

    ('parties', '
    {
        "head": {
            "code": "parties",
            "template-key": " ",
            "author": "author-guy"
        },
        "body": "\"Parties\" means Government and the Contractor, and \"Party\" means either of them as the context requires;"
    }');



----action---


insert into public.action (name_key, content) 
    values
('view', '{
    "head": {
        "code": "view",
        "display": "View",
        "objects": ["template", "contract", "user"]
    },
    "body": {
    }
}'), 
('create', '{
    "head": {
        "code": "create",
        "display": "Create",
        "objects": ["template", "contract", "user"]
    },
    "body": {
    }
}'),
('modify', '{
    "head": {
        "code": "modify",
        "display": "Modify",
        "objects": ["template", "contract", "user"]
    },
    "body": {
    }
}'),
('delete', '{
    "head": {
        "code": "delete",
        "display": "Delete",
        "objects": ["template", "contract", "user"]
    },
    "body": {
    }
}'),
('review', '{
    "head": {
        "code": "review",
        "display": "Review",
        "objects": ["template", "contract", "user"]
    },
    "body": {
    }
}'),
('approve', '{
    "head": {
        "code": "approve",
        "display": "Approve",
        "objects": ["template", "contract", "user"]
    },
    "body": {
    }
}'),
('rollback', '{
    "head": {
        "code": "rollback",
        "display": "Rollback",
        "objects": ["template", "contract", "user"]
    },
    "body": {
    }
}'),
('finalize', '{
    "head": {
        "code": "finalize",
        "display": "Finalize",
        "objects": ["template", "contract", "user"]
    },
    "body": {
    }
}'),
('agree', '{
    "head": {
        "code": "agree",
        "display": "Agree",
        "objects": ["template", "contract", "user"]
    },
    "body": {
    }
}'),
('allocate', '{
    "head": {
        "code": "allocate",
        "display": "Allocate",
        "objects": ["template", "contract", "user"]
    },
    "body": {
    }
}'),
('receive', '{
    "head": {
        "code": "receive",
        "display": "Receive",
        "objects": ["template", "contract", "user"]
    },
    "body": {
    }
}'),
('backup', '{
    "head": {
        "code": "backup",
        "display": "Backup",
        "objects": ["template", "contract", "user"]
    },
    "body": {
    }
}');


---role---



insert into public.role (name_key, content) 
    values
('author', '{
    "head": {
        "code": "author",
        "display": "Contract Author"
    },
    "body": {
    }
}'),
('manager', '{
    "head": {
        "code": "manager",
        "display": "Manager"
    },
    "body": {
    }
}'),
('director', '{
    "head": {
        "code": "director",
        "display": "Director"
    },
    "body": {
    }
}'),
('coo', '{
    "head": {
        "code": "coo",
        "display": "Chief Operating Officer"
    },
    "body": {
    }
}'),
('cfo', '{
    "head": {
        "code": "cfo",
        "display": "Chief Financial Officer"
    },
    "body": {
    }
}'),
('scc', '{
    "head": {
        "code": "scc",
        "display": "Supply Chain Coordinator"
    },
    "body": {
    }
}'),
('vendor', '{
    "head": {
        "code": "vendor",
        "display": "Vendor"
    },
    "body": {
    }
}');



---event / process----


---task------



