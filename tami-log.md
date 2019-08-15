
Aug.15
=======


Updating 35df2b0..e2a41ec
Fast-forward
 contract-system-api/docs/cms_init.sql              | 379 +++++++++++++
 contract-system-api/src/core/resources.js          |  82 ++-
 contract-system-api/src/server.js                  |   6 +-
 contract-system-db/docs/cms_init.sql               | 611 ++++++++++++++++++---
 .../src/components/contract/contractControl.tsx    |  88 ++-
 .../src/components/contract/contractTemplate.tsx   | 544 ++++++++++++------
 .../src/components/template/template.tsx           | 427 ++++++++++----
 contract-system-ui/src/store/middlewares/api.ts    | 567 +++++++++++--------
 8 files changed, 2057 insertions(+), 647 deletions(-)




From https://github.com/teng-liu/installation_web
   8bcbea7..b823037  master     -> origin/master
Updating 8bcbea7..b823037
Fast-forward
 README.md                      | 141 ++++++++++++++++++++++++++++++++++++++++-
 web.api/Dockerfile             |  22 +------
 web.api/docker-compose.yml     |  50 +++++++++++++++
 web.api/package-lock.json      |  49 ++++----------
 web.api/package.json           |   5 +-
 web.api/src/index.js           |  10 +++
 web.api/src/server.js          |   5 +-
 web.db/Dockerfile              |   2 +
 web.ui/Dockerfile              |  22 +------
 web.ui/docker/nginx.conf       |   0
 web.ui/package-lock.json       |  29 ++++++---
 web.ui/src/components/main.tsx |   2 +-
 12 files changed, 247 insertions(+), 90 deletions(-)
 create mode 100644 web.api/docker-compose.yml
 create mode 100644 web.db/Dockerfile
 create mode 100644 web.ui/docker/nginx.conf
PS C:\Users\tliu\Documents\tami\projects\installation_web>






1. capture:
- observations from the workplace
- growth in your understanding of various subjects
- connections to your academic courses, your ideas and
thoughts throughout your term and 
- will help you identify your strengths
- develop further self awareness and determine areas for improvement.




1. Your reflective journal will be made up of weekly entries capturing your **observations** from your workplace and your **interactions** with and within it. It is not a place to provide a descriptive account of what you did/tasks you completed, but a means to communicate your development, thinking, and learning. 

Themes to be explored in your journal:

- The significance of this work term to your professional and academic growth, and your wider career plans;
- Progress toward or barriers in achieving the SMART goals you set for your work term;
- Connections between your learning from your work term and what you have learned in your academic courses/theory;
- Identifying the skills your work term is requiring you to develop and/or practice
- Detailing areas for professional growth/improvement






end
-----------------












Steps to Reproduce:

open user settings
set "editor.tabSize": 2
"editor.detectIndentation": false
ensure nothing set in workSpace Settings
write some JS code
right-click "Format Document" or alt + shift + F







~~~

Snippets
Below is a list of all available snippets and the triggers of each one. The ⇥ means the TAB key.

Trigger	Content
tsrcc→	class component skeleton
tsrcfull→	class component skeleton with Props, State, and constructor
tsrcjc→	class component skeleton without import and default export lines
tsrpcc→	class purecomponent skeleton
tsrpcjc→	class purecomponent without import and default export lines
tsrpfc	pure function component skeleton
tsdrpfc	stateless functional component with default export
tsrsfc	stateless functional component
conc→	class default constructor with props and context
cwm→	componentWillMount method
ren→	render method
cdm→	componentDidMount method
cwrp→	componentWillReceiveProps method
scu→	shouldComponentUpdate method
cwu→	componentWillUpdate method
cdu→	componentDidUpdate method
cwum→	componentWillUnmount method
gdsfp→	getDerivedStateFromProps method
gsbu	getSnapshotBeforeUpdate method
sst→	this.setState with object as parameter
bnd→	binds the this of method inside the constructor
met→	simple method
tscntr→	react redux container skeleton
imt	create a import
License

~~~


~~~sql

insert into 
    public.rel_contract_group (name_key, group_uuid, contract_uuid)
values
    ($1, $2, $3)


