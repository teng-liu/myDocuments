Week 6 (June.3 ~ June.7)
=======================

June.7
======
1. Discussed features (todo list) with team
2. prepared documents for meeting of next monday
3. working on css grid -> layout

4. current ui -> .gif -> download link:  
   https://github.com/teng-liu/myDocuments/blob/master/UI-0607-002.gif

June.6
======

1. !!Solved yesterday's problem:  
-> should not call api in render, should be in 'componentDidMount'.  
=> solution is: create a separate component of DropDownBox, call api to get data source from its 'componentDidMount' method
2. added some css style (basic) for displaying better

June.5
======
1. tried tokenizr, which allows multiple inline variables $[...]...$[...] => efficient and convinent
2. Abstract the Contract Template doc => to Json and stored => And displayed on UI (part of the template, not all)
3. !!Problem: call api(dispatch action) to get codeValue for displaying as Drop-down-box -> called in render -> caused infinit loop of keep calling api (need to be solved)

June.4
======

1. wrote documents(json, sql) about database structure introduction
2. features that thought about:
- template
  - get |create | modify | delete
  - tokenizr (well support format)
- contract
  - get |create | modify | delete
  - tokenizr (well support format)
- css -> grid -> display UI
- role
  - operations
  - org | user
- contract -> status
- user
  - login
  - role
  - basic ACL 
- audit log
3. afternoon -> create -> template [layout]


June.3
======
1. I've read through the contract process material  -> collected:   
- Roles
- Contract-Status
- Process
- Events/Operations on Contract


Object |	Actions |	Role |
-------|----------|------|--
Contract | Contract.Create (Prepare) |	Contract Author | 
Contract | Contract.Modify (Correction)	| Manager | 
Contract | Contract.Review | Director | 
Contract | Contract.Approve | SCC - Supply Chain Coordinator | 
Contract | Contract.Rollback(sent back) |	CFO - Chief Financial Officer | 
Contract | Contract.Agree | COO - Chief Operating Officer | 
Template | Template.Agree | Vendor | 
Contract | Contract.Send (completed contract)	 | All
Contract | Contract.Receive (completed contract)	 |  All
Contract | Contract.Finalized (process end)	 | Contract Author
Contract | Contract.Backup (save to…Alfrasco...)	 | Contract Author


#### contract status

