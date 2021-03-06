
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

CREATE TABLE public.rel_role_action
(
    uuid uuid NOT NULL DEFAULT uuid_generate_v4(),
    name_key text unique,
    content jsonb,
    CONSTRAINT role_rel_action_pkey PRIMARY KEY (uuid)
);


CREATE TABLE public.process_action
(
    uuid uuid NOT NULL DEFAULT uuid_generate_v4(),
    name_key text unique,
    content jsonb,
    CONSTRAINT process_action_pkey PRIMARY KEY (uuid)
);


CREATE TABLE public.process_state
(
    uuid uuid NOT NULL DEFAULT uuid_generate_v4(),
    name_key text unique,
    content jsonb,
    CONSTRAINT process_state_pkey PRIMARY KEY (uuid)
);

CREATE TABLE public.vendor
(
    uuid uuid NOT NULL DEFAULT uuid_generate_v4(),
    name_key text unique,
    content jsonb,
    CONSTRAINT vendor_pkey PRIMARY KEY (uuid)
);

-- store transitions for generating fsm
CREATE TABLE public.t_transitions
(
    uuid uuid NOT NULL DEFAULT uuid_generate_v4(),
    action_name text,
    from_state text,
    to_state text,
    method text,
    option text,
    CONSTRAINT t_transitions_pkey PRIMARY KEY (uuid)
);

-- workflow actions -> non-json
CREATE TABLE public.workflow_action
(
    uuid uuid NOT NULL DEFAULT uuid_generate_v4(),
    name_key text unique,
    display text,
    from_state text,
    to_state text,
    ui_actions text,
    category text,
    description text,
    message text,
    options jsonb,
    CONSTRAINT workflow_action_pkey PRIMARY KEY (uuid)
);

CREATE TABLE public.workflow
(
    uuid uuid NOT NULL DEFAULT uuid_generate_v4(),
    name_key text unique,
    display text,
    current_state text,
    template_uuid uuid,
    contract_uuid uuid,
    description text,
    options jsonb,
    CONSTRAINT workflow_pkey PRIMARY KEY (uuid)
);



insert into public.workflow (name_key, display, current_state)
    values
('workflow001', 'deltaware-ct.009', 'PendingL1Approval'),
('workflow002', 'iWave-ct.8374', 'New');


insert into public.vendor (name_key, content) 
    values
('iwave-pei', '{
    "head": {
        "code": "iwave-pei",
        "display": "iWave",
        "registered-code": "VEN72398348",
        "address": "134 Kent St, Charlottetown",
        "postal-code": "PE C1A"
    }
}'),
('deltaware-pei', '{
    "head": {
        "code": "iwave-pei",
        "display": "The DeltaWare Division of MAXIMUS",
        "registered-code": "VEN95874000",
        "address": "176 Great George St, Charlottetown",
        "postal-code": "PE C1A 4K9"
    }
}'),
('upei', '{
    "head": {
        "code": "upei",
        "display": "University of PEI",
        "registered-code": "EDU737322",
        "address": "550 University Ave, Charlottetown",
        "postal-code": "PE C1A 4P3"
    }
}');




-- store all process states, dictionary-table
insert into public.process_state (name_key, content)
    values
('ContractCorrectedL100Issue', '{}'),
('ContractCorrectedL1Issue', '{}'),
('ContractCorrectedL2Issue', '{}'),
('ContractCorrectedL3Issue', '{}'),
('ContractCorrectedL4Issue', '{}'),
('ContractCorrectedL4IssueWithApproval', '{}'),
('ContractCorrectedL5Issue', '{}'),
('ContractCorrectedL5IssueWithApproval', '{}'),
('ContractPendingCorrection', '{}'),
('ContractPendingCorrectionL100Issue', '{}'),
('ContractPendingCorrectionL2Issue', '{}'),
('ContractPendingCorrectionL3Issue', '{}'),
('ContractPendingCorrectionL4Issue', '{}'),
('ContractPendingCorrectionL4IssueWithApproval', '{}'),
('ContractPendingCorrectionL5Issue', '{}'),
('ContractPendingCorrectionL5IssueWithApproval', '{}'),
('ContractPrepared', '{}'),
('ContractPreparing', '{}'),
('Finalized', '{}'),
('Finalizing', '{}'),
('Finished', '{}'),
('Level1Approved', '{}'),
('Level1Declined', '{}'),
('Level2Approved', '{}'),
('Level2Declined', '{}'),
('Level3Approved', '{}'),
('Level3Declined', '{}'),
('Level4Approved', '{}'),
('Level4Declined', '{}'),
('Level5Approved', '{}'),
('Level5Declined', '{}'),
('PartASigned', '{}'),
('PartBDeclined', '{}'),
('PartBSigned', '{}'),
('PendingL1Approval', '{}'),
('PendingL2Approval', '{}'),
('PendingL3Approval', '{}'),
('PendingL4Approval', '{}'),
('PendingL5Approval', '{}'),
('PendingPartASign', '{}'),
('PendingPartBSign', '{}'),
('PendingTemplateCorrectionFromPartA', '{}'),
('PendingTemplateCorrectionFromPartB', '{}'),
('PreparingPartASign', '{}'),
('PreparingPartBSign', '{}'),
('Start', '{}'),
('TemplateCorrectedForPartA', '{}'),
('TemplateCorrectedForPartB', '{}'),
('TemplateFixed', '{}'),
('TemplatePartAApproved', '{}'),
('TemplatePartADeclined', '{}'),
('TemplatePartBApproved', '{}'),
('TemplatePartBDeclined', '{}'),
('TemplatePendingAcceptanceByVendor', '{}'),
('TemplatePendingApprovalBySupervisor', '{}'),
('TemplatePrepared', '{}'),
('TemplatePreparing', '{}');




----new actions -> workflow action, no next auto action

insert into public.workflow_action (name_key, display, from_state, to_state, ui_actions, category, message)
    values