CREATE TABLE public.rel_user_contract
(
    contract_uuid uuid,
    contract_group_uuid uuid,
    CONSTRAINT contractMappingUser_pkey PRIMARY KEY (contract_group_uuid, contract_uuid)
);
create index rel_user_contract_idx on public.rel_user_contract (contract_uuid);


-- changes


insert into 
    public.rel_contract_group (name_key, group_uuid, contract_uuid)
	select * 
	from 
	jsonb_to_recordset('
		 [{
			"name_key": "TTTT", 
			"group_uuid": "e24964ad-04d7-495d-ad2d-9be967a69982",
			"contract_uuid": "e24964ad-04d7-495d-ad2d-9be967a69982"}, 
		 {
			"name_key": "EEEEE", 
			"group_uuid": "e24964ad-04d7-495d-ad2d-9be967a69982",
			"contract_uuid": "e24964ad-04d7-495d-ad2d-9be967a69982"}]')
	as x (name_key text, group_uuid uuid, contract_uuid uuid)
on conflict (..) do nothing;
	


insert into public.rel_user_contract (name_key, user_uuid, contract_group_uuid)
 values ('AAAB', 'e24964ad-04d7-495d-ad2d-9be967a69982', '5fc65198-c6ef-438b-bc47-b1218399a2f8')


CREATE TABLE public.rel_user_contract
(
    user_uuid uuid,
    contract_group_uuid uuid,
    CONSTRAINT contractMappingUser_pkey PRIMARY KEY (contract_group_uuid, contract_uuid)
);

~~~



July.22
-------
1. contract group -> if submit all together, need to keep a list of current contract, adding contracts, removing contracts => then display current contract + adding - removing, and submit adding, removing separately, and SQL need work for bench of data ... insert a list of data...

2. user previleged contract -> by group, by contract, store as single contract | and contract Group

3. double clicked to move to left, refresh left list


$ git clone git@gitlab.gpei.ca:quickr/framework/coop-student-shared-repository.git
Cloning into 'coop-student-shared-repository'...
The authenticity of host 'gitlab.gpei.ca (172.18.54.88)' can't be established.
ECDSA key fingerprint is SHA256:rmiVQOW98CZgKr+SP1l8mOb10ol3UElqkch4+kymVOA.
Are you sure you want to continue connecting (yes/no)?





/usr/local/pgsql-11/pg_dump --file "/var/lib/pgadmin/storage/pgadmin4_pgadmin.org/DBscript" --host "postgres" --port "5432" --username "postgres" --no-password --verbose --format=p "cms"


May 27
======

possible Methods of form:

- retrieve -> get form by doc_id, version...
- create  -> save with version infor
- update  -> 
  - (content?)save with version infor;
  - (status-> expired)not the form, but the attributes of form
- delete  -> delete on version | delete of all history versions
- attachment -> with doc_id and attachment_id?


1. what kind of format it saved as (doc?) -> the exported file from CMS(maintain all data in its own database, support export/import/integrate to/from different storage systems -> Synchonization)

2. How it displayed? as **web form** with each field seprated OR as a **word doc**(a block of content, not possible to get inside field recorded)





May 23
======

1. Meeting with supervisor 
2. Researched on:
3) open work doc in browser -> React
https://www.opcito.com/blogs/configuring-an-office-js-word-add-in-with-reactjs-without-the-yeoman-generator/

2) API -> Office 365 
https://docs.microsoft.com/en-us/graph/onedrive-concept-overview
https://docs.microsoft.com/en-us/sharepoint/dev/sp-add-ins/working-with-folders-and-files-with-rest

3) API -> Alfrasco
http://localhost:8080/api-explorer/#!/sites/getSiteMembershipRequestForPerson



~~~sql

select * from contracts where name_key='itss-control-approval-sheet';


CREATE TABLE public.contracts
(
    uuid uuid NOT NULL DEFAULT uuid_generate_v4(),
    name_key text,
    content jsonb,
    CONSTRAINT contract_pkey PRIMARY KEY (uuid)
)

