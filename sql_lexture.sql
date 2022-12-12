create database lecture_db;

use lecture_db;

create table address(
id int   not null  primary key auto_increment,
city varchar(255),
zip_code varchar(255) not null
);

drop table address;

-- READ: Retrives data from the collection
select * from address;
select id, zip_code from address;
select id as addressId, zip_code as zipCode from address;

-- INSERT
insert into address(CITY, ZIP_CODE) values('Växjö', '35264');
insert into address(CITY, ZIP_CODE) values('Växjö', '35252');
insert into address(CITY, ZIP_CODE) values('test', '12345');
insert into address(CITY, ZIP_CODE) values('Jönköping', '35246');

-- UPDATE 
update address set zip_code = '35222' where id = 3;


-- truncate is used to remove table content/ rows
truncate table address;

-- DELETE
delete from address where id = 3;

-- ALTER TABLE
alter table address modify city varchar(40);
alter table address add street varchar(80) default 'TEST';
alter table address drop street;



-- One TO One (PERSON - ADDRESS)
create table person(
id int   not null   primary key   auto_increment,
first_name varchar(255) not null,
last_name varchar(255) not null,
email varchar(255) not null unique, 
birth_date date not null,
reg_date datetime  default now(),
_active tinyint default false,
address_id int not null,
foreign key (address_id) references address(id)
);

drop table person;
select * from person;

insert into person(first_name, last_name, email, birth_date, address_id) values('Mehrdad', 'Javan', 'mehrdad.javan@lexicon.se', '2020-01-01' , 1);
insert into person(first_name, last_name, email, birth_date, address_id) values('Simon', 'Elbrink', 'simon.elbrink@lexicon.se', '2020-01-01' ,2);
insert into person(first_name, last_name, email, birth_date, address_id) values('Marcus', 'Gudmunsen', 'marcus.gudmonsen@lexicon.se', '2020-01-01' ,4);
insert into person(first_name, last_name, email, birth_date, address_id) values('test', 'test', 'test.test@lexicon.se', '2020-01-01' ,3);

select * from address;



-- One To Many (Task _ Person)
create table task(
id int   not null   primary key   auto_increment,
title varchar(255) not null,
_description varchar(500),
person_id int,
foreign key (person_id) references person(id)
);



insert into task(title, _description, person_id) values('workshop', 'sql', 1);
insert into task(title, _description) values('task2', 'test task');
insert into task(title, _description, person_id) values('task3', 'test task3', 1);
insert into task(title, _description, person_id) values('task4', 'test task4', 2);
insert into task(title, _description, person_id) values('task5', 'test task5', 4);


select * from task; 
select * from task where id in(1,2);
select * from task where title like 't%';
select * from task where title like '%task%';
select * from task where id = 1 and title = 'workshop'; 

select t.id, t.title, p.email from task t inner join person p on t.person_id = p.id;
select t.id, t.title, p.email from task t left join person p on t.person_id = p.id;


-- Many To Many

create table _group(
id int   not null   primary key   auto_increment,
group_name varchar(255) not null
);

create table persons_groups(
id int not null primary key auto_increment,
person_id int not null,
group_id int not null,
foreign key (person_id) references person(id),
foreign key (group_id) references _group(id)
);

select * from persons_groups;





select count(*) from person;
select sum(id) from person;



