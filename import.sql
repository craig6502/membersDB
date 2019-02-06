# This script file is intended to create a complete data schema WITHIN CURRENT DB using available data
# 
# It will delete one table - 'members'
#
# The table is intended TO HOLD member/player information for club
#
# ---   If you wanted to create a database despite what you are connected to  ----
#DROP DATABASE if exists southperth;
# now create a new one
#CREATE DATABASE southperth;
# creating a database does not select it.  USE assumes you are referring to a dbname.
#USE southperth; 
# ------ OK END SETUP OF NEW DATABASE ----

#This is a line used for an existing database, not a new one.
DROP TABLE IF EXISTS members;
#@ _CREATE_TABLE_
CREATE TABLE members
(
	mycricket_id		INT(8) UNSIGNED PRIMARY KEY,
	last_name			VARCHAR(35) NOT NULL,
	first_name			VARCHAR(35) NOT NULL,
	age_group			VARCHAR(35) NOT NULL,
	last_season			VARCHAR(35) NOT NULL,
	school				VARCHAR(35) NOT NULL,
	notes				VARCHAR(35) NOT NULL,
	friend1				VARCHAR(35) NOT NULL,
	friend2				VARCHAR(35) NOT NULL,
	friend3				VARCHAR(35) NOT NULL,
	other_parent_skill	VARCHAR(35) NOT NULL,
	parent_assist		VARCHAR(35) NOT NULL,
	prog_assist			VARCHAR(35) NOT NULL,
	impairment			VARCHAR(35) NOT NULL,
	impairment_desc		VARCHAR(35) NOT NULL,
	illness				VARCHAR(35) NOT NULL,
	illness_desc		VARCHAR(35) NOT NULL,
	jnr_umpire			VARCHAR(35) NOT NULL,
	i2C_shirt			VARCHAR(35) NOT NULL,
	other_shirt			VARCHAR(35) NOT NULL

);
#@ _CREATE_TABLE_

#load text file
# fields terminated by '\t' is another option
# if line ends are not detected on a Mac use \r carriage return instead of \n
# delete the 'IGNORE 1 LINES' if there are no column headings in file

load data local infile '/users/craigduncan/sites/sportsadmin/members.csv'
     into table members 
	 fields terminated by ','
	 lines terminated by '\r'
	 IGNORE 1 LINES
     (mycricket_id,last_name,first_name,age_group,last_season,school,notes,friend1,friend2,friend3,other_parent_skill,parent_assist,prog_assist,impairment,impairment_desc,illness,illness_desc,jnr_umpire,i2C_shirt,other_shirt)