('start', 'Start', 'New', 'TemplatePreparing', 'workflow.start', 'Process.Workflow', 'Workflow started'),
('templatePrepare', 'Prepare Template', 'TemplatePreparing', 'TemplatePendingApprovalBySupervisor', 'template.cru', 'Process.Template.Prepare', 'Template was Prepared'),
('templatePartAApprove', 'Approve Template as Part A', 'TemplatePendingApprovalBySupervisor', 'TemplatePendingAcceptanceByVendor', 'template.approve', 'Process.Template.Prepare', 'Template has been Approved by PartA'),
('templatePartADecline', 'Decline Template as Part A', 'TemplatePendingApprovalBySupervisor', 'PendingTemplateCorrectionFromPartA', 'template.decline', 'Process.Template.Prepare', 'Template has been Declined by PartA, modification required'),
('templatePartBApprove', 'Approve Template as Part B', 'TemplatePendingAcceptanceByVendor', 'ContractPreparing', 'template.approve', 'Process.Template.Prepare', 'Template has been Approved by PartB and Template is Fixed'),
('templatePartBDecline', 'Decline Template as Part B', 'TemplatePendingAcceptanceByVendor', 'PendingTemplateCorrectionFromPartB', 'template.decline', 'Process.Template.Prepare', 'Template has been Declined by PartB, modification required'),
('templateCorrectionForPartA', 'Template Correction for Part A', 'PendingTemplateCorrectionFromPartA', 'TemplatePendingApprovalBySupervisor', 'template.ru', 'Process.Template.Prepare', 'Template issue was Corrected based on PartA requirement'),
('templateCorrectionForPartB', 'Template Correction for Part B', 'PendingTemplateCorrectionFromPartB', 'TemplatePendingAcceptanceByVendor', 'template.ru', 'Process.Template.Prepare', 'Template issue was Corrected based on PartB requirement'),
('contractPrepare', 'Prepare Contract', 'ContractPreparing', 'PendingL1Approval', 'contract.cru', 'Process.Contract.Prepare', 'Contract has been Prepared'),
('level1Approve', 'Approve as Level 1 staff', 'PendingL1Approval', 'PendingL2Approval', 'contract.approve', 'Process.Contract.Approval', 'Contract Level1 Approved'),
('level1Decline', 'Decline as Level 1 staff', 'PendingL1Approval', 'ContractPendingCorrectionL1Issue', 'contract.decline', 'Process.Contract.Approval', 'Contract Level1 Declined, modification required'),
('contractCorrectionL1', 'Contract Correction L1', 'ContractPendingCorrectionL1Issue', 'PendingL1Approval', 'contract.ru', 'Process.Contract.Prepare', 'Contract issue that reported from Level1 staff has been corrected'),
('level2Approve', 'Approve as Level 2 staff', 'PendingL2Approval', 'PendingL3Approval', 'contract.approve', 'Process.Contract.Approval', 'Contract Level2 Approved'),
('level2Decline', 'Decline as Level 2 staff', 'PendingL2Approval', 'ContractPendingCorrectionL2Issue', 'contract.decline', 'Process.Contract.Approval', 'Contract Level2 Declined, modification required'),
('contractCorrectionL2', 'Contract Correction L2', 'ContractPendingCorrectionL2Issue', 'PendingL1Approval', 'contract.ru', 'Process.Contract.Prepare', 'Contract issue that reported from Level2 staff has been corrected'),
('level3Approve', 'Approve as Level 3 staff', 'PendingL3Approval', 'PendingL4Approval', 'contract.approve', 'Process.Contract.Approval', 'Contract Level3 Approved'),
('level3Decline', 'Decline as Level 3 staff', 'PendingL3Approval', 'ContractPendingCorrectionL3Issue', 'contract.decline', 'Process.Contract.Approval', 'Contract Level3 Declined, modification required'),
('contractCorrectionL3', 'Contract Correction L3', 'ContractPendingCorrectionL3Issue', 'PendingL3Approval', 'contract.ru', 'Process.Contract.Prepare', 'Contract issue that reported from Level3 staff has been corrected'),
('level4Approve', 'Approve as Level 4 staff', 'PendingL4Approval', 'PendingL5Approval', 'contract.approve', 'Process.Contract.Approval', 'Contract Level4 Approved'),
('level4ApproveWithCondition', 'Conditional Approve as Level 4 staff', 'PendingL4Approval', 'ContractPendingCorrectionL4IssueWithApproval', 'contract.conditonalApprove', 'Process.Contract.Approval', 'Contract Level4 Approved, but with condition of correction'),
('level4Decline', 'Decline as Level 4 staff', 'PendingL4Approval', 'ContractPendingCorrectionL4Issue', 'contract.decline', 'Process.Contract.Approval', 'Contract Level4 Declined, modification required'),
('contractCorrectionL4', 'Contract Correction L4', 'ContractPendingCorrectionL4Issue', 'PendingL3Approval', 'contract.ru', 'Process.Contract.Prepare', 'Contract issue that reported from Level4 staff has been corrected'),
('contractCorrectionL4WithApproval', 'Contract Correction L4 Pre-Approved', 'ContractPendingCorrectionL4IssueWithApproval', 'PendingL5Approval', 'contract.ru', 'Process.Contract.Prepare', 'Contract pre-approved issue that reported from Level4 staff has been corrected'),
('level5Approve', 'Approve as Level 5 staff', 'PendingL5Approval', 'PendingPartBSign', 'contract.approve', 'Process.Contract.Approval', 'Contract Level5 Approved'),
('level5ApproveWithCondition', 'Conditional Approve as Level 5 staff', 'PendingL5Approval', 'ContractPendingCorrectionL5IssueWithApproval', 'contract.conditonalApprove', 'Process.Contract.Approval', 'Contract Level5 Approved, but with condition of correction'),
('level5Decline', 'Decline as Level 5 staff', 'PendingL5Approval', 'ContractPendingCorrectionL5Issue', 'contract.decline', 'Process.Contract.Approval', 'Contract Level5 Declined, modification required'),
('contractCorrectionL5', 'Contract Correction L5', 'ContractPendingCorrectionL5Issue', 'PendingL3Approval', 'contract.ru', 'Process.Contract.Prepare', 'Contract issue that reported from Level5 staff has been corrected'),
('contractCorrectionL5WithApproval', 'Contract Correction L5 Pre-Approved', 'ContractPendingCorrectionL5IssueWithApproval', 'PendingPartBSign', 'contract.ru', 'Process.Contract.Prepare', 'Contract pre-approved issue that reported from Level5 staff has been corrected'),
('partBSign', 'Sign Contract as Part B', 'PendingPartBSign', 'PendingPartASign', 'contract.sign', 'Process.Contract.Sign', 'PartB has been Signed'),
('partBSignDecline', 'Decline Sign Contract as Part B', 'PendingPartBSign', 'ContractPendingCorrectionL100Issue', 'contract.declineSign', 'Process.Contract.Sign', 'PartB has been Declined Sign, modification required'),
('contractCorrectionL100', 'Contract Correction for Part B', 'ContractPendingCorrectionL100Issue', 'PendingL3Approval', 'contract.ru', 'Process.Contract.Prepare', 'Contract issue that reported from Part-B staff has been corrected'),
('partASign', 'Sign Contract as Part A', 'PendingPartASign', 'Finalizing', 'contract.sign', 'Process.Contract.Sign', 'PartA has been Signed'),
('contractCorrectionSignPartA', 'Contract Correction for Part A', 'ContractPendingCorrectionSignIssueFromPartA', 'PendingL3Approval', 'contract.ru', 'Process.Contract.Prepare', 'Contract issue that reported from Part-A staff has been corrected'),
('partASignDecline', 'Decline Sign Contract as Part A', 'PendingPartASign', 'ContractPendingCorrectionSignIssueFromPartA', 'contract.declineSign', 'Process.Contract.Sign', 'PartA has been Declined Sign, modification required'),
('finalize', 'Finalize', 'Finalizing', 'Finished', 'contract.finalize', 'Process.Contract.Finalize', 'Finalized (backup...)');


