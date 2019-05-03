









Day 3 (May.02)
=====

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

