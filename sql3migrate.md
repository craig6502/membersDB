# SQLLite3 to SQL Migration

Database migration through abstraction

## Motivation

SQLite3 works for a single user, not multi-tasking.  "sqlite3 command line is single-threaded".  

That's where other applications like mySQL come into their own, because they can handle multiple requests.
(ORM)

## MySQL approach
 
  https://www.mysql.com/products/workbench/migrate/

## ORM 

Another method (source DB driven) is to use an ORM in the source, and enables the actual connection to be moved down a layer.

Use an ORM class that abstracts specific database differences away for you. 
e.g. you get these in PHP (RedBean), Python (Django's ORM layer, Storm, SqlAlchemy), Ruby on Rails (ActiveRecord), Cocoa (CoreData)

i.e. you could do this:
Load data from source database using the ORM class.
Store data in memory or serialize to disk.
Store data into destination database using the ORM class.

  https://stackoverflow.com/questions/18671/quick-easy-way-to-migrate-sqlite3-to-mysql

## ORM Refs:

Python/Django: 

	http://www.sqlalchemy.org/
	https://storm.canonical.com/
	
PHP:
	
	http://www.redbeanphp.com/index.php
	RedBeanPHP supports all well known, open source, relational databases. 
	Official support is provided for: MySQL, MariaDB, PostgreSQL, SQLite and CUBRID. Support for other databases might be provided by 3rd parties.
	
	(i.e if you program using redbean, you should be able swap out your DB in the future without changing the code)
