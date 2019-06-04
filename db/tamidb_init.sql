 
 ---------postgres------------------------------------------
-- user: 'postgres',
-- host: 'localhost',
-- database: 'cms',
-- password: 'postgres',
-- port: 5432      
-- enter pg:   psql -h localhost -U postgres

---------show tables
SELECT
    table_schema || '.' || table_name
FROM
    information_schema.tables
WHERE
    table_type = 'BASE TABLE'
AND
    table_schema NOT IN ('pg_catalog', 'information_schema');


--------create table, query, insert
select * from contracts where name_key='itss-control-approval-sheet';

CREATE TABLE public.codetable
(
    uuid uuid NOT NULL DEFAULT uuid_generate_v4(),
    name_key text unique,
    content jsonb,
    CONSTRAINT codetable_pkey PRIMARY KEY (uuid)
);

CREATE TABLE public.contracts
(
    uuid uuid NOT NULL DEFAULT uuid_generate_v4(),
    name_key text unique,
    content jsonb,
    CONSTRAINT contract_pkey PRIMARY KEY (uuid)
);



---codetable---
SELECT content->'body' FROM codetable; 

insert into public.codetable (name_key, content)
    values('contract_type',
	'{
        "head": {
            "code": "contract_type",
            "display": "Contract Type",
            "expire-date": ""
        },
        "body": [
            	{
                    "code": "professional-services",
                    "display": "Professional Services",
		   			"order": 1,
                    "start-date": "2016-03-03",
                    "end-date": "2022-03-03"
                },
            	{
                    "code": "maintenance-service-support",
                    "display": "Maintenance/Service Support",
		   			"order": 2,
                    "start-date": "2016-03-03",
                    "end-date": "2022-03-03"
                },
				{
                    "code": "standing-offer-contract",
                    "display": "Standing Offer Contract",
		   			"order": 3,
                    "start-date": "2016-03-03",
                    "end-date": "2022-03-03"
                }
        ]
    }' 
		  );
	

insert into public.contracts (name_key, content) 
    values ('itss-control-approval-sheet', '{
        "head": {
            "id": "contract-template-itss",
            "code": "contract-template-itss",
            "title": "Default Contract Template",
            "version": "1.0"
        },
        {....}
    }');
 
CREATE TABLE public.contract_template
(
    uuid uuid NOT NULL DEFAULT uuid_generate_v4(),
    name_key text,
    content jsonb,
    CONSTRAINT contract_pkey PRIMARY KEY (uuid)
);




--------jsonb_set 
select * from contracts;
select content->'data' from contracts;

jsonb_set(
	contracts.content,
	'{data, selected}',
	2) from contracts;

update contract
	set content = (
		jsonb_set(
			content,
			'{data, selected}',
			'1',
			false))::json where uuid='c26eac14-7a02-4564-b864-40cfd28da438'

update tests_summary_data 
	set data = (
		jsonb_set(
			to_jsonb(data), 
			'{misc,gap,pa}', 
			'-1', 
			false))::json where data->'misc'->'gap'->>'pa' = '0';
 
 
 
 
 
 
 ---------------------------------------------------
 create database if not exists `tamidb`;
 use tamidb;

 SET FOREIGN_KEY_CHECKS=0;
 drop table if exists applications;
 drop table if exists application;
 drop table if exists codetable;
 drop table if exists application_codetable;
 drop table if exists codevalue;

CREATE TABLE if not exists user_application (
    id_user_application INT AUTO_INCREMENT,
    content JSON,
    optional VARCHAR(60),
    PRIMARY KEY (id_user_application)
);

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

--  create table if not exists application_codetable(
--      id_application_codetable INT AUTO_INCREMENT,
--      id_application INT NOT NULL,
--      id_codetable INT NOT NULL,
--      application_codetable_sd DATE,
--      application_codetable_ed DATE,
--      optional VARCHAR(60),
--      PRIMARY KEY (id_application_codetable),
--      FOREIGN KEY fk_appid(id_application)
--      REFERENCES applications(id_application)
--      ON UPDATE CASCADE
--      ON DELETE RESTRICT,
--      FOREIGN KEY fk_codetableid(id_codetable)
--      REFERENCES codetable(id_codetable)
--      ON UPDATE CASCADE
--      ON DELETE RESTRICT
--  );


 create table if not exists application_codetable(
     id_application_codetable INT AUTO_INCREMENT,
     id_application INT NOT NULL,
     id_codetable INT NOT NULL,
     application_codetable_sd DATE,
     application_codetable_ed DATE,
     optional VARCHAR(60),
     PRIMARY KEY (id_application_codetable)
 );

 create table if not exists codevalue(
     id_codevalue INT AUTO_INCREMENT,
     id_codetable INT,
     code_value VARCHAR(128) NOT NULL,
     codevalue_sd DATE,
     codevalue_ed DATE,
     optional VARCHAR(60),
     PRIMARY KEY (id_codevalue)
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


INSERT INTO user_application (content)
    VALUES
    ('{"key1": "value1", "key2": "value2"}'),
    ('{"key1": "value1", "key2": "value2", "key1": "value1", "key2": "value2"}');




-- for contract
 drop table if exists definitions;

 create table if not exists definitions(
     id INT AUTO_INCREMENT,
     order_num INT,
     name_key VARCHAR(60) NOT NULL,
     explanation text,
     PRIMARY KEY (id)
 );

 INSERT INTO definitions (order_num, name_key, explanation) 
    VALUES
    (1, "agreement", "\"Agreement\" means this Memorandum of Agreement and all attached schedules, and \"Memorandum of Agreement\" means this Agreement excluding all attached schedules;"),
    (2,"contractor","\"Contractor\" means [INSERT CONTRACTOR’S FULL LEGAL NAME HERE];"),
    (3,"fiscal-year","\"Fiscal Year\" means a 12 month period beginning on April 1st in a year and ending on March 31st in the following year;"),
    (4,"government","\"Government\" means Government of Prince Edward Island, as represented by the Minister of Finance;"),
    (5,"parties","\"Parties\" means Government and the Contractor, and \"Party\" means either of them as the context requires;"),
    

-- postgres
create database cms;
create role cmsdev with login password '123';

-- incorrect
create schema cont owner cmsdev;  



 CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

 create table definitions(
     id uuid DEFAULT uuid_generate_v4 (),
     order_num INT,
     name_key VARCHAR NOT NULL,
     explanation text,
     PRIMARY KEY (id)
 );

 INSERT INTO definitions (order_num, name_key, explanation) 
    VALUES
    (1, 'agreement', '"Agreement" means this Memorandum of Agreement and all attached schedules, and "Memorandum of Agreement" means this Agreement excluding all attached schedules;'),
    (2,'contractor','"Contractor" means [INSERT CONTRACTOR’S FULL LEGAL NAME HERE];'),
    (3,'fiscal-year','"Fiscal Year" means a 12 month period beginning on April 1st in a year and ending on March 31st in the following year;'),
    (4,'government','"Government" means Government of Prince Edward Island, as represented by the Minister of Finance;'),
    (5,'parties','"Parties" means Government and the Contractor, and "Party" means either of them as the context requires;'),
    





