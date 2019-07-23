






insert into public.rel_user_contract (name_key, user_uuid, contract_group_uuid)
 values ('AAAB', 'e24964ad-04d7-495d-ad2d-9be967a69982', '5fc65198-c6ef-438b-bc47-b1218399a2f8')





update public.user set content = '
{
    "head": {
        "role": "9ff8a532-c942-4ad4-91d6-43d2a2486663",
        "email": "eeee",
        "phone": "q324",
        "lastName": "LLL",
        "nameCode": "marry",
        "password": "123",
        "firstName": "FFFName",
        "privileged-contract-group": ["4f28156c-8956-478a-a1a8-3efe56b2fdd6", "3b706eb3-8d98-48cb-853e-b6201244375e"]
    }
}
'
where name_key = 'marry';




CREATE TABLE public.contractGroup
(
    uuid uuid NOT NULL DEFAULT uuid_generate_v4(),
    name_key text unique,
    content jsonb,
    CONSTRAINT contractGroup_pkey PRIMARY KEY (uuid)
);

CREATE TABLE public.rel_contract_Group
(
    uuid uuid NOT NULL DEFAULT uuid_generate_v4(),
    name_key text unique,
    group_uuid uuid,
    contract_uuid uuid,
    option jsonb,
    CONSTRAINT contractMappingGroup_pkey PRIMARY KEY (uuid)
);


