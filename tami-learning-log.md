
Day 5 (May.6)
=============

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

