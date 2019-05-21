
### May.21 (control sheet)

### contract (May.13)

~~~json
{
            "head": {
                "id": "contract-template-itss",
                "code": "contract-template-itss",
                "title": "Default Contract Template",
                "version": "1.0"
            },
            "body": {
                "clauses": [
                    {
                        "type": "title/1",
                        "field": "{$agreement-name}"
                    },
                    {
                        "type": "body/begining",
                        "field": [
                            {
                                "lineorder": 1,
                                "line": "THIS AGREEMENT made this {$made-date, #formate-date}"
                            },
                            {
                                "lineorder": 2,
                                "line": "BETWEEN: {$party-a}, as represented by the Minister of {$party-a-minister}",
                                "line-note": "(hereinafter referred to as \"Government\")",
                                "line-break": "OF THE FIRST PART;"
                            },
                            {
                                "lineorder": 3,
                                "line": "AND: {$party-b-department}, of {$party-b-company} in {$party-b-county} County,  Province of {$party-b-province}",
                                "line-note": "(hereinafter referred to as the \"Contractor\")",
                                "line-break": "OF THE SECOND PART."
                            },
                            {
                                "lineorder": 4,
                                "line": "WHEREAS Government wishes to engage the services of the Contractor to carry out the services described in Schedule \"A\" attached hereto;"
                            },
                            {
                                "lineorder": 5,
                                "line": "AND WHEREAS the Contractor has agreed to provide Government with these services on certain terms and conditions as more particularly set out in this Agreement;"
                            },
                            {
                                "lineorder": 6,
                                "line": "NOW THEREFORE in consideration of the mutual promises contained in this Agreement, the Parties agree that the terms and conditions of their relationship are as follows:"
                            }]
                    },
                    {
                        "type": "body/definitions",
                        "title": "Definitions",
                        "field": "In this Agreement, the following definitions apply: {$definitions}"
                    }
                ]
            }

}

~~~





### JSON design

~~~json
  [{
    "contractId": 1,
    "id": 1,
    "name": "contract-infor",
    "category": "Contract Infor",
    "body": [
                {
                    "name":"agreement-date",
                    "statement": "THIS AGREEMENT made this",
                    "content": {
                        "date-day": "  day of",
                        "date-month": "  ,",
                        "date-year": "20  "
                    }
                },
                {
                    "name": "between",
                    "department-a": "GOVERNMENT OF PRINCE EDWARD ISLAND",
                    "statement": "as represented by the Minister of ",
                    "contractor-a": "  (minister)"
                },
                {
                    "name": "between-and",
                    "department-b": "   (department-b)",
                    "statement": " of ",
                    "contractor-b": "  (contractor-b) in",
                    "County": " (county), Province of ",
                    "province": "  (province)"
                },
                {
                    "name": "last-statement",
                    "content": [
                                    {
                                    "name": "whereas",
                                    "content": "WHEREAS Government wishes to engage the services of the Contractor to carry out the services described in Schedule “A” attached hereto;"
                                    },
                                    {
                                    "name": "andwhereas",
                                    "content": "AND WHEREAS the Contractor has agreed to provide Government with these services on certain terms and conditions as more particularly set out in this Agreement;"
                                    },
                                    {
                                    "name": "therefore",
                                    "content": "NOW THEREFORE in consideration of the mutual promises contained in this Agreement, the Parties agree that the terms and conditions of their relationship are as follows:"
                                    }
                                ]
                }


            ]
  },
  {
    "contractId": 1,
    "id": 1,
    "name": "definitions",
    "category": "Definitions",
    "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
  },
  {
    "contractId": 1,
    "id": 2,
    "name": "covenant-contractor",
    "category": "Covenants of the Contractor and Government",
    "body": "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
  },
    {
    "contractId": 1,
    "id": 2,
    "name":"payments",
    "category": "Payments, Records and Accounts",
    "body": "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
  }]
~~~







