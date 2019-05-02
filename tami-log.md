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

