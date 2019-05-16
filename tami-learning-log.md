May 16
======
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


Day 10 (May.13)
===============

1. Installed VirtualBox -> created a guest of Fedora (server)
2. installed docker and Postgres database on the VM (Postgres support storing Json as Jsonb), and created simple tables and data.
3. Researched more information about the framwork.
4. worked on JSON design about storing the Contract sections.


Day 9 (May.10)
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


Day 8 (May.9)
=============
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




Day 7 (May.8)
============
1. followed the video below(long, detailed but good) to learn the React to build UI:
- learning video:  https://www.youtube.com/watch?v=sBws8MSXN7A&t=130s
- project I created:  https://github.com/teng-liu/FirstReactPrj

I spent the whole day on this project, there are lots of new things, the UI is a different world (compare to middle-ware).
But after created this very simple example, I've got the base idea of what the react is and how it works. But still lots of knowledges to learn.

I have a log for the react learning today, and there are required installations and some commands there. I will add more during further learning.
my react log: 
    https://github.com/teng-liu/myDocuments/blob/master/react-learning.md 

Also, a quick .gif (from the attachment) of today's first example.

Day 6 (May.7)
=============

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



Day 5 (May.6)
=============

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



Day 4 (May.03)
==============
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



Day 3 (May.02)
==============

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


Day 2 (May.01)
=====
1. Learned more about the concept about annotations and beans and how they worked.  
2. checked videos of Spring boot MicroServices, these videos are very good, first create 3 general services in Spring boot, then they turn them to microservice way. I will check more of it.  
https://javabrains.io/courses/spring_bootquickstart/ 
3. Database:  
I created sql to create the databse and 4 tables that you gave, but there is no data in them, I will add some testing data tomorrow.  


Day 1 (Apr.30)
=====
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