Object | order | previous status | template/Contract Status | next status | Role	 | 
-------|-------|-----------------|--------------------------|-------------|---------|
template | 1000	|	| template preparing | |	contract-author
template | 91000|	| template pending Acceptance by vendor | |	vendor
template | 92000|	| template accepted by vendor | |	vendor
contract | 93000|	| contract pending Acceptance by vendor | |	vendor
contract | 94000|	| vendor accepted | |	vendor
contract | 95000|	| vendor vendor-signed | |	vendor
contract | 95000|	| received the finalized contract | |	vendor
contract | 2900	|	| Rolled back by [who] from [status] to [status] the previous step  | |	
template | 1300	|	| template prepared | |	contract-author
contract | 2000	|	| contract drafting | |	contract-author
contract | 2100	|	| contract draft Done | |	contract-author
contract | 2200	|	| contract being modified (after 'rolled back') | |	contract-author
contract | 2300	|	| contract modified done | |	contract-author
contract | 2400	|	| sent Manager to review | |	contract-author
contract | 2500	|	| sent to SCC after correction | |	contract-author
contract | 2600	|	| sent vendor-signed contract to SCC | |	contract-author
contract | 2700	|	| received the finalized contract | |	contract-author
contract | 2800	|	| sent the finalized contract to vendor | |	contract-author
contract | 3000	|	| manager reviewing | |	manager
contract | 3100	|	| Pending approval by manager | |	manager
contract | 3200	|	| manager approved | |	manager
contract | 3300	|	| manager declined ( + rolled back..author..) | |	manager
contract | 3400	|	| sent director to review | |	manager
contract | 4000	|	| director reviewing | |	director
contract | 4100	|	| Pending approval by  director | |	director
contract | 4200	|	| director approved | |	director
contract | 4300	|	| director declined ( + rolled back..author..) | |	director
contract | 4400	|	| sent to SCC to review | |	director
contract | 5000	|	| SCC reviewing | |	SCC
contract | 5100	|	| Pending approval by SCC | |	SCC
contract | 5200	|	| SCC approved | |	SCC
contract | 5300	|	| SCC declined ( + rolled back..author..) | |	SCC
contract | 5400	|	| sent CFO to review | |	SCC
contract | 5500	|	| received vendor-signed contract | |	SCC
contract | 5600	|	| sent vendor-signed contract to COO | |	SCC
contract | 5700	|	| received both-signed contract | |	SCC
contract | 5800	|	| backed up both-signed contract to [alfrasco] | |	SCC
contract | 5900	|	| broadcast of the contract finalization (CFO, author) | |	SCC
contract | 6000	|	| CFO reviewing | |	CFO
contract | 6100	|	| Pending approval by  CFO | |	CFO
contract | 6200	|	| CFO approved | |	CFO
contract | 6300	|	| CFO declined ( + rolled back..scc..) | |	CFO
contract | 6400	|	| sent to COO to review | |	CFO
contract | 5500	|	| received vendor-signed contract | |	COO
contract | 5600	|	| sent vendor-signed contract to COO | |	COO
contract | 7000	|	| COO reviewing | |	COO
contract | 7100	|	| Pending approval by COO | |	COO
contract | 7200	|	| COO approved | |	COO
contract | 7300	|	| COO declined ( + rolled back..scc..) | |	COO
contract | 7400	|	| sent to contract-author | |	COO
contract | 8000	|	| received vendor-signed contract | |	Treasury board
contract | 8100	|	| tb-signed the vendor-signed contract | |	Treasury board
contract | 8200	|	| sent both-signed contract to COO | |	Treasury board




link for team -> database setup:
https://github.com/teng-liu/myDocuments/blob/master/setup-database.md


Week 5 (May.27 ~ May.31)
=======================

May.31
======

1. solved the problem of submit contract from state(currentContract), instead of action.parameters.
2. one more dev problem: the parameter of PUT -> body, didn't passed by. (need to solve next week)   
!!!solved -> need to add a top-level json node to contain all the nodes
3. Discussed with team, the following list contains very roughly idea about features, we will go through again and make more details next Monday

v1.0.0 (2019 summer)
------
Feature List:
1. support display Template List  
  1.1 support filter by contract-type
2. support modify Template and create new one  
  2.1 Template Builder
3. support create/modify Contract on an existing template
4. support display Contract List
5. support user-base role control (Basic)  
   5.1 user group  
   5.2 user Event / activity  
   5.3 assign priviledge  
6. support basic work-flow procees  
...

v2.0.0 (2020 summer)
------
1. support advanced role-control
2. support advanced work-flow process
3. support export as word/pdf 
4. support integrate with alfrasco -> save exported file
5. ...


v3.0.0 (2021 summer)
-------
1. support all kinds of form/templates
2. support export to Office 365, or any Cloud platform
3. performance enhance  
....


May.30
======
Two link for react, redux explaination:
https://www.robinwieruch.de/react-redux-tutorial/ 
https://www.valentinog.com/blog/redux/ 

1. done the PUT api (express->postgres) with upsert operation (updata if exists, otherwise insert)
2. saved new-contract data(onChange of each property) into state (not in DB yet).

!!Question: how to submit-contract by the data in the state, instead of from action.parameters (need to solve tomorrow)

