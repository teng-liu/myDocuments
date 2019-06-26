
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";


CREATE TABLE public.process
(
    uuid uuid NOT NULL DEFAULT uuid_generate_v4(),
    name_key text unique,
    content jsonb,
    CONSTRAINT process_pkey PRIMARY KEY (uuid)
);


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







-------new--06.26.2019--
insert into public.process_action (name_key, content)
    values
('contractCorrectionL1','{"head": { "code": "contractCorrectionL1", "display": "Contract Correction L1", "transformations": [{ "from": "contractPendingCorrection", "to": "contractCorrectedL1Issue"}], "ui_actions": ["contract.ru"], "category": "Process.Contract.Prepare", "version": "1.0.0"}}'),
('contractCorrectionL100','{"head": { "code": "contractCorrectionL100", "display": "Contract Correction for Part B", "transformations": [{ "from": "contractPendingCorrectionL100Issue", "to": "contractCorrectedL100Issue"}], "ui_actions": ["contract.ru"], "category": "Process.Contract.Prepare", "version": "1.0.0"}}'),
('contractCorrectionL2','{"head": { "code": "contractCorrectionL2", "display": "Contract Correction L2", "transformations": [{ "from": "contractPendingCorrectionL2Issue", "to": "contractCorrectedL2Issue"}], "ui_actions": ["contract.ru"], "category": "Process.Contract.Prepare", "version": "1.0.0"}}'),
('contractCorrectionL3','{"head": { "code": "contractCorrectionL3", "display": "Contract Correction L3", "transformations": [{ "from": "contractPendingCorrectionL3Issue", "to": "contractCorrectedL3Issue"}], "ui_actions": ["contract.ru"], "category": "Process.Contract.Prepare", "version": "1.0.0"}}'),
('contractCorrectionL4','{"head": { "code": "contractCorrectionL4", "display": "Contract Correction L4", "transformations": [{ "from": "contractPendingCorrectionL4Issue", "to": "contractCorrectedL4Issue"}], "ui_actions": ["contract.ru"], "category": "Process.Contract.Prepare", "version": "1.0.0"}}'),
('contractCorrectionL4WithApproval','{"head": { "code": "contractCorrectionL4WithApproval", "display": "Contract Correction L4 Pre-Approved", "transformations": [{ "from": "contractPendingCorrectionL4IssueWithApproval", "to": "contractCorrectedL4IssueWithApproval"}], "ui_actions": ["contract.ru"], "category": "Process.Contract.Prepare", "version": "1.0.0"}}'),
('contractCorrectionL5','{"head": { "code": "contractCorrectionL5", "display": "Contract Correction L5", "transformations": [{ "from": "contractPendingCorrectionL5Issue", "to": "contractCorrectedL5Issue"}], "ui_actions": ["contract.ru"], "category": "Process.Contract.Prepare", "version": "1.0.0"}}'),
('contractCorrectionL5WithApproval','{"head": { "code": "contractCorrectionL5WithApproval", "display": "Contract Correction L5 Pre-Approved", "transformations": [{ "from": "contractPendingCorrectionL5IssueWithApproval", "to": "contractCorrectedL5IssueWithApproval"}], "ui_actions": ["contract.ru"], "category": "Process.Contract.Prepare", "version": "1.0.0"}}'),
('contractPrepare','{"head": { "code": "contractPrepare", "display": "Prepare Contract", "transformations": [{ "from": "contractPreparing", "to": "contractPrepared"}], "ui_actions": ["contract.cru"], "category": "Process.Contract.Prepare", "version": "1.0.0"}}'),
('finalize','{"head": { "code": "finalize", "display": "Finalize", "transformations": [{ "from": "Finalizing", "to": "Finalized"}], "ui_actions": ["contract.finalize"], "category": "Process.Contract.Finalize", "version": "1.0.0"}}'),
('level1Approve','{"head": { "code": "level1Approve", "display": "Approve as Level 1 staff", "transformations": [{ "from": "PendingL1Approval", "to": "level1Approved"}], "ui_actions": ["contract.approve"], "category": "Process.Contract.Approval", "version": "1.0.0"}}'),
('level1Decline','{"head": { "code": "level1Decline", "display": "Decline as Level 1 staff", "transformations": [{ "from": "PendingL1Approval", "to": "level1Declined"}], "ui_actions": ["contract.decline"], "category": "Process.Contract.Approval", "version": "1.0.0"}}'),
('level2Approve','{"head": { "code": "level2Approve", "display": "Approve as Level 2 staff", "transformations": [{ "from": "PendingL2Approval", "to": "level2Approved"}], "ui_actions": ["contract.approve"], "category": "Process.Contract.Approval", "version": "1.0.0"}}'),
('level2Decline','{"head": { "code": "level2Decline", "display": "Decline as Level 2 staff", "transformations": [{ "from": "PendingL2Approval", "to": "level2Declined"}], "ui_actions": ["contract.decline"], "category": "Process.Contract.Approval", "version": "1.0.0"}}'),
('level3Approve','{"head": { "code": "level3Approve", "display": "Approve as Level 3 staff", "transformations": [{ "from": "PendingL3Approval", "to": "level3Approved"}], "ui_actions": ["contract.approve"], "category": "Process.Contract.Approval", "version": "1.0.0"}}'),
('level3Decline','{"head": { "code": "level3Decline", "display": "Decline as Level 3 staff", "transformations": [{ "from": "PendingL3Approval", "to": "level3Declined"}], "ui_actions": ["contract.decline"], "category": "Process.Contract.Approval", "version": "1.0.0"}}'),
('level4Approve','{"head": { "code": "level4Approve", "display": "Approve as Level 4 staff", "transformations": [{ "from": "PendingL4Approval", "to": "level4Approved"}], "ui_actions": ["contract.approve"], "category": "Process.Contract.Approval", "version": "1.0.0"}}'),
('level4ApproveWithCondition','{"head": { "code": "level4ApproveWithCondition", "display": "Conditional Approve as Level 4 staff", "transformations": [{ "from": "PendingL4Approval", "to": "contractPendingCorrectionL4IssueWithApproval"}], "ui_actions": ["contract.conditonalApprove"], "category": "Process.Contract.Approval", "version": "1.0.0"}}'),
('level4Decline','{"head": { "code": "level4Decline", "display": "Decline as Level 4 staff", "transformations": [{ "from": "PendingL4Approval", "to": "level4Declined"}], "ui_actions": ["contract.decline"], "category": "Process.Contract.Approval", "version": "1.0.0"}}'),
('level5Approve','{"head": { "code": "level5Approve", "display": "Approve as Level 5 staff", "transformations": [{ "from": "PendingL5Approval", "to": "level5Approved"}], "ui_actions": ["contract.approve"], "category": "Process.Contract.Approval", "version": "1.0.0"}}'),
('level5ApproveWithCondition','{"head": { "code": "level5ApproveWithCondition", "display": "Conditional Approve as Level 5 staff", "transformations": [{ "from": "PendingL5Approval", "to": "contractPendingCorrectionL5IssueWithApproval"}], "ui_actions": ["contract.conditonalApprove"], "category": "Process.Contract.Approval", "version": "1.0.0"}}'),
('level5Decline','{"head": { "code": "level5Decline", "display": "Decline as Level 5 staff", "transformations": [{ "from": "PendingL5Approval", "to": "level5Declined"}], "ui_actions": ["contract.decline"], "category": "Process.Contract.Approval", "version": "1.0.0"}}'),
('partASign','{"head": { "code": "partASign", "display": "Sign Contract as Part A", "transformations": [{ "from": "PendingPartASign", "to": "PartASigned"}], "ui_actions": ["contract.sign"], "category": "Process.Contract.Sign", "version": "1.0.0"}}'),
('partBSign','{"head": { "code": "partBSign", "display": "Sign Contract as Part B", "transformations": [{ "from": "PendingPartBSign", "to": "PartBSigned"}], "ui_actions": ["contract.sign"], "category": "Process.Contract.Sign", "version": "1.0.0"}}'),
('partBSignDecline','{"head": { "code": "partBSignDecline", "display": "Decline Sign Contract as Part B", "transformations": [{ "from": "PendingPartBSign", "to": "PartBDeclined"}], "ui_actions": ["contract.declineSign"], "category": "Process.Contract.Sign", "version": "1.0.0"}}'),
('preparePartASign','{"head": { "code": "preparePartASign", "display": "Prepare Part A Sign", "transformations": [{ "from": "PreparingPartASign", "to": "PendingPartASign"}], "ui_actions": ["contract.prepareSign"], "category": "Process.Contract.Sign", "version": "1.0.0"}}'),
('preparePartBSign','{"head": { "code": "preparePartBSign", "display": "Prepare Part B Sign", "transformations": [{ "from": "PreparingPartBSign", "to": "PendingPartBSign"}], "ui_actions": ["contract.prepareSign"], "category": "Process.Contract.Sign", "version": "1.0.0"}}'),
('templateCorrectionForPartA','{"head": { "code": "templateCorrectionForPartA", "display": "Template Correction for Part A", "transformations": [{ "from": "pendingTemplateCorrectionFromPartA", "to": "templateCorrectedForPartA"}], "ui_actions": ["template.ru"], "category": "Process.Template.Prepare", "version": "1.0.0"}}'),
('templateCorrectionForPartB','{"head": { "code": "templateCorrectionForPartB", "display": "Template Correction for Part B", "transformations": [{ "from": "pendingTemplateCorrectionFromPartB", "to": "templateCorrectedForPartB"}], "ui_actions": ["template.ru"], "category": "Process.Template.Prepare", "version": "1.0.0"}}'),
('templatePartAApprove','{"head": { "code": "templatePartAApprove", "display": "Approve Template as Part A", "transformations": [{ "from": "templatePendingApprovalBySupervisor", "to": "templatePartAApproved"}], "ui_actions": ["template.approve"], "category": "Process.Template.Prepare", "version": "1.0.0"}}'),
('templatePartADecline','{"head": { "code": "templatePartADecline", "display": "Decline Template as Part A", "transformations": [{ "from": "templatePendingApprovalBySupervisor", "to": "templatePartADeclined"}], "ui_actions": ["template.decline"], "category": "Process.Template.Prepare", "version": "1.0.0"}}'),
('templatePartBApprove','{"head": { "code": "templatePartBApprove", "display": "Approve Template as Part B", "transformations": [{ "from": "templatePendingAcceptanceByVendor", "to": "templatePartBApproved"}], "ui_actions": ["template.approve"], "category": "Process.Template.Prepare", "version": "1.0.0"}}'),
('templatePartBDecline','{"head": { "code": "templatePartBDecline", "display": "Decline Template as Part B", "transformations": [{ "from": "templatePendingAcceptanceByVendor", "to": "templatePartBDeclined"}], "ui_actions": ["template.decline"], "category": "Process.Template.Prepare", "version": "1.0.0"}}'),
('templatePrepare','{"head": { "code": "templatePrepare", "display": "Prepare Template", "transformations": [{ "from": "templatePreparing", "to": "templatePrepared"}], "ui_actions": ["template.cru"], "category": "Process.Template.Prepare", "version": "1.0.0"}}');