--updated Aug.2


insert into public.workflow_action (name_key, display, from_state, to_state, ui_actions, category, message)
    values
('start', 'Start', 'New', 'TemplatePreparing', 'workflow.start', 'Process.Workflow', 'Workflow started'),
('templatePrepare', 'Prepare Template', 'TemplatePreparing', 'TemplatePendingApprovalBySupervisor', 'template.cru', 'Process.Template.Prepare', 'Template was Prepared'),
('templatePartAApprove', 'Approve Template as Part A', 'TemplatePendingApprovalBySupervisor', 'TemplatePendingAcceptanceByVendor', 'template.approve.a', 'Process.Template.Prepare', 'Template has been Approved by PartA'),
('templatePartADecline', 'Decline Template as Part A', 'TemplatePendingApprovalBySupervisor', 'PendingTemplateCorrectionFromPartA', 'template.decline.a', 'Process.Template.Prepare', 'Template has been Declined by PartA, modification required'),
('templatePartBApprove', 'Approve Template as Part B', 'TemplatePendingAcceptanceByVendor', 'ContractPreparing', 'template.approve.b', 'Process.Template.Prepare', 'Template has been Approved by PartB and Template is Fixed'),
('templatePartBDecline', 'Decline Template as Part B', 'TemplatePendingAcceptanceByVendor', 'PendingTemplateCorrectionFromPartB', 'template.decline.b', 'Process.Template.Prepare', 'Template has been Declined by PartB, modification required'),
('templateCorrectionForPartA', 'Template Correction for Part A', 'PendingTemplateCorrectionFromPartA', 'TemplatePendingApprovalBySupervisor', 'template.ru', 'Process.Template.Prepare', 'Template issue was Corrected based on PartA requirement'),
('templateCorrectionForPartB', 'Template Correction for Part B', 'PendingTemplateCorrectionFromPartB', 'TemplatePendingAcceptanceByVendor', 'template.ru', 'Process.Template.Prepare', 'Template issue was Corrected based on PartB requirement'),
('contractPrepare', 'Prepare Contract', 'ContractPreparing', 'PendingL1Approval', 'contract.cru', 'Process.Contract.Prepare', 'Contract has been Prepared'),
('level1Approve', 'Approve as Level 1 staff', 'PendingL1Approval', 'PendingL2Approval', 'contract.approve.level1', 'Process.Contract.Approval', 'Contract Level1 Approved'),
('level1Decline', 'Decline as Level 1 staff', 'PendingL1Approval', 'ContractPendingCorrectionL1Issue', 'contract.decline.level1', 'Process.Contract.Approval', 'Contract Level1 Declined, modification required'),
('contractCorrectionL1', 'Contract Correction L1', 'ContractPendingCorrectionL1Issue', 'PendingL1Approval', 'contract.ru', 'Process.Contract.Prepare', 'Contract issue that reported from Level1 staff has been corrected'),
('level2Approve', 'Approve as Level 2 staff', 'PendingL2Approval', 'PendingL3Approval', 'contract.approve.level2', 'Process.Contract.Approval', 'Contract Level2 Approved'),
('level2Decline', 'Decline as Level 2 staff', 'PendingL2Approval', 'ContractPendingCorrectionL2Issue', 'contract.decline.level2', 'Process.Contract.Approval', 'Contract Level2 Declined, modification required'),
('contractCorrectionL2', 'Contract Correction L2', 'ContractPendingCorrectionL2Issue', 'PendingL1Approval', 'contract.ru', 'Process.Contract.Prepare', 'Contract issue that reported from Level2 staff has been corrected'),
('level3Approve', 'Approve as Level 3 staff', 'PendingL3Approval', 'PendingL4Approval', 'contract.approve.level3', 'Process.Contract.Approval', 'Contract Level3 Approved'),
('level3Decline', 'Decline as Level 3 staff', 'PendingL3Approval', 'ContractPendingCorrectionL3Issue', 'contract.decline.level3', 'Process.Contract.Approval', 'Contract Level3 Declined, modification required'),
('contractCorrectionL3', 'Contract Correction L3', 'ContractPendingCorrectionL3Issue', 'PendingL3Approval', 'contract.ru', 'Process.Contract.Prepare', 'Contract issue that reported from Level3 staff has been corrected'),
('level4Approve', 'Approve as Level 4 staff', 'PendingL4Approval', 'PendingL5Approval', 'contract.approve.level4', 'Process.Contract.Approval', 'Contract Level4 Approved'),
('level4ApproveWithCondition', 'Conditional Approve as Level 4 staff', 'PendingL4Approval', 'ContractPendingCorrectionL4IssueWithApproval', 'contract.conditonalApprove.level4', 'Process.Contract.Approval', 'Contract Level4 Approved, but with condition of correction'),
('level4Decline', 'Decline as Level 4 staff', 'PendingL4Approval', 'ContractPendingCorrectionL4Issue', 'contract.decline.level4', 'Process.Contract.Approval', 'Contract Level4 Declined, modification required'),
('contractCorrectionL4', 'Contract Correction L4', 'ContractPendingCorrectionL4Issue', 'PendingL3Approval', 'contract.ru', 'Process.Contract.Prepare', 'Contract issue that reported from Level4 staff has been corrected'),
('contractCorrectionL4WithApproval', 'Contract Correction L4 Pre-Approved', 'ContractPendingCorrectionL4IssueWithApproval', 'PendingL5Approval', 'contract.ru', 'Process.Contract.Prepare', 'Contract pre-approved issue that reported from Level4 staff has been corrected'),
('level5Approve', 'Approve as Level 5 staff', 'PendingL5Approval', 'PendingPartBSign', 'contract.approve.level5', 'Process.Contract.Approval', 'Contract Level5 Approved'),
('level5ApproveWithCondition', 'Conditional Approve as Level 5 staff', 'PendingL5Approval', 'ContractPendingCorrectionL5IssueWithApproval', 'contract.conditonalApprove.level5', 'Process.Contract.Approval', 'Contract Level5 Approved, but with condition of correction'),
('level5Decline', 'Decline as Level 5 staff', 'PendingL5Approval', 'ContractPendingCorrectionL5Issue', 'contract.decline.level5', 'Process.Contract.Approval', 'Contract Level5 Declined, modification required'),
('contractCorrectionL5', 'Contract Correction L5', 'ContractPendingCorrectionL5Issue', 'PendingL3Approval', 'contract.ru', 'Process.Contract.Prepare', 'Contract issue that reported from Level5 staff has been corrected'),
('contractCorrectionL5WithApproval', 'Contract Correction L5 Pre-Approved', 'ContractPendingCorrectionL5IssueWithApproval', 'PendingPartBSign', 'contract.ru', 'Process.Contract.Prepare', 'Contract pre-approved issue that reported from Level5 staff has been corrected'),
('partBSign', 'Sign Contract as Part B', 'PendingPartBSign', 'PendingPartASign', 'contract.sign.b', 'Process.Contract.Sign', 'PartB has been Signed'),
('partBSignDecline', 'Decline Sign Contract as Part B', 'PendingPartBSign', 'ContractPendingCorrectionL100Issue', 'contract.declineSign.b', 'Process.Contract.Sign', 'PartB has been Declined Sign, modification required'),
('contractCorrectionL100', 'Contract Correction for Part B', 'ContractPendingCorrectionL100Issue', 'PendingL3Approval', 'contract.ru', 'Process.Contract.Prepare', 'Contract issue that reported from Part-B staff has been corrected'),
('partASign', 'Sign Contract as Part A', 'PendingPartASign', 'Finalizing', 'contract.sign.a', 'Process.Contract.Sign', 'PartA has been Signed'),
('contractCorrectionSignPartA', 'Contract Correction for Part A', 'ContractPendingCorrectionSignIssueFromPartA', 'PendingL3Approval', 'contract.ru', 'Process.Contract.Prepare', 'Contract issue that reported from Part-A staff has been corrected'),
('partASignDecline', 'Decline Sign Contract as Part A', 'PendingPartASign', 'ContractPendingCorrectionSignIssueFromPartA', 'contract.declineSign.a', 'Process.Contract.Sign', 'PartA has been Declined Sign, modification required'),
('finalize', 'Finalize', 'Finalizing', 'Finished', 'contract.finalize', 'Process.Contract.Finalize', 'Finalized (backup...)');



