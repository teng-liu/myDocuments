### Template

~~~json
{
    "head":{
        "code": "contract-control-approval-itss",
        "title":"IT SHARED SERVICES CONTRACT/AGREEMENT APPROVAL",
        "version":"1.0.0"
    },
    "body":{
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
                        "field": "START DATE: $[start-date::calander::Type Here]  END DATE: $[end-date::calander::Type Here]"
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
                        "code": "budget-section-codes",
                        "field": "BUDGET SECTION CODES: Section: $[budegt-section::textarea::Section] Object: $[budegt-object::textarea::Object] Program: $[budegt-program::textarea::Program] Project: $[budegt-project::textarea::Project] Contract #: $[budegt-contract-no::textarea::Contract #] ",
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
        ],
        "checklist":[
            {
                "section": "preparation",
                "title": "Preparation",
                "list": []
            },
            {
                "section": "format-grammar",
                "title": "Formatting and Grammar",
                "list": []
            },
            {
                "section": "component",
                "title": "Contract Components",
                "list": []
            },
            {
                "section": "terminology",
                "title": "Terminology",
                "list": []
            }
        ]
    }
}

~~~

### contract

~~~json

{
    "head": {
        "code": "contract-code",
        "title":"contract-name-display",
        "template-key": "",
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

~~~
