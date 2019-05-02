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


/*
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

*/