May 29
====== 
1. fixed the problem of updating property in JSON. (using JSON.stringify)
2. determine what should be updated in UI state, and what should call API (distinguish UI state and db data) => when submit -> call API
3. there should be no data in response when 'update' or 'save', only a success/failed message (the UI state already updated with the updated data)
4. tomorrow, work on db data -> "contract-template" & "contract" data, save the customer contract data in DB (Json -> (key, value) for each variable/property)
5. generate a contract with template (keep empty-contract for each template? or generate from template-> variables by api? )

May 28
======
1. problem: when call PATCH api (update part of data), how to refresh the UI? 
   1. call getAllData api again
      1. from UI action or 
      2. redux api layer
   2. OR render part of the UI data( how? )
   3. OR at the same time Generate Action, modify the state in redux
when update data, what should be in response?

!! Solution:
Check Shallow copy (redux):
https://redux.js.org/recipes/structuring-reducers/immutable-update-patterns

React-Redux-UI:    https://github.com/teng-liu/Contract-System
Express-API:       https://github.com/teng-liu/ExpressExampleII

2. problem: patchAttribute api -> get table-name, json-path, updates-value 
   1. only work for {"path": "{data, selected}", "updates": 24}
   2. not working when update string.

*need to solve tomorrow  
!! solution: need to use JSON.stringify -> JSON.stringify(req.body.updates)

May 27
======

### today worked on:
- express <-> postgres
  - wrote API in express => connected postgres db to get data (get is working, update not)
    - but the sql of update properties in jsonb is done (jsonb_set() method)
  - problem: use PUT api to update with json parameter


### Possible Methods of form:

- retrieve -> get form by doc_id, version...
- create  -> save with version infor
- update  -> 
  - (content?)save with version infor;
  - (status-> expired)not the form, but the attributes of form
- delete  -> delete on version | delete of all history versions
- attachment -> with doc_id and attachment_id?

1. what kind of format it saved as (doc?) -> the exported file from CMS(maintain all data in its own database, support export/import/integrate to/from different storage systems -> Synchonization)

2. How it displayed? as **web form** with each field seprated OR as a **word doc**(a block of content, not possible to get inside field recorded)


Week 4 (May.20 ~ May.24)
=======================
May 24
======
1. More research on contract management and document management business require and related information:
Contract management
https://en.wikipedia.org/wiki/Contract_management

Document management system
https://en.wikipedia.org/wiki/Document_management_system 


May 23
======
1. Meeting with supervisor 
2. Researched on:
1) open work doc in browser -> React
https://www.opcito.com/blogs/configuring-an-office-js-word-add-in-with-reactjs-without-the-yeoman-generator/

2) API -> Office 365 
https://docs.microsoft.com/en-us/graph/onedrive-concept-overview
https://docs.microsoft.com/en-us/sharepoint/dev/sp-add-ins/working-with-folders-and-files-with-rest

3) API -> Alfrasco
http://localhost:8080/api-explorer/#!/sites/getSiteMembershipRequestForPerson


May 22
======
1. worked on express, move the UI hard-code data to express, react call API in express.


May 21
======
1. worked on json design of control-approval sheet.
   https://github.com/teng-liu/myDocuments/blob/master/contract-control-approval.json
2. tried to draw it on UI, without style (please refer to the attached screenshot)


May.20
======
Holiday 

Week 3 (May.13 ~ May.17)
=======================
May 17
======
1. Finished the install of Alfresco docker version. And got 30 days trail. 
2. learned about the work-flow and the version control in the Alfresco Petti showed us in the demo.
3. Discussed with team about the plan and TODO list as well as To Discuss/determine list.
4. Tried Express JS (instead of Spring Boot), which use same language (Javascript) as React frontend development.


May 16
======
0. installing Alfresco on VirtualBox, not done, will continue tomorrow.
Alfresco:  https://docs.alfresco.com/trial/tasks/deploy-docker-compose.html

1. Postgres support full-text search function  
http://rachbelaid.com/postgres-full-text-search-is-good-enough/

official site: 
https://www.postgresql.org/docs/9.5/textsearch-intro.html