insert into public.contracts (name_key, content) 
    values ('itss-control-approval-sheet', '{
    "head": {
        "id": "contract-template-itss",
        "code": "contract-template-itss",
        "title": "Default Contract Template",
        "version": "1.0"
    },
    "body": {}
}')
~~~






May 21
======
~~~

VENDOR NAME: $[vendor-name::textinput::Type here]

label: $[var::component-type::label/placeholder]

textinput
textarea
checkbox
calander
singleselection
multipleselection

~~~
Co-op
-----
Based on your current understanding of your job duties, what would you identify as the top three skills your work term will require you to draw upon to be successful? How do these skills connect wider to your career plans?

Top three skills identified from the first month of first work-term:
First, communication is important and Together with listen and understanding. Both the communication with the end-user, who knows less about technic but know more about the business requirement, and the technical leader, who breaks down the user requirements to the software model, are necessary and they are long-lasting process during the entire software development. Good communication skills allow gaining this information efficiently.
Then, open mindedness is important us as a programmer. There are always new languages, new technologies and new implementing structures come up in software development world. We may use a totally different strategy or frameworks when starting a new project from what we've been worked on before. Technology is evolving in a rapid speed, so should us programmer. So we need to keep our open-mind all the time to listen to the new ideas, learn new knowledge and keep the same pace with the updated knowledge.
Last but not the least, the problem solving skill. Programming is process of finding and fixing problems. There are always problems when you write tens or hundreds lines of code, as well as when we try something new. We need to be patient and positive to narrow down the problem, find out the root cause, and provide a solution to fix it. Problem solving is an everyday-use skill when programming, and it is a core skill.




Communication, listen, and understanding:
    understanding the requirements and what do user really want...
Open-mindedness
    new ideas, new technologies
Problem solving


Fedora:

https://www.server-world.info/en/note?os=Fedora_29&p=desktop&f=1

~~~
u/n:   same as GroupWise
p/w:  Welcome1
 
http://alfrescotest.gpei.ca/share/page/
~~~







May.15
=======
1. Events / Action 
2. Roles (user group) -> Previledge

- Audit log 
    - who (user -> with role)
    - what (event -> edit, update date, edit money, approval, closed..)
    - where (target -> contract, vendors, or users, groups)
    - when (date)

1. when approval -> need to check Audit Log of what changed, and make sure all these logs/events are normal and no impact
2. path of form/contract (store path, in file system, or database, or cloud...)
3. contract | Approval Control form -> Frasco
4. Contract title -> unique (also, contract no.)
5. track when sign and send email - notification to all related users and record where is the process of the contract
6. 



May.14
======

- Spring Boot <-VS-> Express:
https://dzone.com/articles/web-development-comparison-springboot-vs-expressjs



May.10
======
1. learned about Redux(), which is used for managing the application state:
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

Have a great weekend. 

Best Regards,
Tami (Teng Liu)



May.9
=====
Wiki
----
https://en.wikipedia.org/wiki/Contract_management_software

Compare contract management systems in market:
----------------------------------------------
https://www.softwareadvice.com/contract-management/

https://financesonline.com/contract-lifecycle-management/ca



CMx contract management experience
----------------------------------
https://www.contractexperience.com/index.html#features 

Life-Cycle:
https://www.contractexperience.com/resources/resources-main.html


Trail:
------
https://app.contractsafe.com/dashboard
    tami.liu@icloud.com / Welcome22





Contract Management System
==========================

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








Day 6 (May.7)

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

1. How to pass query (with JPA and JDBC)

JPA:
https://www.jeejava.com/spring-boot-data-jpa-left-right-inner-and-cross-join-examples/

https://docs.spring.io/spring-data/jpa/docs/current/reference/html/

https://dzone.com/articles/spring-boot-jpa-mysql-sample-app-code-example

JDBC:
https://www.tutorialspoint.com/springjdbc/springjdbc_preparedstatementsetter.htm
https://www.concretepage.com/spring-boot/spring-boot-jdbc-example



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


select ct.id_codetable, ct.codetable_key, cv.id_codevalue, cv.code_value
    from codetable ct
    inner join codevalue cv on ct.id_codetable=cv.id_codetable
    where ct.id_codetable=2;

