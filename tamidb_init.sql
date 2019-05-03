 create database if not exists `tamidb`;
 use tamidb;

 SET FOREIGN_KEY_CHECKS=0;
 drop table if exists applications;
 drop table if exists application;
 drop table if exists codetable;
 drop table if exists application_codetable;
 drop table if exists codevalue;


 create table if not exists application(
     id_application INT AUTO_INCREMENT,
     application_key VARCHAR(60) NOT NULL,
     optional VARCHAR(60),
     PRIMARY KEY (id_application)
 );

create table if not exists codetable(
     id_codetable INT AUTO_INCREMENT,
     codetable_key VARCHAR(45) NOT NULL,
     codetable_sd DATE,
     codetable_ed DATE,
     optional VARCHAR(60),
     PRIMARY KEY (id_codetable)
 );

 create table if not exists application_codetable(
     id_application_codetable INT AUTO_INCREMENT,
     id_application INT NOT NULL,
     id_codetable INT NOT NULL,
     application_codetable_sd DATE,
     application_codetable_ed DATE,
     optional VARCHAR(60),
     PRIMARY KEY (id_application_codetable),
     FOREIGN KEY fk_appid(id_application)
     REFERENCES applications(id_application)
     ON UPDATE CASCADE
     ON DELETE RESTRICT,
     FOREIGN KEY fk_codetableid(id_codetable)
     REFERENCES codetable(id_codetable)
     ON UPDATE CASCADE
     ON DELETE RESTRICT
 );

 create table if not exists codevalue(
     id_codevalue INT AUTO_INCREMENT,
     id_codetable INT,
     code_value VARCHAR(128) NOT NULL,
     codevalue_sd DATE,
     codevalue_ed DATE,
     optional VARCHAR(60),
     PRIMARY KEY (id_codevalue),
     FOREIGN KEY fk_codetable(id_codetable)
     REFERENCES codetable(id_codetable)
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
insert into application (id_application, application_key) 
    VALUES
    (1, "Car Sales");
insert into application (id_application, application_key) 
    VALUES
    (2, "Customer Address");
insert into application (id_application, application_key) 
    VALUES
    (3, "Employee");
insert into application (id_application, application_key) 
    VALUES
    (4, "Referral");
insert into application (id_application, application_key) 
    VALUES
    (5, "app_005");


/*codetable*/
insert into codetable (id_codetable, codetable_key, codetable_sd, codetable_ed)
    VALUES
    (1, "province", '2000-7-04', '2099-7-04');
insert into codetable (id_codetable, codetable_key, codetable_sd, codetable_ed)
    VALUES
    (2, "Month", '2000-7-04', '2099-7-04');
insert into codetable (id_codetable, codetable_key, codetable_sd, codetable_ed)
    VALUES
    (3, "Car Brand", '2000-7-04', '2099-7-04');
insert into codetable (id_codetable, codetable_key, codetable_sd, codetable_ed)
    VALUES
    (4, "Employee Type", '2000-7-04', '2099-7-04');
insert into codetable (id_codetable, codetable_key, codetable_sd, codetable_ed)
    VALUES
    (5, "Student Lives With", '2000-7-04', '2099-7-04');
insert into codetable (id_codetable, codetable_key, codetable_sd, codetable_ed)
    VALUES
    (6, "Language", '2000-7-04', '2099-7-04');
insert into codetable (id_codetable, codetable_key, codetable_sd, codetable_ed)
    VALUES
    (7, "Status of Result", '2000-7-04', '2099-7-04');


/*codevalue    1 province   2 student... 3 language 4 status*/
insert into codevalue (id_codetable, code_value, optional, codevalue_sd, codevalue_ed)
    VALUES
    (1, "Ontario", "ON", '2000-7-04', '2099-7-04');
insert into codevalue (id_codetable, code_value, optional, codevalue_sd, codevalue_ed)
    VALUES
    (1, "Quebec", "QB", '2000-7-04', '2099-7-04');
insert into codevalue (id_codetable, code_value, optional, codevalue_sd, codevalue_ed)
    VALUES
    (1, "Nova Scotia", "NS", '2000-7-04', '2099-7-04');
insert into codevalue (id_codetable, code_value, optional, codevalue_sd, codevalue_ed)
    VALUES
    (1, "New Brunswich", "NB", '2000-7-04', '2099-7-04');
insert into codevalue (id_codetable, code_value, optional, codevalue_sd, codevalue_ed)
    VALUES
    (1, "Manitoba", "MB", '2000-7-04', '2099-7-04');
insert into codevalue (id_codetable, code_value, optional, codevalue_sd, codevalue_ed)
    VALUES
    (1, "British Columbia", "BC", '2000-7-04', '2099-7-04');
insert into codevalue (id_codetable, code_value, optional, codevalue_sd, codevalue_ed)
    VALUES
    (1, "Prince Edward Island", "PE", '2000-7-04', '2099-7-04');
insert into codevalue (id_codetable, code_value, optional, codevalue_sd, codevalue_ed)
    VALUES
    (1, "Saskatchewan", "SK", '2000-7-04', '2099-7-04');
insert into codevalue (id_codetable, code_value, optional, codevalue_sd, codevalue_ed)
    VALUES
    (1, "Alberta", "AB", '2000-7-04', '2099-7-04');
insert into codevalue (id_codetable, code_value, optional, codevalue_sd, codevalue_ed)
    VALUES
    (1, "Newfoundland and Labrador", "NL", '2000-7-04', '2099-7-04');


insert into codevalue (id_codetable, code_value, codevalue_sd, codevalue_ed)
    VALUES
    (2,	"January", "2019-05-02", NULL);
insert into codevalue (id_codetable, code_value, codevalue_sd, codevalue_ed)
    VALUES
    (2,	"February", "2019-05-02", NULL);
insert into codevalue (id_codetable, code_value, codevalue_sd, codevalue_ed)
    VALUES
    (2,	"March", "2019-05-02", NULL);
insert into codevalue (id_codetable, code_value, codevalue_sd, codevalue_ed)
    VALUES
    (2,	"April", "2019-05-02", NULL);
insert into codevalue (id_codetable, code_value, codevalue_sd, codevalue_ed)
    VALUES
    (3,	"Audi", "2019-05-02", NULL);
insert into codevalue (id_codetable, code_value, codevalue_sd, codevalue_ed)
    VALUES
    (3,	"Porsche", "2019-05-02", "2019-06-02");
insert into codevalue (id_codetable, code_value, codevalue_sd, codevalue_ed)
    VALUES
    (3,	"BMW", "2019-05-02", NULL);
insert into codevalue (id_codetable, code_value, codevalue_sd, codevalue_ed)
    VALUES
    (4,	"Permanent", "2019-05-02", NULL);
insert into codevalue (id_codetable, code_value, codevalue_sd, codevalue_ed)
    VALUES
    (4,	"Temporary", "2019-05-02", NULL);
insert into codevalue (id_codetable, code_value, codevalue_sd, codevalue_ed)
    VALUES
    (4,	"Co-op Student", "2019-05-02", NULL);



/*application_codetable*/
insert into application_codetable (id_application, id_codetable, application_codetable_sd, application_codetable_ed)
    VALUES
    (1, 1, '2000-7-04', '2099-7-04');
insert into application_codetable (id_application, id_codetable, application_codetable_sd, application_codetable_ed)
    VALUES
    (1, 3, '2000-7-04', '2099-7-04');
insert into application_codetable (id_application, id_codetable, application_codetable_sd, application_codetable_ed)
    VALUES
    (2, 1, '2000-7-04', '2099-7-04');
insert into application_codetable (id_application, id_codetable, application_codetable_sd, application_codetable_ed)
    VALUES
    (1, 2, '2000-7-04', '2099-7-04');
insert into application_codetable (id_application, id_codetable, application_codetable_sd, application_codetable_ed)
    VALUES
    (3, 1, '2000-7-04', '2099-7-04');
insert into application_codetable (id_application, id_codetable, application_codetable_sd, application_codetable_ed)
    VALUES
    (3, 3, '2000-7-04', '2099-7-04');