2. Query in Json(Jsonb) in Postgres  
- function: jsonb_array_elements
- And there are lots of functions and operators for Json in postgres:
official doc: https://www.postgresql.org/docs/9.4/functions-json.html

3. Web Development Project 
- with very detailed information about web development procedures
https://levelup.gitconnected.com/the-non-developers-guide-to-development-in-2018-7f023a2ff5e1

4. Overall development prodedures

- Frontend Frameworks
  - React + Redux + HTML|CSS
- Backend Frameworks/Language (middleware, api | REST)
  - Spring Boot(Java) | Express JS (Javascript)
- Database 
  - Mysql | Postgres | SQL server
- Deployment & Delivery
  - regular server | docker, etc.
- Testing 
  - Test Cases -> Bugzilla | SpiraTeam
  - Manually -> Automaticly
- Project Management    ->  Jira / Trello / Scrum
  - Recording Requirements, user stories, set up meetings, plans etc. for each sprint
- source code control   ->  git / github | gitlab
  - store source code / team work / pull request - review, etc.

- **Each step above requires**:    
    - install and setup the enviornment 
    - design 
    - document 
    - implement


May.15
======
Meetings with stakeholders, and first design session


May.14
======
worked on UI (contract template) today, kind of a mockup(by React) 


May.13
===============

1. Installed VirtualBox -> created a guest of Fedora (server)
2. installed docker and Postgres database on the VM (Postgres support storing Json as Jsonb), and created simple tables and data.
3. Researched more information about the framwork.
4. worked on JSON design about storing the Contract sections.

Week 2 (May.6 ~ May.10)
=======================
May.10
==============
1. learned about Redux(), which is used for managing the application state(used in React):
Redux (with React):

- Actions
- State management
- Reducer
- Middlewaer(redux-thunk)

wiki: https://en.wikipedia.org/wiki/Redux_(JavaScript_library) 

Redux Crash Course With React (video):
https://www.youtube.com/watch?v=93p3LxR9xfM

My redux code: https://github.com/teng-liu/tami-first-redux

2. Learned more about Json: https://www.youtube.com/watch?v=wI1CWzNtE-M

3. Project:
   For the project we are going to do, I think we may need a soure code control tool like github or gitlab to work together. And I've tried to define the json for the contract template, I only done the Definitions part, I displayed part of them on web UI(please refer to the attachment), but the remaining terms need more effort, i will aslo consult my friends of how to design the json for a better manage and some database knowledge. 


May.9
=====
1. I checked online of the "Contract management software" and got some idea about the contract related conccept and workflow.
   wiki:  https://en.wikipedia.org/wiki/Contract_management_software

2. Then I checked some products currently on market. There are a lot, and I checked their screenshots of their application, and there are lots of introductions and features on their webset. I think this is good to understand the contract management system directly.

List of current products:  
    https://financesonline.com/contract-lifecycle-management/ca 
* some of them provide free version, I will try to look for how their UI look and what's necessary functions they have. Then we can compare them and decide if we need the same functions.

An example of work-flow:
 https://www.contractexperience.com/resources/resources-main.html 

I will also attach some screenshots of their products that I saved.

3. Then I looked the documents you sent, especially the contact-template. I de-constrct the content of the template as below, so that I can understand well, and might be help when think about the design of database.

4. I construct a spreadsheet of the requirements and my understanding of the contract-data-structure together. you can check it out from the attached spreadsheet.

Contract Management System
--------------------------
Anatomy of a contract template:

- res
  - contract-template
    - contract-infor (part-1)
      - contract-type
      - date
      - first-part
      - second-part
      - statements
    - definitions (part-2)
      - contractor(<read from vendor infor>)
      - statements
    - convenants-contractor (part-3)
    - payment (part-4)
    - conditions (part-5)
    - reports (part-6)
    - administration (part-7)
    - termination (part-8)
    - confidentiality (part-9)
    - conflict-of-interest (part-10)
    - freedom-protection (part-11)
    - indemnification-insurance (part-12)
    - memorandum-prevail (part-13)
    - general (part-14)
    - sign (part-15)
    - schedule-a (statement of work, part-16)
    - schedule-b (location of work, part-17)
    - schedule-c (nondisclosure agreement, part-18)
    - schedule-d (use of computer, part-19)
  - definitions (terminologys)
  - contract
    - id | convenant | contractor | content | status | optional
  - code-table
  - code-value
  - vendor (Contractor? Parties?)
    - GOVERNMENT OF PRINCE EDWARD ISLAND
  - project

- sys.user-group
  - Contract Administrator
  - Approval Administrator
  - Vendor Administrator


- sys.user


May.8
=====
1. followed the video below(long, detailed but good) to learn the React to build UI:
- learning video:  https://www.youtube.com/watch?v=sBws8MSXN7A&t=130s
- project I created:  https://github.com/teng-liu/FirstReactPrj

I spent the whole day on this project, there are lots of new things, the UI is a different world (compare to middle-ware).
But after created this very simple example, I've got the base idea of what the react is and how it works. But still lots of knowledges to learn.

I have a log for the react learning today, and there are required installations and some commands there. I will add more during further learning.
my react log: 
    https://github.com/teng-liu/myDocuments/blob/master/react-learning.md 

Also, a quick .gif (from the attachment) of today's first example.

May.7
=====

1. Finished the JDBC query accross multiple tables(with joins)
2. Done the delete and update operation by API (PUT and DELETE)
3. All the API are done, but it may need more api when later developing the UI, I will add then.
   API calls:   https://github.com/teng-liu/myDocuments/blob/master/test-rest-api.http
   Java project: https://github.com/teng-liu/SpringBootMySQL/tree/master/src/main/java/com/tamiconnectdb/TamiConnDB 

4. 1)  Tomorrow I will try to write a simple table store user and user-application data. 
    For the user-application, I think I might be use a JSON to store the application data, because otherwise it might lots of columns of the user-application data and the table may various.

    But if I use a JSON to store the application like below, then the UI can analysis it and get the necessary data display on UI. The floowing is only an example. I will think more about this tomorrow. 
   1) And I might have time tomorrow to check what should I start the UI developing, I will let you know then.

Example of JSON the user-application:

[
    {"name": "tami-name",
    "application-number":"NO.23445345",
    "gender": "Female",
    "language": "English(CA)"
    }
]
OR
[
    {"name": "tami-name",
    "application-number":"NO.23445345",
    "gender": 2,
    "codeName": 3
    }
]



May.6
=====

1. How to pass query (with JPA and JDBC)

JPA:
https://www.jeejava.com/spring-boot-data-jpa-left-right-inner-and-cross-join-examples/

https://docs.spring.io/spring-data/jpa/docs/current/reference/html/

https://dzone.com/articles/spring-boot-jpa-mysql-sample-app-code-example

JDBC:
https://www.concretepage.com/spring-boot/spring-boot-jdbc-example
https://www.tutorialspoint.com/springjdbc/springjdbc_preparedstatementsetter.htm




~~~sql
select application.application_key, codetable.codetable_key from application
    inner join application_codetable on application_codetable.id_application=application.id_application
    inner join codetable on codetable.id_codetable=application_codetable.id_codetable;

select  a.id_application, a.application_key, ct.codetable_key, cv.code_value
    from codevalue cv
    inner join codetable ct on cv.id_codetable=ct.id_codetable
    inner join application_codetable m on ct.id_codetable=m.id_codetable
    inner join application a on m.id_application=a.id_application
    where a.id_application = 2;
~~~


Week 1 (April.30 ~ May.3)
=======================
May.03
======
1. I checked from the link below of how connect Mysql from Spring boot. It helped.

