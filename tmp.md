

~~~sql

content #>{head, relations}



~~~











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