select m.id_application_codetable, m.id_application, m.id_codetable, ct.codetable_key
    from application_codetable m 
    inner join codetable ct on m.id_codetable=ct.id_codetable
    where m.id_application = 3;

~~~



Day 4 (May.3)

1. To connect the Spring Boot application to the MySQL database:

1.1 Add the required dependencies (e.g. MySQL library) to the “pom.xml” file. These dependencies are the Java libraries needed to connect to the database

1.2 Provide the database connection properties to the application. These properties include the database connection string, port, username, password etc

1.3 Create a class that talks to the database. This class is commonly referred to as a “Repository class”

https://medium.com/@salisuwy/building-a-spring-boot-rest-api-part-iii-integrating-mysql-database-and-jpa-81391404046a 

https://spring.io/guides/gs/accessing-data-mysql/


Tasks:
------
get all from application(form)
*get one specific form by id, name

*get codetable by an application(id or name)

get all from codetable

get one specific code from code table, by id, name
*get all codevalue under a code(id or name)

~~~
post:
{
    "name":"Chris",
    "age":22,
    "sex":"male"
}


POST https://example.com/comments HTTP/1.1
content-type: application/json

{
    "name": "sample",
    "time": "Wed, 21 Oct 2015 18:27:50 GMT"
}


{
    "name":"addFromAPI"
}

~~~


D1.Install-list
===============

https://www.youtube.com/watch?v=27I1M5RLplE


https://github.com/teng-liu/SpringBootLearningPRJ.git

1. Software Installation:
    Slack, IntelliJ, Tomcat, Java JDK, Orbeon, MySql; 
    (extra) Visual Studio Code, git

2. Learning Spring Boot(followed spring.io webset and youtube videos)
    A HelloWorld project created and submitted to my github: 
        https://github.com/teng-liu/SpringBootLearningPRJ.git
    
    *two unit test created of above two pages
    *server.port=8888
    *http://localhost:8888/    http://localhost:8888/tami


3. New concepts and their usages that I need to learn more:
    - Annotation (there are lots of annotation need to be familiar with)
    - Dependency Injection

Notice:
1. import to IntelliJ, choose Maven
2. updated the tomcat port(8080 already in use by Cumda)
    /src/main/resources/application.properties
        server.port=8888


Concepts:
- Annotation  [@RestController]
- Dependency Injection 
    - An injection is the passing of a dependency to a dependent object (a client) that would use it.

~~~java
public HelloWorld(FancyWriter text) {
    this.writer = text;
}
~~~



Day 2 
======

Annotation
----------

- Java code | Built-in (Compiler)
    - @Override
    - @Deprecated
    - @SupressWarnings
- Meta Annotations



Questions:  
~~~java
 @Author(first = "Oompah", last = "Loompah")
 Book book = new Book();
 
 public @interface Author {
     String first();
     String last();
 }

//---------
  @Edible(true)
  Item item = new Carrot();

  public @interface Edible {
      boolean value() default false;
  }

//---------
  @Retention(RetentionPolicy.RUNTIME) // Make this annotation accessible at runtime via reflection.
  @Target({ElementType.METHOD})       // This annotation can only be applied to class methods.
  public @interface Tweezable {
  }
~~~

1. seems like storing pure data(data for an object)?   
2. data with when and where it can be used?

=> Annotations may include an optional list of **key-value** pairs  
=> Annotations themselves may be annotated to indicate **where** and **when** they can be used

videos:
https://spring.io/guides/tutorials/rest/

https://javabrains.io/courses/spring_bootquickstart/
https://www.youtube.com/channel/UCYt1sfh5464XaDBH0oH_o7Q


DataBase:
=========

shell> "C:\Program Files\MySQL\MySQL Server 5.0\bin\mysqld"
The path to mysqld may vary depending on the install location of MySQL on your system.

shell> "C:\Program Files\MySQL\MySQL Server 5.0\bin\mysqladmin" -u root shutdown


1. Learned more about the concept about annotations and beans and how they worked.
2. checked videos of Spring boot MicroServices, these videos are very good, first create 3 general services in Spring boot, then they turn them to microservice way. I will check more of it.
 https://javabrains.io/courses/spring_bootquickstart/ 