----temp table, for transitions

insert into public.t_transitions (action_name, from_state, to_state, method)
    values
('contractCorrectionL1','ContractPendingCorrection','ContractCorrectedL1Issue','onContractCorrectionL1'),
('contractCorrectionL100','ContractPendingCorrectionL100Issue','ContractCorrectedL100Issue','onContractCorrectionL100'),
('contractCorrectionL2','ContractPendingCorrectionL2Issue','ContractCorrectedL2Issue','onContractCorrectionL2'),
('contractCorrectionL3','ContractPendingCorrectionL3Issue','ContractCorrectedL3Issue','onContractCorrectionL3'),
('contractCorrectionL4','ContractPendingCorrectionL4Issue','ContractCorrectedL4Issue','onContractCorrectionL4'),
('contractCorrectionL4WithApproval','ContractPendingCorrectionL4IssueWithApproval','ContractCorrectedL4IssueWithApproval','onContractCorrectionL4WithApproval'),
('contractCorrectionL5','ContractPendingCorrectionL5Issue','ContractCorrectedL5Issue','onContractCorrectionL5'),
('contractCorrectionL5WithApproval','ContractPendingCorrectionL5IssueWithApproval','ContractCorrectedL5IssueWithApproval','onContractCorrectionL5WithApproval'),
('contractPrepare','ContractPreparing','ContractPrepared','onContractPrepare'),
('finalize','Finalizing','Finalized','onFinalize'),
('level1Approve','PendingL1Approval','Level1Approved','onLevel1Approve'),
('level1Decline','PendingL1Approval','Level1Declined','onLevel1Decline'),
('level2Approve','PendingL2Approval','Level2Approved','onLevel2Approve'),
('level2Decline','PendingL2Approval','Level2Declined','onLevel2Decline'),
('level3Approve','PendingL3Approval','Level3Approved','onLevel3Approve'),
('level3Decline','PendingL3Approval','Level3Declined','onLevel3Decline'),
('level4Approve','PendingL4Approval','Level4Approved','onLevel4Approve'),
('level4ApproveWithCondition','PendingL4Approval','ContractPendingCorrectionL4IssueWithApproval','onLevel4ApproveWithCondition'),
('level4Decline','PendingL4Approval','Level4Declined','onLevel4Decline'),
('level5Approve','PendingL5Approval','Level5Approved','onLevel5Approve'),
('level5ApproveWithCondition','PendingL5Approval','ContractPendingCorrectionL5IssueWithApproval','onLevel5ApproveWithCondition'),
('level5Decline','PendingL5Approval','Level5Declined','onLevel5Decline'),
('partASign','PendingPartASign','PartASigned','onPartASign'),
('partBSign','PendingPartBSign','PartBSigned','onPartBSign'),
('partBSignDecline','PendingPartBSign','PartBDeclined','onPartBSignDecline'),
('preparePartASign','PreparingPartASign','PendingPartASign','onPreparePartASign'),
('preparePartBSign','PreparingPartBSign','PendingPartBSign','onPreparePartBSign'),
('templateCorrectionForPartA','PendingTemplateCorrectionFromPartA','TemplateCorrectedForPartA','onTemplateCorrectionForPartA'),
('templateCorrectionForPartB','PendingTemplateCorrectionFromPartB','TemplateCorrectedForPartB','onTemplateCorrectionForPartB'),
('templatePartAApprove','TemplatePendingApprovalBySupervisor','TemplatePartAApproved','onTemplatePartAApprove'),
('templatePartADecline','TemplatePendingApprovalBySupervisor','TemplatePartADeclined','onTemplatePartADecline'),
('templatePartBApprove','TemplatePendingAcceptanceByVendor','TemplatePartBApproved','onTemplatePartBApprove'),
('templatePartBDecline','TemplatePendingAcceptanceByVendor','TemplatePartBDeclined','onTemplatePartBDecline'),
('templatePrepare','TemplatePreparing','TemplatePrepared','onTemplatePrepare'),
('next','Start','TemplatePreparing','onNext'),
('next','TemplatePrepared','TemplatePendingApprovalBySupervisor','onNext'),
('next','TemplatePartADeclined','PendingTemplateCorrectionFromPartA','onNext'),
('next','TemplateCorrectedForPartA','TemplatePendingApprovalBySupervisor','onNext'),
('next','TemplatePartAApproved','TemplatePendingAcceptanceByVendor','onNext'),
('next','TemplatePartBDeclined','PendingTemplateCorrectionFromPartB','onNext'),
('next','TemplateCorrectedForPartB','TemplatePendingAcceptanceByVendor','onNext'),
('next','TemplatePartBApproved','TemplateFixed','onNext'),
('next','TemplateFixed','ContractPreparing','onNext'),
('next','ContractPrepared','PendingL1Approval','onNext'),
('next','Level1Declined','ContractPendingCorrection','onNext'),
('next','ContractCorrectedL1Issue','PendingL1Approval','onNext'),
('next','Level1Approved','PendingL2Approval','onNext'),
('next','Level2Declined','ContractPendingCorrectionL2Issue','onNext'),
('next','ContractCorrectedL2Issue','PendingL1Approval','onNext'),
('next','Level2Approved','PendingL3Approval','onNext'),
('next','Level3Declined','ContractPendingCorrectionL3Issue','onNext'),
('next','ContractCorrectedL3Issue','PendingL3Approval','onNext'),
('next','Level3Approved','PendingL4Approval','onNext'),
('next','ContractCorrectedL4IssueWithApproval','PendingL5Approval','onNext'),
('next','Level4Declined','ContractPendingCorrectionL4Issue','onNext'),
('next','ContractCorrectedL4Issue','PendingL3Approval','onNext'),
('next','Level4Approved','PendingL5Approval','onNext'),
('next','ContractCorrectedL5IssueWithApproval','PreparingPartBSign','onNext'),
('next','Level5Declined','ContractPendingCorrectionL5Issue','onNext'),
('next','ContractCorrectedL5Issue','PendingL3Approval','onNext'),
('next','Level5Approved','PreparingPartBSign','onNext'),
('next','PartBDeclined','ContractPendingCorrectionL100Issue','onNext'),
('next','ContractCorrectedL100Issue','PendingL3Approval','onNext'),
('next','PartBSigned','PreparingPartASign','onNext'),
('next','PartASigned','Finalizing','onNext'),
('next','Finalized','Finished','onNext');








