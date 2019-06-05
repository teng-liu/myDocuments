
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