//---old

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




-----user-----
insert into public.user (name_key, content)
    values
('tliu', '{"head": 
    { "code":"tliu",  
        "version": "1.0",
        "firstName": "Teng",
        "lastName": "Liu",
        "role": "author",
        "email": "tliu@gov.pe.ca",
        "phone": "902758483"}
}'),
('summerc', '{"head": 
    { "code":"summerc",  
        "version": "1.0",
        "firstName": "Summer",
        "lastName": "Cake",
        "role": "scc",
        "email": "sck@gov.pe.ca",
        "phone": "902752223"}
}'),
('winterw', '{"head": 
    { "code":"winterw",  
        "version": "1.0",
        "firstName": "Wendy",
        "lastName": "Warm",
        "role": "coo",
        "email": "swk@gov.pe.ca",
        "phone": "90275233"}
}');


insert into public.user (name_key, content)
    values
('uauthor', '{"head": 
    { "code":"uauthor",  
        "version": "1.0",
        "firstName": "uauthorF",
        "lastName": "uauthorL",
        "passward": "123",
        "role": "author",
        "email": "uauthor@gov.pe.ca",
        "phone": "902758483"}
}'),
('umanager', '{"head": 
    { "code":"umanager",  
        "version": "1.0",
        "firstName": "umanagerF",
        "lastName": "umanagerL",
        "passward": "123",
        "role": "manager",
        "email": "umanager@gov.pe.ca",
        "phone": "902758483"}
}'),
('udirector', '{"head": 
    { "code":"udirector",  
        "version": "1.0",
        "firstName": "udirectorF",
        "lastName": "udirectorL",
        "passward": "123",
        "role": "director",
        "email": "udirector@gov.pe.ca",
        "phone": "902758483"}
}'),
('uscc', '{"head": 
    { "code":"uscc",  
        "version": "1.0",
        "firstName": "usccF",
        "lastName": "usccL",
        "passward": "123",
        "role": "scc",
        "email": "uscc@gov.pe.ca",
        "phone": "902758483"}
}'),
('ucoo', '{"head": 
    { "code":"ucoo",  
        "version": "1.0",
        "firstName": "ucooF",
        "lastName": "ucooL",
        "passward": "123",
        "role": "coo",
        "email": "ucoo@gov.pe.ca",
        "phone": "902758483"}
}'),
('ucfo', '{"head": 
    { "code":"ucfo",  
        "version": "1.0",
        "firstName": "ucfoF",
        "lastName": "ucfoL",
        "passward": "123",
        "role": "cfo",
        "email": "ucfo@gov.pe.ca",
        "phone": "902758483"}
}'),
('uvendor', '{"head": 
    { "code":"uvendor",  
        "version": "1.0",
        "firstName": "uvendorF",
        "lastName": "uvendorL",
        "passward": "123",
        "role": "vendor",
        "email": "uvendor@gov.pe.ca",
        "phone": "902758483"}
}');