-------new--06.26.2019--
insert into public.process_action (name_key, content)
    values
('contractCorrectionL1','{"head": { "code": "contractCorrectionL1", "display": "Contract Correction L1", "relations": [{ "from": "ContractPendingCorrection", "to": "ContractCorrectedL1Issue"}], "ui_actions": ["contract.ru"], "category": "Process.Contract.Prepare", "version": "1.0.0"}}'),
('contractCorrectionL100','{"head": { "code": "contractCorrectionL100", "display": "Contract Correction for Part B", "relations": [{ "from": "ContractPendingCorrectionL100Issue", "to": "ContractCorrectedL100Issue"}], "ui_actions": ["contract.ru"], "category": "Process.Contract.Prepare", "version": "1.0.0"}}'),
('contractCorrectionL2','{"head": { "code": "contractCorrectionL2", "display": "Contract Correction L2", "relations": [{ "from": "ContractPendingCorrectionL2Issue", "to": "ContractCorrectedL2Issue"}], "ui_actions": ["contract.ru"], "category": "Process.Contract.Prepare", "version": "1.0.0"}}'),
('contractCorrectionL3','{"head": { "code": "contractCorrectionL3", "display": "Contract Correction L3", "relations": [{ "from": "ContractPendingCorrectionL3Issue", "to": "ContractCorrectedL3Issue"}], "ui_actions": ["contract.ru"], "category": "Process.Contract.Prepare", "version": "1.0.0"}}'),
('contractCorrectionL4','{"head": { "code": "contractCorrectionL4", "display": "Contract Correction L4", "relations": [{ "from": "ContractPendingCorrectionL4Issue", "to": "ContractCorrectedL4Issue"}], "ui_actions": ["contract.ru"], "category": "Process.Contract.Prepare", "version": "1.0.0"}}'),
('contractCorrectionL4WithApproval','{"head": { "code": "contractCorrectionL4WithApproval", "display": "Contract Correction L4 Pre-Approved", "relations": [{ "from": "ContractPendingCorrectionL4IssueWithApproval", "to": "ContractCorrectedL4IssueWithApproval"}], "ui_actions": ["contract.ru"], "category": "Process.Contract.Prepare", "version": "1.0.0"}}'),
('contractCorrectionL5','{"head": { "code": "contractCorrectionL5", "display": "Contract Correction L5", "relations": [{ "from": "ContractPendingCorrectionL5Issue", "to": "ContractCorrectedL5Issue"}], "ui_actions": ["contract.ru"], "category": "Process.Contract.Prepare", "version": "1.0.0"}}'),
('contractCorrectionL5WithApproval','{"head": { "code": "contractCorrectionL5WithApproval", "display": "Contract Correction L5 Pre-Approved", "relations": [{ "from": "ContractPendingCorrectionL5IssueWithApproval", "to": "ContractCorrectedL5IssueWithApproval"}], "ui_actions": ["contract.ru"], "category": "Process.Contract.Prepare", "version": "1.0.0"}}'),
('contractPrepare','{"head": { "code": "contractPrepare", "display": "Prepare Contract", "relations": [{ "from": "ContractPreparing", "to": "ContractPrepared"}], "ui_actions": ["contract.cru"], "category": "Process.Contract.Prepare", "version": "1.0.0"}}'),
('finalize','{"head": { "code": "finalize", "display": "Finalize", "relations": [{ "from": "Finalizing", "to": "Finalized"}], "ui_actions": ["contract.finalize"], "category": "Process.Contract.Finalize", "version": "1.0.0"}}'),
('level1Approve','{"head": { "code": "level1Approve", "display": "Approve as Level 1 staff", "relations": [{ "from": "PendingL1Approval", "to": "Level1Approved"}], "ui_actions": ["contract.approve"], "category": "Process.Contract.Approval", "version": "1.0.0"}}'),
('level1Decline','{"head": { "code": "level1Decline", "display": "Decline as Level 1 staff", "relations": [{ "from": "PendingL1Approval", "to": "Level1Declined"}], "ui_actions": ["contract.decline"], "category": "Process.Contract.Approval", "version": "1.0.0"}}'),
('level2Approve','{"head": { "code": "level2Approve", "display": "Approve as Level 2 staff", "relations": [{ "from": "PendingL2Approval", "to": "Level2Approved"}], "ui_actions": ["contract.approve"], "category": "Process.Contract.Approval", "version": "1.0.0"}}'),
('level2Decline','{"head": { "code": "level2Decline", "display": "Decline as Level 2 staff", "relations": [{ "from": "PendingL2Approval", "to": "Level2Declined"}], "ui_actions": ["contract.decline"], "category": "Process.Contract.Approval", "version": "1.0.0"}}'),
('level3Approve','{"head": { "code": "level3Approve", "display": "Approve as Level 3 staff", "relations": [{ "from": "PendingL3Approval", "to": "Level3Approved"}], "ui_actions": ["contract.approve"], "category": "Process.Contract.Approval", "version": "1.0.0"}}'),
('level3Decline','{"head": { "code": "level3Decline", "display": "Decline as Level 3 staff", "relations": [{ "from": "PendingL3Approval", "to": "Level3Declined"}], "ui_actions": ["contract.decline"], "category": "Process.Contract.Approval", "version": "1.0.0"}}'),
('level4Approve','{"head": { "code": "level4Approve", "display": "Approve as Level 4 staff", "relations": [{ "from": "PendingL4Approval", "to": "Level4Approved"}], "ui_actions": ["contract.approve"], "category": "Process.Contract.Approval", "version": "1.0.0"}}'),
('level4ApproveWithCondition','{"head": { "code": "level4ApproveWithCondition", "display": "Conditional Approve as Level 4 staff", "relations": [{ "from": "PendingL4Approval", "to": "ContractPendingCorrectionL4IssueWithApproval"}], "ui_actions": ["contract.conditonalApprove"], "category": "Process.Contract.Approval", "version": "1.0.0"}}'),
('level4Decline','{"head": { "code": "level4Decline", "display": "Decline as Level 4 staff", "relations": [{ "from": "PendingL4Approval", "to": "Level4Declined"}], "ui_actions": ["contract.decline"], "category": "Process.Contract.Approval", "version": "1.0.0"}}'),
('level5Approve','{"head": { "code": "level5Approve", "display": "Approve as Level 5 staff", "relations": [{ "from": "PendingL5Approval", "to": "Level5Approved"}], "ui_actions": ["contract.approve"], "category": "Process.Contract.Approval", "version": "1.0.0"}}'),
('level5ApproveWithCondition','{"head": { "code": "level5ApproveWithCondition", "display": "Conditional Approve as Level 5 staff", "relations": [{ "from": "PendingL5Approval", "to": "ContractPendingCorrectionL5IssueWithApproval"}], "ui_actions": ["contract.conditonalApprove"], "category": "Process.Contract.Approval", "version": "1.0.0"}}'),
('level5Decline','{"head": { "code": "level5Decline", "display": "Decline as Level 5 staff", "relations": [{ "from": "PendingL5Approval", "to": "Level5Declined"}], "ui_actions": ["contract.decline"], "category": "Process.Contract.Approval", "version": "1.0.0"}}'),
('partASign','{"head": { "code": "partASign", "display": "Sign Contract as Part A", "relations": [{ "from": "PendingPartASign", "to": "PartASigned"}], "ui_actions": ["contract.sign"], "category": "Process.Contract.Sign", "version": "1.0.0"}}'),
('partBSign','{"head": { "code": "partBSign", "display": "Sign Contract as Part B", "relations": [{ "from": "PendingPartBSign", "to": "PartBSigned"}], "ui_actions": ["contract.sign"], "category": "Process.Contract.Sign", "version": "1.0.0"}}'),
('partBSignDecline','{"head": { "code": "partBSignDecline", "display": "Decline Sign Contract as Part B", "relations": [{ "from": "PendingPartBSign", "to": "PartBDeclined"}], "ui_actions": ["contract.declineSign"], "category": "Process.Contract.Sign", "version": "1.0.0"}}'),
('preparePartASign','{"head": { "code": "preparePartASign", "display": "Prepare Part A Sign", "relations": [{ "from": "PreparingPartASign", "to": "PendingPartASign"}], "ui_actions": ["contract.prepareSign"], "category": "Process.Contract.Sign", "version": "1.0.0"}}'),
('preparePartBSign','{"head": { "code": "preparePartBSign", "display": "Prepare Part B Sign", "relations": [{ "from": "PreparingPartBSign", "to": "PendingPartBSign"}], "ui_actions": ["contract.prepareSign"], "category": "Process.Contract.Sign", "version": "1.0.0"}}'),
('templateCorrectionForPartA','{"head": { "code": "templateCorrectionForPartA", "display": "Template Correction for Part A", "relations": [{ "from": "PendingTemplateCorrectionFromPartA", "to": "TemplateCorrectedForPartA"}], "ui_actions": ["template.ru"], "category": "Process.Template.Prepare", "version": "1.0.0"}}'),
('templateCorrectionForPartB','{"head": { "code": "templateCorrectionForPartB", "display": "Template Correction for Part B", "relations": [{ "from": "PendingTemplateCorrectionFromPartB", "to": "TemplateCorrectedForPartB"}], "ui_actions": ["template.ru"], "category": "Process.Template.Prepare", "version": "1.0.0"}}'),
('templatePartAApprove','{"head": { "code": "templatePartAApprove", "display": "Approve Template as Part A", "relations": [{ "from": "TemplatePendingApprovalBySupervisor", "to": "TemplatePartAApproved"}], "ui_actions": ["template.approve"], "category": "Process.Template.Prepare", "version": "1.0.0"}}'),
('templatePartADecline','{"head": { "code": "templatePartADecline", "display": "Decline Template as Part A", "relations": [{ "from": "TemplatePendingApprovalBySupervisor", "to": "TemplatePartADeclined"}], "ui_actions": ["template.decline"], "category": "Process.Template.Prepare", "version": "1.0.0"}}'),
('templatePartBApprove','{"head": { "code": "templatePartBApprove", "display": "Approve Template as Part B", "relations": [{ "from": "TemplatePendingAcceptanceByVendor", "to": "TemplatePartBApproved"}], "ui_actions": ["template.approve"], "category": "Process.Template.Prepare", "version": "1.0.0"}}'),
('templatePartBDecline','{"head": { "code": "templatePartBDecline", "display": "Decline Template as Part B", "relations": [{ "from": "TemplatePendingAcceptanceByVendor", "to": "TemplatePartBDeclined"}], "ui_actions": ["template.decline"], "category": "Process.Template.Prepare", "version": "1.0.0"}}'),
('templatePrepare','{"head": { "code": "templatePrepare", "display": "Prepare Template", "relations": [{ "from": "TemplatePreparing", "to": "TemplatePrepared"}], "ui_actions": ["template.cru"], "category": "Process.Template.Prepare", "version": "1.0.0"}}'),
('next', '{"head": { "code": "next", "display": "next","relations": [
    { "from": "Start", "to": "TemplatePreparing"},
    { "from": "TemplatePrepared", "to": "TemplatePendingApprovalBySupervisor"},
    { "from": "TemplatePartADeclined", "to": "PendingTemplateCorrectionFromPartA"},
    { "from": "TemplateCorrectedForPartA", "to": "TemplatePendingApprovalBySupervisor"},
    { "from": "TemplatePartAApproved", "to": "TemplatePendingAcceptanceByVendor"},
    { "from": "TemplatePartBDeclined", "to": "PendingTemplateCorrectionFromPartB"},
    { "from": "TemplateCorrectedForPartB", "to": "TemplatePendingAcceptanceByVendor"},
    { "from": "TemplatePartBApproved", "to": "TemplateFixed"},
    { "from": "TemplateFixed", "to": "ContractPreparing"},
    { "from": "ContractPrepared", "to": "PendingL1Approval"},
    { "from": "Level1Declined", "to": "ContractPendingCorrection"},
    { "from": "ContractCorrectedL1Issue", "to": "PendingL1Approval"},
    { "from": "Level1Approved", "to": "PendingL2Approval"},
    { "from": "Level2Declined", "to": "ContractPendingCorrectionL2Issue"},
    { "from": "ContractCorrectedL2Issue", "to": "PendingL1Approval"},
    { "from": "Level2Approved", "to": "PendingL3Approval"},
    { "from": "Level3Declined", "to": "ContractPendingCorrectionL3Issue"},
    { "from": "ContractCorrectedL3Issue", "to": "PendingL3Approval"},
    { "from": "Level3Approved", "to": "PendingL4Approval"},
    { "from": "ContractCorrectedL4IssueWithApproval", "to": "PendingL5Approval"},
    { "from": "Level4Declined", "to": "ContractPendingCorrectionL4Issue"},
    { "from": "ContractCorrectedL4Issue", "to": "PendingL3Approval"},
    { "from": "Level4Approved", "to": "PendingL5Approval"},
    { "from": "ContractCorrectedL5IssueWithApproval", "to": "PreparingPartBSign"},
    { "from": "Level5Declined", "to": "ContractPendingCorrectionL5Issue"},
    { "from": "ContractCorrectedL5Issue", "to": "PendingL3Approval"},
    { "from": "Level5Approved", "to": "PreparingPartBSign"},
    { "from": "PartBDeclined", "to": "ContractPendingCorrectionL100Issue"},
    { "from": "ContractCorrectedL100Issue", "to": "PendingL3Approval"},
    { "from": "PartBSigned", "to": "PreparingPartASign"},
    { "from": "PartASigned", "to": "Finalizing"},
    { "from": "Finalized", "to": "Finished"}
]}}');








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





