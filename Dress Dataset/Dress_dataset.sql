CREATE DATABASE if not exists dress_data_ineuron
use dress_data_ineuron

#creating table with colunms
create table if not exists dress(
dress_data varchar(30),
style varchar(30),
price varchar(30),
Rating int(10),
size varchar(30),
Season varchar(30),
NeckLine varchar(30),
SleeveLength varchar(30),
waiseline varchar(30),
Material varchar(30),
FabricType varchar(30),	
Decoration varchar(30),	
Pattern_Type varchar(30),	
Recommendation varchar(30))

#Inserting bult data automatically without doing manually. spreedsheet always should be .CSV formate for this method.

load data infile "D:\AttributeDataSet_2nd.csv"
into table dress
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from dress;

#==============================================================================

# Here we are trying constrains(primary Key)
create table if not exists test(
test_id int auto_increment,      #-->>This will help to generate row numbers automatically when ever we add new data
test_name varchar(30),
test_mailid varchar(30),
test_address varchar(50),
primary key (test_id) )       #-->>we have to declear the test_id as primary key or foriegn key to use auto_increment cmd or else itwill throw an error

# while usingauto_increment, to avoid errors we have to do mapping, or else system will not understand which all it needs to consider as schemes
insert into test (test_name, test_mailid, test_address) values('Harsha', 'kommuriharsha110@gmail.com', 'vadlamannadu'),
('kusuma', 'kusuma14kommuri@gmail.com', 'Hyderabad');

select * from test;

#================================================================================

# This case to know about check constrain
create table if not exists test2(
test_id int auto_increment,      #-->>This will help to generate row numbers automatically when ever we add new data
test_name varchar(30),
test_mailid varchar(30),
test_address varchar(50),
test_salary int check(test_salary >5000), #-->> check constrain will check the data before dumping, if its TRUE it will allow data or it will throw an error
primary key (test_id) )

insert into test2 (test_name, test_mailid, test_address, test_salary) values('Harsha', 'kommuriharsha110@gmail.com', 'vadlamannadu', 8000),
('kusuma', 'kusuma14kommuri@gmail.com', 'vadlamannadu', 6000);
select * from test2

# we can even alter the table with constraints(it's showing error please check with someone)
alter table test2 add check (test_address = 'vadlamannadu');

# there is constraint NOT NULL, if we use this constraint giving a value is manadentary or elso query will not run
create table if not exists test5( 
test_id int NOT NULL,
test_name varchar(30) , 
test_mailid varchar(30),
teast_adress varchar(30) check (teast_adress= 'bengalore'),
test_salary int check(test_salary > 10000))

select * from test5
# Here it will show error
insert into test5 ( test_name , test_mailid , teast_adress,test_salary) values ('sudhanshu','sudhanshu@ineuron.ai','bengalore' , 50000) 
# here it will not give error 
insert into test5 (test_id, test_name , test_mailid , teast_adress,test_salary) values (32, 'sudhanshu','sudhanshu@ineuron.ai','bengalore' , 50000) 

# Default constrain: by using this constrain, while inserting we are not giving any value, by default it will take default value which we will give at declarition itself.
create table if not exists test6( 
test_id int NOT NULL default 0,
test_name varchar(30) , 
test_mailid varchar(30),
teast_adress varchar(30) check (teast_adress= 'bengalore'),
test_salary int check(test_salary > 10000))

select * from test6
# Here it will not show any error even when we are not giving value for test_id. it will take default value which is '0' here.
insert into test6 ( test_name , test_mailid , teast_adress,test_salary) values ('sudhanshu','sudhanshu@ineuron.ai','bengalore' , 50000) 

# Unique: this constrain will allow to insert, only unique values.
create table if not exists test7( 
test_id int NOT NULL default 0,
test_name varchar(30) , 
test_mailid varchar(30) unique,
teast_adress varchar(30) check (teast_adress= 'bengalore'),
test_salary int check(test_salary > 10000))

# if we run the below for twice, it will give us an error
insert into test7 ( test_name , test_mailid , teast_adress,test_salary) values ('sudhanshu','sudhanshu@ineuron.ai','bengalore' , 50000) 

create table if not exists test8( 
test_id int NOT NULL auto_increment  ,
test_name varchar(30)  NOT NULL default 'unknown' , 
test_mailid varchar(30) unique NOT NULL,
teast_adress varchar(30) check (teast_adress= 'bengalore') NOT NULL,
test_salary int check(test_salary > 10000) NOT NULL,
primary key (test_id))

select * from test8

insert into test8 ( test_id , test_name , test_mailid , teast_adress,test_salary) values (101 , 'sudhanshu','sudhanshu55@ineuron.ai','bengalore' , 50000)

insert into test8 ( test_name , test_mailid , teast_adress,test_salary) values ('sudhanshu','sudhanshu90@ineuron.ai','bengalore' , 50000)