https://medium.com/@salisuwy/building-a-spring-boot-rest-api-part-iii-integrating-mysql-database-and-jpa-81391404046a

2. Then I added created a new Spring boot project and add some query(get) methods from database.
- For GET, the databased returned data is JSON, I didn't do any change;
- For POST, first I used the URL to indicate the inserting data, this is easier.
  - Then I tried to use JSON for POST (inserting) data, it took me some time to make this work. but it works finally.
- For others like delete and update, I don't have chance to try today.
- For the query on conditions, like query the code list of a form, or the code-value list based on the same code-table-id.
  - I think it might be need a simple stored procedure for Spring boot to call to return the data.
  - Or, write the sql(very long with join) in Spring boot. I prefer the Stored Procedure. I will try to study to write stored procedure next week.

Here is a link for this Spring boot project:   
    https://github.com/teng-liu/SpringBootMySQL 
And all the calls that I have so far:
    https://github.com/teng-liu/myDocuments/blob/master/test-rest-api.http 

3. I created a .gif to record the get and post operations (please find the attachment).
   I used a plugin named "Rest Client" in Visual Studio Code, it does the same thing as the browser does. But this tool display the JSON format better, and it can call POST method by pass a JSON easily. Please refer from my attached .gif file.

4. early next week, I will:
- finish delete, update
- study basic knowledge of Stored Procedure to query data by a specific condition.
- Then display the codevalue list for a specific code, and tables(codes) that a form included. 


May.02
======

1. I Re-created my table columns as the ones from the document you provided, 
   and inserted the data into database. I will attach my sql file later. 
   I used Visual Studio Code to edit my sql, that's a very powerful and efficient editor. 
   Here is a link of my sql file in github:

   https://github.com/teng-liu/myDocuments/blob/master/tamidb_init.sql  

2. I knew how to query from only one table before, not join multiple tables. 
   But today I spent some time and figured out how to write join, inner join, left/right join of query from multiple tables. This is realy helpful. But I need more practice on this. Here is an example of query codetables for each application:  

~~~sql
--list code-tables of each application:
select application.application_key, codetable.codetable_key from application
    inner join application_codetable on application_codetable.id_application=application.id_application
    inner join codetable on codetable.id_codetable=application_codetable.id_codetable;

 select * from application_codetable 
    where id_application=(select id_application from application where name="Employee");
~~~

Result:

 application_key  | codetable_key |
------------------|---------------|
 Car Sales        | province      |
 Car Sales        | Car Brand     |
 Customer Address | province      |
 Car Sales        | Month         |
 Employee         | province      |
 Employee         | Car Brand     |


3. I will work on **spring boot** tomorrow, see how to connect MySQL there and query the data. 


May.01
=====
1. Learned more about the concept about annotations and beans and how they worked.  
2. checked videos of Spring boot MicroServices, these videos are very good, first create 3 general services in Spring boot, then they turn them to microservice way. I will check more of it.  
https://javabrains.io/courses/spring_bootquickstart/ 
3. Database:  
I created sql to create the databse and 4 tables that you gave, but there is no data in them, I will add some testing data tomorrow.  


Apr.31
======
1. Installed Software:  
 
- Slack, IntelliJ, Tomcat, Java JDK, Orbeon, MySql;   
- (extra) VS Code, git  

 
2. Started learn Spring Boot - helloWorld(I followed spring.io web set and Youtube videos)  
 
- A HelloWorld project created and submitted to my github:   
    https://github.com/teng-liu/SpringBootLearningPRJ.git   
- Note: 
  - two unit test created of above two pages  
  - server.port=8888  
  - Rest URL:  http://localhost:8888/   and  http://localhost:8888/tami   


3. New concepts and their usages that I need to learn more:  
 
- Annotation (there are lots of annotation need to be familiar with)  
- Dependency Injection  

Apr.30
======
First day meeting, checklist. Machine not ready.

