create database first_example;
use first_example;
create table person(
person_id smallint unsigned,
fname varchar(20),
lname varchar(20),
gender enum('M','F'),
birth_day DATE,
street varchar(30),
city varchar(20),
state varchar(20),
country varchar(20),
postal_code varchar(20),
constraint pk_person primary key (person_id)
);

desc person;

create table favorite_food(
person_id smallint unsigned,
food varchar(20),
constraint pk_favorite_food primary key (person_id, food),
constraint fk_favorite_food_person_id foreign key (person_id) 
references person(person_id)
);

desc favorite_food;
select * from favorite_food;
desc person;
delete from person where person_id = 2;
show databases;

insert into person values ('1','fname','fname','F','0000-00-00','street','city','state','country','postal_code');

insert into favorite_food values ('3','Bolo');