--insert vendor into codetable




insert into public.codetable (name_key, content)
    values('vendor',
	'{
        "head": {
            "code": "vendor",
            "display": "Vender List",
            "expire-date": ""
        },
        "body": [
                    {
                        "code": "iwave-pei",
                        "address": "134 Kent St, Charlottetown",
                        "display": "iWave",
                        "postal-code": "PE C1A",
                        "registered-code": "VEN72398348"
                    },
                    {
                        "code": "deltaware-pei",
                        "address": "176 Great George St, Charlottetown",
                        "display": "The DeltaWare Division of MAXIMUS",
                        "postal-code": "PE C1A 4K9",
                        "registered-code": "VEN95874000"
                    },
                    {
                        "code": "upei",
                        "address": "550 University Ave, Charlottetown",
                        "display": "University of PEI",
                        "postal-code": "PE C1A 4P3",
                        "registered-code": "EDU737322"
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


insert into public.contract_template (name_key, content)  
    values
('default-contract-template-itss', '{
    "body": {
        "header": [
            {
                "field": "THIS AGREEMENT made this ${made-date::calander::dateformat1}"
            },
            {
                "field": "BETWEEN: GOVERNMENT OF PRINCE EDWARD ISLAND, as represented by the Minister of ${minister-partA::textinput::Type here},"
            },
            {
                "field": "(hereinafter referred to as \"Government\")"
            },
            {
                "field": "OF THE PART A;###right####"
            },
            {
                "field": "AND: ${partB-department::textinput::Type Here}"
            },
            {
                "field": "of ${partB-company::dropdownlist::VVV:codetable:vendor}"
            },
            {
                "field": "in ${partB-county::textinput::Type Here} County,  Province of ${partB-province::dropdownlist::VVV:codetable:province},"
            },
            {
                "field": "(hereinafter referred to as the \"Contractor\")"
            },
            {
                "field": "OF THE PART B###right####"
            },
            {
                "field": "WHEREAS Government wishes to engage the services of the Contractor to carry out the services described in Schedule \"A\" attached hereto;"
            },
            {
                "field": "AND WHEREAS the Contractor has agreed to provide Government with these services on certain terms and conditions as more particularly set out in this Agreement;"
            },
            {
                "field": "NOW THEREFORE in consideration of the mutual promises contained in this Agreement, the Parties agree that the terms and conditions of their relationship are as follows:"
            }
        ],
        "payments": [
            {
                "title": "Payments, Records and Accounts"
            },
            {
                "field": "Government shall make payments to the Contractor in the following manner:"
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
        "definitions": {
            "list": "agreement;contractor;fiscal_year;government;parties",
            "title": "Definitions",
            "sub_title": "In this Agreement, the following definitions apply:"
        },
        "convenants-contractor": [
            {
                "title": "Covenants of the Contractor and Government"
            },
            {
                "field": "The Contractor shall perform the services, assume all those responsibilities and diligently execute all those duties described in the attached Schedule \"A\" (the \"Work\"), in a manner satisfactory to Government."
            },
            {
                "field": "(a) Subject to the termination clause contained in the Termination section of this Agreement, the term of this Agreement shall commence on ${commence-start-date::calander::dateformat1}, and end on ${commence-end-date::calander::dateformat1} (the \"Term\")."
            },
            {
                "field": "(b) Subject to the termination clause contained in the Termination section of this Agreement and notwithstanding the date of signing of this Agreement, it is acknowledged by both Parties that the Contractor commenced the performance of the Work on ${agreenment-date::calander::dateformat1}. It is further agreed that the amount of $ ${maximum-total-amount::textinput::Type here} is the maximum amount to be paid for the Work and includes all amounts which may be owed for the Work done since ${work-start-date::calander::dateformat1}."
            }
        ],
        "conditions-of-agreement": {}
    },
    "head": {
        "id": "default-contract-template-itss",
        "code": "default-contract-template-itss",
        "title": "Default ITSS Contract Template",
        "version": "1.0"
    }
}'),
('previous-process-control-sheet', '{
    "body": {
        "header": [
            {
                "code": "contract-title",
                "field": "TITLE OF THE CONTRACT: ${contract-title::textinput::Type Here. Provide a descriptive title and ensure it matches the title on the contract document}"
            },
            {
                "code": "vender-name",
                "field": "VENDOR NAME: ${vendor-name::dropdownlist::VVV:codetable:vendor}",
                "requirement": "${verified::checkbox}I verified that the vendor is registered to do business on PEI (Registry${registry-link::link::https://www.princeedwardisland.ca/en})"
            },
            {
                "code": "start-end-date",
                "field": "START DATE: ${start-date::calander::Type Here}  END DATE: ${start-date::calander::Type Here}"
            },
            {
                "code": "contract-summary",
                "field": "CONTRACT SUMMARY: ${contract-summary::textarea::The summary is meant to be a description, in layman’s terms, of what the vendor will provide to government within this contract. It is intended to brief executive leadership about the contract. It should be summarized in 3-4 sentences.}"
            },
            {
                "code": "contract-type",
                "field": "CONTRACT TYPE: ${contract-type::dropdownlist::VVV:codetable:contract_type}"
            },
            {
                "code": "amendment-no",
                "field": "Amendment No: ${amendment-no::textinput::Type here}"
            },
            {
                "code": "contract-value",
                "field": "TOTAL CONTRACT VALUE: $ ${totalvalue::textinput::Type here}",
                "requirement": "Value/Year (if multi-year, add as needed): 2018-2019: $ ${value-20182019::textinput::Type here} 2019-2020: $ ${value-20192020::textinput::Type here} 2020-2021: $ ${value-20202021::textinput::Type here}"
            },
            {
                "code": "history-contract-value",
                "field": "HISTORICAL CONTRACT VALUE",
                "requirement": "Add Previous Years if same scope of work: 2016-2017: $ ${value-20162017::textinput::Type here} 2017-2018: $ ${value-20172018::textinput::Type here}"
            },
            {
                "code": "associated-tb-ec",
                "field": "List associated TB/EC decision#, if applicable ${associated-tb-ec::textinput::Type here}"
            },
            {
                "code": "contract-notes",
                "field": "CONTRACT NOTES: ${contract-notes::textarea::Type here  If there are any notes to be highlighted regarding increases in costs, or other relevant notes – please add that detail here}"
            },
            {
                "code": "vender-selected-by",
                "field": "Vendor Selected by: ${vender-selected-by::dropdownlist::VVV:codetable:vender_selected_by}"
            },
            {
                "code": "background-documentation",
                "field": "Background Documentation: ${background-doc::checkbox::Used standard template with no changes, Legal Review Notes Attached, Risk Review Notes Attached, The Contract Review Checklist was completed and is included in the contract package (available on Alfresco)}"
            },
            {
                "code": "contract-management-items",
                "field": "Ongoing Follow-up Required: ${ongoing-required::textarea::Identify any conditions in the contract ie reporting dates, multiple payment dates, or credit reviews that needs to be reviewing during the life of the contract}",
                "requirement": "Option to Extend:  ${option-extend::textarea::Identify any option to extend the contract and provide a note on extension details}"
            },
            {
                "code": "contract-management-items",
                "field": "BUDGET SECTION CODES: ${budegt-section::textarea::Section} ${budegt-object::textarea::Object} ${budegt-program::textarea::Program} ${budegt-project::textarea::Project} ${budegt-contract-no::textarea::Contract #} ",
                "notes": "Authors should confirm budget codes with Manager/Director Contract# is provided by SCC and is required to be referenced in the SOW"
            }
        ]
    },
    "head": {
        "id": "previous-process-control-sheet",
        "code": "previous-process-control-sheet",
        "title": "Previous Process Control Sheet",
        "version": "1.0"
    }
}');