3. Database:
    I created sql to create the databse and 4 tables that you gave, but there is no data in them, I will add some testing data tomorrow.

tami's collection of DB commands:
~~~sql
/*drop table, first drop foreigh-key, or set foreign_key_checks=0*/
SET FOREIGN_KEY_CHECKS=0;
drop table if exists applications;
drop table if exists application;
drop table if exists codetable;
drop table if exists application_codetable;
drop table if exists codevalue;

show databases;
show tables;
describe table-name;        /*show structure of table*/

~~~


~~~sql
 create database if not exists `tamidb`;
 use tamidb;

 SET FOREIGN_KEY_CHECKS=0;
 drop table if exists applications;
 drop table if exists application;
 drop table if exists codetable;
 drop table if exists application_codetable;
 drop table if exists codevalue;


 create table if not exists application(
     id INT AUTO_INCREMENT,
     key_name VARCHAR(60) NOT NULL,
     optional VARCHAR(60),
     PRIMARY KEY (id)
 );

create table if not exists codetable(
     id INT AUTO_INCREMENT,
     key_name VARCHAR(45) NOT NULL,
     star_date DATE,
     end_date DATE,
     app_codetable_idapp INT,
     optional VARCHAR(60),
     PRIMARY KEY (id)
 );

 create table if not exists application_codetable(
     id INT AUTO_INCREMENT,
     app_id INT NOT NULL,
     codetable_id INT NOT NULL,
     star_date DATE,
     end_date DATE,
     application_idapp INT,
     optional VARCHAR(60),
     PRIMARY KEY (id),
     FOREIGN KEY fk_appid(app_id)
     REFERENCES applications(id)
     ON UPDATE CASCADE
     ON DELETE RESTRICT,
     FOREIGN KEY fk_codetableid(codetable_id)
     REFERENCES codetable(id)
     ON UPDATE CASCADE
     ON DELETE RESTRICT
 );

 create table if not exists codevalue(
     id INT AUTO_INCREMENT,
     codetable_id INT,
     codevalue VARCHAR(128) NOT NULL,
     star_date DATE,
     end_date DATE,
     optional VARCHAR(60),
     PRIMARY KEY (id),
     FOREIGN KEY fk_codetable(codetable_id)
     REFERENCES codetable(id)
     ON UPDATE CASCADE
     ON DELETE RESTRICT
 );

/*
1. insert data -> application
2. insert data -> codetable
3. insert data -> application_codetable
4. insert data -> codevalue
*/

/*application*/
insert into application (key_name) 
    VALUES
    ("app_001");
insert into application (key_name) 
    VALUES
    ("app_002");
insert into application (key_name) 
    VALUES
    ("app_003");
insert into application (key_name) 
    VALUES
    ("app_004");
insert into application (key_name) 
    VALUES
    ("app_005");


/*codetable*/
insert into codetable (key_name, star_date, end_date)
    VALUES
    ("province", '2000-7-04', '2099-7-04');
insert into codetable (key_name, star_date, end_date)
    VALUES
    ("studentliveswith", '2000-7-04', '2099-7-04');
insert into codetable (key_name, star_date, end_date)
    VALUES
    ("language", '2000-7-04', '2099-7-04');
insert into codetable (key_name, star_date, end_date)
    VALUES
    ("statusofresult", '2000-7-04', '2099-7-04');


/*codevalue    1 province   2 student... 3 language 4 status*/
insert into codevalue (codetable_id, codevalue, optional, star_date, end_date)
    VALUES
    (1, "Ontario", "ON", '2000-7-04', '2099-7-04');
insert into codevalue (codetable_id, codevalue, optional, star_date, end_date)
    VALUES
    (1, "Quebec", "QB", '2000-7-04', '2099-7-04');
insert into codevalue (codetable_id, codevalue, optional, star_date, end_date)
    VALUES
    (1, "Nova Scotia", "NS", '2000-7-04', '2099-7-04');
insert into codevalue (codetable_id, codevalue, optional, star_date, end_date)
    VALUES
    (1, "New Brunswich", "NB", '2000-7-04', '2099-7-04');
