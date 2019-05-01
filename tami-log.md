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


~~~sql
 create database if not exists `tamidb`;
 use tamidb;

 create table if not exists applications(
     id INT AUTO_INCREMENT,
     key_name VARCHAR(60) NOT NULL,
     PRIMARY KEY (id)
 );

create table if not exists codetable(
     id INT AUTO_INCREMENT,
     key_name VARCHAR(45) NOT NULL,
     star_date DATE,
     end_date DATE,
     app_codetable_idapp INT,
     PRIMARY KEY (id)
 );

 create table if not exists application_codetable(
     id INT AUTO_INCREMENT,
     app_id INT NOT NULL,
     codetable_id INT NOT NULL,
     star_date DATE,
     end_date DATE,
     application_idapp INT,
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
     PRIMARY KEY (id),
     FOREIGN KEY fk_codetable(codetable_id)
     REFERENCES codetable(id)
     ON UPDATE CASCADE
     ON DELETE RESTRICT
 );

~~~