insert into public.contractGroup(name_key, content)
    values
    ('groupAA', '
    {
        "head": {
            "display": "GROUP AA"
        }
    }
    '),
        ('groupBB', '
    {
        "head": {
            "display": "GROUP BB"
        }
    }
    ');






~~~sql

-- get contract list, based on user's assigned contract group

select c.*, u.name_key, g.name_key as group_name 
 from contract_group g
	inner join public.rel_user_contract r
		on r.contract_group_uuid = g.uuid
	inner join rel_contract_group r1
		on r1.group_uuid = g.uuid
	inner join public.contract c
		on c.uuid = r1.contract_uuid
	inner join public.user u
	on u.uuid = r.user_uuid
where u.uuid='1a4a85c1-3f87-43fc-94b7-905443c81a69'









--query user collection, with its contract_group information, array of json {group_name, group_uuid}

with t_user as (
select u.name_key,
(jsonb_array_elements_text(
 u.content#>'{head, privileged-contract-group}')) as c_group
 from public.user u
),
t_user_con_group as (
select 
 t.name_key as user_name, 
		jsonb_agg(
		jsonb_build_object('group_uuid', g.uuid, 'group_name', g.name_key)) as contract_group
from t_user t
  inner join public.contract_group g
  on g.uuid::text = (t.c_group)
	group by t.name_key
) 
select u.*, t.contract_group
 from public.user u
 inner join t_user_con_group t
 on u.name_key = t.user_name
 ;


~~~



~~~sql



select cg.uuid as group_uuid,
		jsonb_agg(
			jsonb_build_object('contract_key', c.name_key, 'contract_uuid', c.uuid)) 
		as contracts
	from public.rel_contract_group rel
	inner join public.contract_group cg
	on cg.uuid = rel.group_uuid
	inner join public.contract c
	on c.uuid = rel.contract_uuid
	where cg.uuid = '501f9dde-2911-4410-94a0-5537d7d945f7'
	group by cg.uuid
	


---v3.0---query all workflow with possible_actions as an array
select w.*, 
	array_agg(a.name_key) as possible_action 
from workflow w      
	inner join workflow_action a 
		on a.from_state=w.current_state
	group by w.uuid, w.name_key, w.current_state, w.template_uuid, w.contract_uuid, w.description, w.options;



--v2.0---query all the workflow with its possible_actions
select w.name_key as workflow, 
    w.current_state as current_state, 
    a.name_key as possible_action 
from workflow w      
    inner join workflow_action a on a.from_state=w.current_state;




--v1.0-find possible actions => given a workflow id (and its current_state)
select w.name_key as workflow, 
        w.current_state as current_state, 
        a.name_key as possible_action 
    from workflow w
    inner join workflow_action a on a.from_state=w.current_state
    where w.name_key = 'workflow001';




with t_workflow as (
    select w.name_key as workflow,
            w.current_state as current_state,
            a.name_key as action,
            a.to_state as new_state
        from workflow w
        inner join workflow_action a
            on a.from_state=w.current_state
        where a.name_key='level4Approve'
    )
update workflow set current_state=t_workflow.new_state 
	from t_workflow 
	where workflow.name_key='workflow001'; 


~~~






project:    prj-test-NO.1
current state:      PendingL1Approval
action:     level1Approve
--> next state can be found from process_action, or t_transitions

==> update current state, and possible-actions (for process/project)


~~~sql

with t1 as (
	select name_key, content#>'{head, state}' as state, content#>'{head, possible-actions}' as actions
		from public.process 
		where name_key = 'prj-test-NO.1'
	),
	t2 as (
	select name_key, jsonb_array_elements_text(actions) as action_name
		from t1
	)
	select x.name_key, x.action_name, y.content#>'{head, relations, 0, to}'
		from t2 x
			inner join process_action y
				on y.name_key = x.action_name;
~~~



1. find the process by name
    select * from public.process where name_key = 'prj-test-NO.1';
2. get its current state: 
    select content#>'{head, state}' from public.process where name_key = 'prj-test-NO.1';
3. find in action
   with t_state as (
       select content#>'{head, state}' as state from public.process where name_key = 'prj-test-NO.1'
   )

select * 
	from public.t_transitions 
	where action_name = 'level1Approve' 
		and from_state = (select (content#>'{head, state}')::text from public.process where name_key = 'prj-test-NO.1');
		


~~~sql


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

~~~













action
------

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












~~~json
{
    "content": {
        "body": {
            "start-date": "2019-05-07",
            "vendor-name": "eeeee",
            "contract-title": "eeeeeeeeee",
            "contract-summary": "eeeeee"
        },
        "head": {
            "code": "errreeeeeee",
            "template-key": "tami-test-template-IIIII"
        }
    }
}

{
    "body": {
        "start-date": "2019-05-15",
        "vendor-name": "uuyyyyyyyyyyyyyy",
        "contract-title": "ertyyyyyyyyyyyyyyyyyy",
        "contract-summary": "yyyyyyy"
    },
    "head": {
        "code": "yyyyy",
        "template-key": "tami-test-template-IIIII"
    }
}

~~~



~~~sql

delete from contract_template where name_key='template-NO234234';

insert into public.contract_template (name_key, content)  
    values ('Contract-template-NO234234', '{
    "head": {
        "id": "default-contract-template-itss",
        "code": "default-contract-template-itss",
        "title": "Default ITSS Contract Template",
        "version": "1.0"
    },
    "body": {
        "header": [
            {"field": "THIS AGREEMENT made this $[made-date::calander::dateformat1]"},
            {"field": "BETWEEN: GOVERNMENT OF PRINCE EDWARD ISLAND, as represented by the Minister of $[minister-partA::textinput::Type here], $$$$(hereinafter referred to as \"Government\") OF THE PART A;"},
            {"field": "AND: $[partB-department::textinput::Type Here] $$of $[partB-company::textinput::Type Here] $$in $[partB-county::textinput::Type Here] County,  Province of $[partB-province::dropdownlist::VVV:codetable:province], $$$$(hereinafter referred to as the \"Contractor\") OF THE PART B"},
            {"field": "WHEREAS Government wishes to engage the services of the Contractor to carry out the services described in Schedule \"A\" attached hereto;$$"},
            {"field": "AND WHEREAS the Contractor has agreed to provide Government with these services on certain terms and conditions as more particularly set out in this Agreement;$$"},
            {"field": "NOW THEREFORE in consideration of the mutual promises contained in this Agreement, the Parties agree that the terms and conditions of their relationship are as follows:$$"}
        ],
        "definitions": {},
        "convenants-contractor": {},
        "payments": [
            {
                "title": "Payments, Records and Accounts"
            },
            {
                "field":"Government shall make payments to the Contractor in the following manner:"
            },
            {
                "field": "(a) Payment for the Work shall be at the rate of $ $[rate-per-hour::textinput::Type here] per hour, excluding taxes, but in no case shall the total payment exceed $ $[total-no-exceed::textinput::Type here]"
            },
            {
                "field": "OR"
            },
            {
                "field": "(a) Payment for the Work shall be a lump sum of $ $[lump-sum::textinput::Type here] , excluding taxes, payable on the $[lump-paydate::calander::Type here]"
            },
            {
                "field": "OR"
            },
            {
                "field": "(a) Payment for the work  shall  be  by installments  of $ $[rate-per-hour::textinput::Type here], excluding taxes, payable as follows [ie. List dates (milestones) when payments will be made including amount to be paid on each date]"
            },
            {
                "field": "AND, IF APPLICABLE"
            },
            {
                "field": "(b) Government shall pay all expenses of the Contractor, exclusive of all taxes, up to a maximum of $ $[expenses-maximum::textinput::Type here],based on expenses actually incurred and verified by receipt."
            },
            {
                "field": "(c) The payments described herein shall be paid upon the basis of the submission, by the $[payday_c::calander::Type here],of a detailed statement together with all necessary receipts.  Such statements shall be submitted to Government, and Government shall pay the amount owing within $[within_days_of_receipt::textinput::Type here]"
            },
            {
                "field": "(d) All payments are subject to a hold back of an amount equal to $[percentage_bill_on_completion::textinput::Type here]__% of the amount billed.  The hold back shall be paid upon completion and acceptance of the Work."
            },
            {
                "field": "OR"
            },
            {
                "field": "(d) All payments are subject to a hold back of an amount equal to $[percentage_bill_on_finalReport::textinput::Type here]__% of the amount billed.  The hold back shall be paid upon the submission and acceptance of the final report and completion of the work."
            }
        ],
        "conditions-of-agreement": {}
    }

}');

~~~



~~~sql
insert into public.contract (name_key, content)  
    values('CONTRACT NO783487', '
{
    "body": {
        "payday_c": "2018-05-30",
        "made-date": "2017-11-01",
        "partB-county": "Prince",
        "partB-company": "MAXMUS",
        "rate-per-hour": "38",
        "minister-partA": "Steven",
        "agreenment-date": "2018-06-01",
        "total-no-exceed": "9060",
        "work-start-date": "2019-06-01",
        "expenses-maximum": "1600",
        "partB-department": "Deltaware",
        "commence-end-date": "2020-4-30",
        "commence-start-date": "2019-04-30",
        "maximum-total-amount": "12000",
        "within_days_of_receipt": "14",
        "percentage_bill_on_completion": "50",
        "percentage_bill_on_finalReport": "60"
    },
    "head": {
        "code": "CONTRACT NO783487",
        "template-key": "default-contract-template-itss"
    }
}');
~~~



====================================



select * from public.user;
select * from public.contract_template;
select * from contract;
select * from action;
select * from public.role;
select * from m_role_action;
select * from public.user where name_key ilike 'u%'
select * from contract_group;

drop table public.process;
drop table public.process_action;
drop table public.process_state;
drop table public.t_transitions;
drop table public.event;

select * from m_role_action;
select * from workflow;
select * from workflow_action;

select * from rel_user_contract;


-- delete from public.process_action;
-- delete from public.role;
-- delete from public.user;
-- delete from public.m_role_action;
-- delete from public.role where name_key ilike 'undefined'
-- delete from public.user where name_key ilike 'u%'
-- delete from public.contract_template where uuid = '26ab4d14-132b-4b8f-8c16-2986b36745b5';


CREATE TABLE public.rel_user_contract
(
    uuid uuid NOT NULL DEFAULT uuid_generate_v4(),
    name_key text unique,
    user_uuid uuid,
    contract_group_uuid uuid,
    contract_uuid uuid,
    option jsonb,
    CONSTRAINT contractMappingUser_pkey PRIMARY KEY (uuid)
);

insert into public.rel_user_contract (name_key, user_uuid, contract_group_uuid)
 values ('AAAA', '048af2eb-ebe5-4ef8-80d5-97034aa16e65', '4f28156c-8956-478a-a1a8-3efe56b2fdd6')

insert into public.rel_user_contract (name_key, user_uuid, contract_group_uuid)
 values ('AAAB', '048af2eb-ebe5-4ef8-80d5-97034aa16e65', '3b706eb3-8d98-48cb-853e-b6201244375e')

insert into public.rel_user_contract (name_key, user_uuid, contract_group_uuid)
 values ('BBB', '1a4a85c1-3f87-43fc-94b7-905443c81a69', '4f28156c-8956-478a-a1a8-3efe56b2fdd6')

select * from public.user;

select c.uuid, c.name_key, c.content
                        from public.contract c
                    inner join public.user u
                        on u.content#>'{head, vendorName}' = c.content#>'{body, partB-company}'
                    where u.name_key = ''


with t_role as (
	select r.uuid as role_uuid,
		jsonb_build_object('uuid', r.uuid, 'display', r.content#>>'{head, display}') as role
	from public.user u
	inner join public.role r
		on u.content#>>'{head, role}' = r.uuid::text
	group by r.uuid
)
select u.*, r.role
	from public.user u
	inner join t_role r
		on u.content#>>'{head, role}' = r.role_uuid::text
	where u.name_key = 'marry'



select * from public.user

select name_key, content#>'{head, privileged-contract-group}' 
 from public.user

select * from contract_group
select * from rel_contract_Group;

select c.*, u.name_key, g.name_key as group_name 
 from contract_group g
	inner join public.rel_user_contract r
		on r.contract_group_uuid = g.uuid
	inner join rel_contract_group r1
		on r1.group_uuid = g.uuid
	inner join public.contract c
		on c.uuid = r1.contract_uuid
	inner join public.user u
	on u.uuid = r.user_uuid
where u.uuid='1a4a85c1-3f87-43fc-94b7-905443c81a69'

1a4a85c1-3f87-43fc-94b7-905443c81a69

with t_user as (
select r.user_uuid,
			jsonb_agg(
		jsonb_build_object('group_uuid', g.uuid, 'group_name', g.name_key)) as contract_group
 from public.rel_user_contract r
 left join public.contract_group g
 	on g.uuid = r.contract_group_uuid
	group by r.user_uuid
)
select u.*, t.contract_group from public.user u
 left join t_user t
 on t.user_uuid = u.uuid
 

select u.*, g.uuid as group_uuid, g.name_key as group_name
 from public.user u
 inner join public.rel_user_contract r
 	on r.user_uuid = u.uuid
 inner join public.contract_group g
 	on g.uuid = r.contract_group_uuid
	
	
	

with t_user as (
select u.name_key,
(jsonb_array_elements_text(
 u.content#>'{head, privileged-contract-group}')) as c_group
 from public.user u
),
t_user_con_group as (
select 
 t.name_key as user_name, 
		jsonb_agg(
		jsonb_build_object('group_uuid', g.uuid, 'group_name', g.name_key)) as contract_group
from t_user t
  left join public.contract_group g
  on g.uuid::text = (t.c_group)
	group by t.name_key
) 
select u.*, t.contract_group
 from public.user u
 left join t_user_con_group t
 on u.name_key = t.user_name
 ;




select u.*, t.group_uuid, t.group_name, 
	jsonb_agg(
		jsonb_build_object('group_uuid', t.group_uuid, 'group_name', t.group_name))
 from public.user u
 inner join t_user_con_group t
 	on u.name_key = t.user_name

 ;





update public.user set content = '
{
    "head": {
        "role": "9ff8a532-c942-4ad4-91d6-43d2a2486663",
        "email": "eeee",
        "phone": "q324",
        "lastName": "LLL",
        "nameCode": "marry",
        "password": "123",
        "firstName": "FFFName",
        "privileged-contract-group": ["4f28156c-8956-478a-a1a8-3efe56b2fdd6", "3b706eb3-8d98-48cb-853e-b6201244375e"]
    }
}'
where name_key = 'marry';


update public.user 
	set name_key = 'tttt' where name_key = 'tt'

select r.name_key as role_name_key,
		r.uuid as role_uuid,
		m.content#>'{body}' as previleges
	from public.m_role_action m
	inner join public.role r
	on m.content#>>'{head, role-uuid}' = r.uuid::text
where r.name_key = 'coo';




with t_user_prv as (
	select 
		x.name_key as user, 
		y.content#>>'{head, display}' as role_name, 
		jsonb_array_elements_text(z.content#>'{body}') as privilege
		from public.user x
			inner join public.role y
				on x.content#>>'{head, role}' = y.content#>>'{head, display}'
			inner join public.m_role_action z
				on y.content#>>'{head, display}' = z.name_key
		where x.name_key = 'wewe'
	)
	select *
		from t_user_prv p
			inner join public.process_action a
				on p.privilege = a.name_key;



update contract_template set name_key='Contract Template - Defa ult'
 where uuid='26ab4d14-132b-4b8f-8c16-2986b36745b5'
;

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

CREATE TABLE public.process
(
    uuid uuid NOT NULL DEFAULT uuid_generate_v4(),
    name_key text unique,
    content jsonb,
    CONSTRAINT process_pkey PRIMARY KEY (uuid)
);


update user
	set content = content - ''

insert into public.user (name_key, content)
    values
('tt', '{"head": 
    { "code":"tt",  
        "version": "1.0",
        "firstName": "tt",
        "lastName": "tt",
        "passward": "tt",
        "role": "author",
        "email": "uauthor@gov.pe.ca",
        "phone": "902758483"}
}')





----------
select c.content->'body'->>'maximum-total-amount' AS "cost", 
		c.content->'body'->>'partB-company' AS "company"
	from public.contract c
	;

with t_list as (
    select
		name_key as contractName,
        (content#>>'{body, maximum-total-amount}')::decimal as money,
        content#>>'{body, partB-company}' as company
        from contract
 )
select 
    company,  
    sum(money) as sum
from t_list
	group by company;
---------------


insert into public.user (name_key, content)
    values
('uauthor', '{"head": 
    { "username":"uauthor",  
        "version": "1.0",
        "firstName": "uauthorF",
        "lastName": "uauthorL",
        "passward": "123",
        "role": "author",
        "email": "uauthor@gov.pe.ca",
        "phone": "902758483"}
}'),
('umanager', '{"head": 
    { "username":"umanager",  
        "version": "1.0",
        "firstName": "umanagerF",
        "lastName": "umanagerL",
        "passward": "123",
        "role": "manager",
        "email": "umanager@gov.pe.ca",
        "phone": "902758483"}
}'),
('udirector', '{"head": 
    { "username":"udirector",  
        "version": "1.0",
        "firstName": "udirectorF",
        "lastName": "udirectorL",
        "passward": "123",
        "role": "director",
        "email": "udirector@gov.pe.ca",
        "phone": "902758483"}
}'),
('uscc', '{"head": 
    { "username":"uscc",  
        "version": "1.0",
        "firstName": "usccF",
        "lastName": "usccL",
        "passward": "123",
        "role": "scc",
        "email": "uscc@gov.pe.ca",
        "phone": "902758483"}
}'),
('ucoo', '{"head": 
    { "username":"ucoo",  
        "version": "1.0",
        "firstName": "ucooF",
        "lastName": "ucooL",
        "passward": "123",
        "role": "coo",
        "email": "ucoo@gov.pe.ca",
        "phone": "902758483"}
}'),
('ucfo', '{"head": 
    { "username":"ucfo",  
        "version": "1.0",
        "firstName": "ucfoF",
        "lastName": "ucfoL",
        "passward": "123",
        "role": "cfo",
        "email": "ucfo@gov.pe.ca",
        "phone": "902758483"}
}'),
('uvendor', '{"head": 
    { "username":"uvendor",  
        "version": "1.0",
        "firstName": "uvendorF",
        "lastName": "uvendorL",
        "passward": "123",
        "role": "vendor",
        "email": "uvendor@gov.pe.ca",
        "phone": "902758483"}
}');


----------------

with t_list as (
    select
		name_key as contractName,
        (content#>>'{body, maximum-total-amount}')::decimal as money,
        content#>>'{body, partB-company}' as company
        from contract
 )
select 
	contractName,
    company, 
    money, 
    sum(money) over (partition by company) as sum
from t_list;
-----------
