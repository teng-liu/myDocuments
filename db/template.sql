





insert into public.contract_template (name_key, content)  
    values ('NO44444_dropdownbox', '{
    "head": {
        "id": "default-contract-template-itss",
        "code": "default-contract-template-itss",
        "title": "Default ITSS Contract Template",
        "version": "1.0"
    },
    "body": {
        "header": [
            {"field": "in ${partB-county::textinput::Type Here} County,  Province of ${partB-province::dropdownlist::VVV:codetable:province},"},
            {"field": "(hereinafter referred to as the \"Contractor\")"},
            {"field": "OF THE PART B"}
            ],
        "definitions": {},
        "convenants-contractor": {},
        "payments": [],
        "conditions-of-agreement": {}
    }

}');




-----------------------------


insert into public.contract_template (name_key, content)  
    values ('NO33333', '{
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
            {"field": "OF THE PART A;"},
            {"field": "AND: ${partB-department::textinput::Type Here}"},
            {"field": "of ${partB-company::textinput::Type Here}"},
            {"field": "in ${partB-county::textinput::Type Here} County,  Province of ${partB-province::dropdownlist::VVV:codetable:province},"},
            {"field": "(hereinafter referred to as the \"Contractor\")"},
            {"field": "OF THE PART B"},
            {"field": "WHEREAS Government wishes to engage the services of the Contractor to carry out the services described in Schedule \"A\" attached hereto;"},
            {"field": "AND WHEREAS the Contractor has agreed to provide Government with these services on certain terms and conditions as more particularly set out in this Agreement;"},
            {"field": "NOW THEREFORE in consideration of the mutual promises contained in this Agreement, the Parties agree that the terms and conditions of their relationship are as follows:"}
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
                "field": "(a) Payment for the Work shall be at the rate of $ ${rate-per-hour::textinput::Type here} per hour, excluding taxes, but in no case shall the total payment exceed $ ${total-no-exceed::textinput::Type here}"
            },
            {
                "field": "OR"
            },
            {
                "field": "(a) Payment for the Work shall be a lump sum of $ ${lump-sum::textinput::Type here} , excluding taxes, payable on the ${lump-paydate::calander::Type here}"
            },
            {
                "field": "OR"
            },
            {
                "field": "(a) Payment for the work  shall  be  by installments  of $ ${rate-per-hour::textinput::Type here}, excluding taxes, payable as follows [ie. List dates (milestones) when payments will be made including amount to be paid on each date]"
            },
            {
                "field": "AND, IF APPLICABLE"
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
                "field": "OR"
            },
            {
                "field": "(d) All payments are subject to a hold back of an amount equal to ${percentage_bill_on_finalReport::textinput::Type here}% of the amount billed.  The hold back shall be paid upon the submission and acceptance of the final report and completion of the work."
            }
        ],
        "conditions-of-agreement": {}
    }

}');







--------------------------------------





insert into public.contract_template (name_key, content)  
    values ('Approval-Template-NO23', '
{
    "head": {
        "id": "contract-template-itss",
        "code": "contract-template-itss",
        "title": "Default Contract Template",
        "version": "1.0"
    },
    "body": {
        "header": [
            {
                "code": "contract-title",
                "field": "TITLE OF THE CONTRACT: ${contract-title::textinput::Type Here. Provide a descriptive title and ensure it matches the title on the contract document}"
            },
            {
                "code": "vender-name",
                "field": "VENDOR NAME: ${vendor-name::textinput::Type here}",
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
                "field": "CONTRACT TYPE: ${contract-type::singleselection::Professional Services,Maintenance/Service Support,Standing Offer Contract}"
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
                "field": "Vendor Selected by: ${vender-selected-by::singleselection::Competitive Process, Sole Source, Three Quotes Received}"
            },
            {
                "code": "background-documentation",
                "field": "Background Documentation: ${background-doc::multipleselection::Used standard template with no changes, Legal Review Notes Attached, Risk Review Notes Attached, The Contract Review Checklist was completed and is included in the contract package (available on Alfresco)}"
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
} }

');



