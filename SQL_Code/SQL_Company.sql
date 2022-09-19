create schema if not exists company;

create table company.employee(
fname varchar (15) not null,
minit char,
lname varchar (15) not null,
ssn char(9) not null,
bdate date,
andress varchar(30),
sex char,
salary decimal(10,2),
super_ssn char(9),
dno int not null,
primary key (ssn)
);

use company;
create table departament(
	dname varchar(15) not null,
    dnumber int not null,
    mgr_ssn char(9),
    mgr_start_date date,
    primary key(dnumber),
    unique (dname),
	foreign key (mgr_ssn) references employee(ssn)
);

create table dept_locations(
	dnumber int not null,
    dlocation varchar(15) not null,
    primary key (dnumber, dlocation),
    foreign key (dnumber) references departament(dnumber)
    );

create table project (
	pname varchar(15) not null,
    pnumber int not null,
    plocation varchar(15),
    dnum int not null,
    primary key (pnumber),
    unique (pname),
    foreign key (dnum) references departament(dnumber)
);

create table works_on(
	essn char(9) not null,
    pno int not null,
    hours decimal(3,1)not null,
    primary key (essn, pno),
	foreign key (essn) references employee(ssn),
    foreign key (pno) references project (pnumber)
);

create table dependent(
	essn char(9) not null,
    dependent_name varchar(15) not null,
    sex char, -- f ou m
    bdate date,
    relationship varchar(8),
    primary key (essn, dependent_name),
    foreign key (essn) references employee(ssn)
);