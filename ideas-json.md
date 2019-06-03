

Routers (of API):
~~~js
// add routers
this.app.use('/api/contracts', new Resource('contract', this.pool).createRouter());
this.app.use('/api/contract-templates', new Resource('contract_template', this.pool).createRouter());
this.app.use('/api/roles', new Resource('role', this.pool).createRouter());
this.app.use('/api/actions', new Resource('action', this.pool).createRouter());
this.app.use('/api/role-action-mappings', new Resource('role_action_map', this.pool).createRouter());
~~~


Reference  
https://www.postgresql.org/docs/10/functions-json.html


GET:
~~~js
let r = await this.pool.query(
    `select * from ${this.dbTable}`
);
~~~
~~~http
###
GET http://localhost:9000/api/contracts

###
GET http://localhost:9000/api/contract-templates

###
GET http://localhost:9000/api/roles

#### support get collections 
~~~


QUERY:
~~~js
let r = await this.pool.query(
    `select * from ${this.dbTable} where name_key=($1)`, [req.params.id]
);
~~~

~~~http
###
GET http://localhost:9000/api/contracts/tami-contract-cccc

###
GET http://localhost:9000/api/contract-templates/itss-control-approval-template

###
~~~


PUT:
~~~js
let re = await this.pool.query(

    `insert into ${this.dbTable} (name_key, content) 
    values ($1, $2)
    on conflict (name_key)
    do update set content=$3;`, [req.params.id, content, content]
);
~~~

~~~http
PUT http://localhost:9000/api/contracts/aaaaaaaaaa
content-type: application/json

 {
     "id": "tami-contract-cccc",
     "content":{
        "head": {
            "code": "contract-code",
            "title":"contract-name-display",
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
                "budegt-project": "",
                "budegt-contract-no": ""
            }
        }
     }
 }

~~~



PATCH:
~~~js
let r = await this.pool.query(
    `update ${this.dbTable}
        set content = (
        jsonb_set(content, $1, $2, false))::json 
        where name_key=$3`, 
        [req.body.path, JSON.stringify(req.body.updates), req.params.id]
);
~~~

~~~http
###
PATCH http://localhost:9000/api/contracts/itss-control-approval-contract
content-type: application/json

 {
     "path": "{data, selected}",
     "updates": 28
 }

 ###

PATCH http://localhost:9000/api/[collection]/[name_key]
content-type: application/json

 {
     "path": "{node1, node2, node3...}",
     "updates": [value]
 }
~~~


More update sql on jsonb:
~~~sql
update contract
	set content = (
		jsonb_set(
			content,
			'{data, selected}',
			'1',
			false))::json where uuid='...';

update tests_summary_data 
	set data = (
		jsonb_set(
			to_jsonb(data), 
			'{misc,gap,pa}', 
			'-1', 
			false))::json where data->'misc'->'gap'->>'pa' = '0';
~~~