insert into codevalue (codetable_id, codevalue, optional, star_date, end_date)
    VALUES
    (1, "Manitoba", "MB", '2000-7-04', '2099-7-04');
insert into codevalue (codetable_id, codevalue, optional, star_date, end_date)
    VALUES
    (1, "British Columbia", "BC", '2000-7-04', '2099-7-04');
insert into codevalue (codetable_id, codevalue, optional, star_date, end_date)
    VALUES
    (1, "Prince Edward Island", "PE", '2000-7-04', '2099-7-04');
insert into codevalue (codetable_id, codevalue, optional, star_date, end_date)
    VALUES
    (1, "Saskatchewan", "SK", '2000-7-04', '2099-7-04');
insert into codevalue (codetable_id, codevalue, optional, star_date, end_date)
    VALUES
    (1, "Alberta", "AB", '2000-7-04', '2099-7-04');
insert into codevalue (codetable_id, codevalue, optional, star_date, end_date)
    VALUES
    (1, "Newfoundland and Labrador", "NL", '2000-7-04', '2099-7-04');



/*application_codetable*/
insert into application_codetable (app_id, codetable_id, star_date, end_date)
    VALUES
    (1, 1, '2000-7-04', '2099-7-04');
insert into application_codetable (app_id, codetable_id, star_date, end_date)
    VALUES
    (1, 2, '2000-7-04', '2099-7-04');
insert into application_codetable (app_id, codetable_id, star_date, end_date)
    VALUES
    (2, 2, '2000-7-04', '2099-7-04');
insert into application_codetable (app_id, codetable_id, star_date, end_date)
    VALUES
    (3, 4, '2000-7-04', '2099-7-04');
insert into application_codetable (app_id, codetable_id, star_date, end_date)
    VALUES
    (4, 1, '2000-7-04', '2099-7-04');

~~~

=> Province:
Ontario                     -> ON
Quebec                      -> QC
Nova Scotia                 -> NS
New Brunswich               -> NB
Manitoba                    -> MB
British Columbia            -> BC
Prince Edward Island        -> PE
Saskatchewan                -> SK
Alberta                     -> AB
Newfoundland and Labrador -> NL


=> Student lives with:
Parents together
Parents separately
Mother
Father
Legal guardian
Independently
Host family
Custodian
Other

=> Language:
English(US)
English(CA)
French
Spanish
Chinese

=> status:
Accepted
Not accepted by SWT
Declined by student/family
Referred out



Day3
====
https://www.youtube.com/watch?v=2HVMiPPuPIM
https://www.youtube.com/watch?v=KTvYHEntvn8


SQL join
========

- inner join
  - only staff that matches "left.id=right.id"

- left join (left outer join)
  - staff that matches "left.id=right.id"
  - remaining staff in "left" table

- right join (right outer join)
  - staff that matches "left.id=right.id"
  - remaining staff in "right" table

- full join (full outer join)
  - staff that matches "left.id=right.id"
  - remaining staff in "left" table
  - remaining staff in "right" table

~~~sql
/* inner join */
select * from customer inner join city on customer.city_id=city.id;
select * from customer left join city on customer.city_id=city.id;
select * from customer right join city on customer.city_id=city.id;
select * from customer full join city on customer.city_id=city.id;

/* alias for table */
select cus.*, ci.name
    from customer as cus
    inner join
    city as ci
    on cus.city_id=ci.id
    where ci.name="Tampa"

--list code-tables of each application:
select application.application_key, codetable.codetable_key from application
    inner join application_codetable on application_codetable.id_application=application.id_application
    inner join codetable on codetable.id_codetable=application_codetable.id_codetable;

 select * from application_codetable 
    where id_application=(select id_application from application where name="Employee");

~~~
Hi Scott,

I upload my learning-log to my github account, so that it can display mark-down file (.md) well. And I also want to say that this is really a valuable chance for me to create database and write these sql in practical, I learned a lot, but I know there still be much more to learn, I am excited to see how it comes after 4 months work, it must be very rewarding. Thanks again for this chance.

Please check today's report from the link below:

https://github.com/teng-liu/myDocuments/blob/master/tami-learning-log.md 

Best Regards,
Tami (Teng Liu)