insert into public.process (name_key, content) 
    values ('prj-test-NO.1', '{
        "head": {
            "contract": "Contract NO.2",
            "template": "",
            "state": "PendingL1Approval",
            "possible-actions": ["level1Approve", "level1Decline"],
            "start-time": "",
            "expire-time": ""
        }
    }');






insert into public.contract_template (name_key, content)  
    values ('default-contract-template-itss', '{
    "head": {
        "id": "default-contract-template-itss",
        "code": "default-contract-template-itss",
        "title": "Default ITSS Contract Template",
        "version": "1.0"
    },
    "body": {
        "header": [
            {"field": "THIS AGREEMENT made this ${made-date::calander::dateformat1}"},
            {"field": "BETWEEN: GOVERNMENT OF PRINCE EDWARD ISLAND, as represented by the Minister of ${minister-partA::textinput::Type here},"},
            {"field": "(hereinafter referred to as \"Government\")"},
            {"field": "OF THE PART A;###right####"},
            {"field": "AND: ${partB-department::textinput::Type Here}"},
            {"field": "of ${partB-company::textinput::Type Here}"},
            {"field": "in ${partB-county::textinput::Type Here} County,  Province of ${partB-province::dropdownlist::VVV:codetable:province},"},
            {"field": "(hereinafter referred to as the \"Contractor\")"},
            {"field": "OF THE PART B###right####"},
            {"field": "WHEREAS Government wishes to engage the services of the Contractor to carry out the services described in Schedule \"A\" attached hereto;"},
            {"field": "AND WHEREAS the Contractor has agreed to provide Government with these services on certain terms and conditions as more particularly set out in this Agreement;"},
            {"field": "NOW THEREFORE in consideration of the mutual promises contained in this Agreement, the Parties agree that the terms and conditions of their relationship are as follows:"}
        ],
        "definitions":
        {
            "title": "Definitions",
            "sub_title": "In this Agreement, the following definitions apply:",
            "list": "agreement;contractor;fiscal_year;government;parties"
        },
        "convenants-contractor": [
            {
                "title": "Covenants of the Contractor and Government"
            },
            {
                "field": "The Contractor shall perform the services, assume all those responsibilities and diligently execute all those duties described in the attached Schedule \"A\" (the \"Work\"), in a manner satisfactory to Government."
            },
            {
                "field":"(a) Subject to the termination clause contained in the Termination section of this Agreement, the term of this Agreement shall commence on ${commence-start-date::calander::dateformat1}, and end on ${commence-end-date::calander::dateformat1} (the \"Term\")."
            },
            {
                "field":"(b) Subject to the termination clause contained in the Termination section of this Agreement and notwithstanding the date of signing of this Agreement, it is acknowledged by both Parties that the Contractor commenced the performance of the Work on ${agreenment-date::calander::dateformat1}. It is further agreed that the amount of $ ${maximum-total-amount::textinput::Type here} is the maximum amount to be paid for the Work and includes all amounts which may be owed for the Work done since ${work-start-date::calander::dateformat1}."
            }
        ],
        "payments": [
            {
                "title": "Payments, Records and Accounts"
            },
            {
                "field":"Government shall make payments to the Contractor in the following manner:"
            },
            {
                "field": "(a) Payment for the Work shall be at the rate of $ ${rate-per-hour::textinput::Type here} per hour, excluding taxes, but in no case shall the total payment exceed $ ${total-no-exceed::textinput::Type here}"
            },
            {
                "field": "OR###center####"
            },
            {
                "field": "(a) Payment for the Work shall be a lump sum of $ ${lump-sum::textinput::Type here} , excluding taxes, payable on the ${lump-paydate::calander::Type here}"
            },
            {
                "field": "OR###center####"
            },
            {
                "field": "(a) Payment for the work  shall  be  by installments  of $ ${rate-per-hour::textinput::Type here}, excluding taxes, payable as follows [ie. List dates (milestones) when payments will be made including amount to be paid on each date]"
            },
            {
                "field": "AND, IF APPLICABLE###center####"
            },
            {
                "field": "(b) Government shall pay all expenses of the Contractor, exclusive of all taxes, up to a maximum of $ ${expenses-maximum::textinput::Type here},based on expenses actually incurred and verified by receipt."
            },
            {
                "field": "(c) The payments described herein shall be paid upon the basis of the submission, by the ${payday_c::calander::Type here},of a detailed statement together with all necessary receipts.  Such statements shall be submitted to Government, and Government shall pay the amount owing within ${within_days_of_receipt::textinput::Type here}"
            },
            {
                "field": "(d) All payments are subject to a hold back of an amount equal to ${percentage_bill_on_completion::textinput::Type here}% of the amount billed.  The hold back shall be paid upon completion and acceptance of the Work."
            },
            {
                "field": "OR###center####"
            },
            {
                "field": "(d) All payments are subject to a hold back of an amount equal to ${percentage_bill_on_finalReport::textinput::Type here}% of the amount billed.  The hold back shall be paid upon the submission and acceptance of the final report and completion of the work."
            }
        ],
        "conditions-of-agreement": {}
    }

}');


