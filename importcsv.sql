# This script file is intended to create a complete database schema and table/s using available data
# Last edited by Craig Duncan 10 August 2017
# 
# The table is intended TO HOLD member/player information for club
#
# Pre-requisite: a csv data file with the columns and table entries matched as in this file.
# I could have imported data, then exported it out as template SQL 'sample', but this illustrates using csv.
#
# Script will delete existing database schema and tables for southperth, if exists (BE CAREFUL)
#
# ---   If you want to create a database 'schema' despite what you are connected to  ----
DROP DATABASE if exists southperth;
# now create a new one
CREATE DATABASE southperth;
# creating a database 'schema' does not select it.  USE assumes you are referring to a dbname.
USE southperth; 
# ------ OK END SETUP OF NEW DATABASE ----

#This is a line used for an existing database, not a new one.
DROP TABLE IF EXISTS members;
#@ _CREATE_TABLE_
#We shouldn't put NOT ULL after VAR OR INT unless we require non-empty
CREATE TABLE members
(
	#mycricket_id		INT(8) UNSIGNED PRIMARY KEY,
	club_id				INT(8) UNSIGNED PRIMARY KEY,
	last_name			VARCHAR(35),
	first_name			VARCHAR(35),
	Address1			VARCHAR(35),
	Suburb				VARCHAR(35),
	Postcode			VARCHAR(35),
	phone1				VARCHAR(75),
	parents				VARCHAR(35),
	mob1				VARCHAR(35),
	mob2				VARCHAR(35),
	parentsemail		VARCHAR(75),
	mf					VARCHAR(35),
	birthdate			VARCHAR(35),
	yn					VARCHAR(35),
	school				VARCHAR(35),
	age					VARCHAR(35)
	#spare				VARCHAR(35)

);
#@ _CREATE_TABLE_

#load text file
# fields terminated by '\t' is another option
# if line ends are not detected on a Mac use \r carriage return instead of \n
# delete the 'IGNORE 1 LINES' if there are no column headings in file
# It seems using a local variable with infile is not recommended
# SET @myfilename = ;

load data local infile '/users/.../sportsadmin/csv/members2.csv'
     into table members 
	 fields terminated by ','
	 lines terminated by '\r'
     (club_id,	last_name, first_name, Address1,Suburb,Postcode,phone1,parents,mob1,mob2,parentsemail,mf,birthdate,yn,school,age);

# if you want to create another field/s AFTER the import you can use ALTER TABLE like this:
ALTER TABLE members 
add column mycricket_id int(8) default 0 AFTER club_id,
add column notes varchar(50) default "notes" AFTER age;

#then display output of all records:
select * from southperth.members;
