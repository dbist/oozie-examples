create table imported (rowkey int, value varchar(25));

insert into imported (rowkey, value) values (1, "john doe");
insert into imported (rowkey, value) values (2, "jane doe");

GRANT ALL PRIVILEGES ON *.* TO 'centos'@'172.22.65.%'
    IDENTIFIED BY 'password'
    WITH GRANT OPTION;
FLUSH PRIVILEGES;

GRANT ALL PRIVILEGES ON *.* TO 'centos'@'localhost'
    IDENTIFIED BY 'password'
    WITH GRANT OPTION;
FLUSH PRIVILEGES;

mysql –u centos –p
➢	password

mysql> select * from test.imported;
+--------+----------+
| rowkey | value    |
+--------+----------+
|      1 | john doe |
|      2 | jane doe |
+--------+----------+

sqoop list-tables --connect jdbc:mysql://source-1/test --username centos --password password

17/02/18 15:13:13 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
exported
imported

echo -n "password" > .password 
hdfs dfs -put .password /user/$USER/ 
hdfs dfs -chmod 400 /user/$USER/.password 
rm .password 


[centos@source-1 ~]$ hdfs dfs -ls
Found 1 items
-r--------   3 centos hdfs          8 2017-02-18 15:13 .password
[centos@source-1 ~]$ hdfs dfs -cat .password
password[centos@source-1 ~]$

password[centos@sourcsqoop list-tables --connect jdbc:mysql://source-1/test --username centos --password-file /user/centos/.password

17/02/18 15:14:43 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
exported
imported


http://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.5.3/bk_data-movement-and-integration/content/sqoop_hcatalog_integration.html


fix mysql connector if necessary, you must have mysql-connector-java >= 5.1.37

yum downgrade mysql-connector-java

lrwxrwxrwx.  1 root root       31 Feb 18 15:29 jdbc-mysql.jar -> mysql-connector-java-5.1.37.jar
lrwxrwxrwx.  1 root root       31 Feb 18 15:29 mysql-connector-java.jar -> mysql-connector-java-5.1.37.jar

sqoop import --connect jdbc:mysql://172.22.65.123/test \
--username centos --password-file /user/$USER/.password \
--table imported \
--hcatalog-table imported \
--create-hcatalog-table \
--hcatalog-storage-stanza "STORED AS ORCFILE" \
--hcatalog-home /usr/hdp/current/hive-webhcat \
--map-column-hive value=STRING \
--split-by rowkey


[centos@source-1 ~]$ hdfs dfs -mkdir /user/centos/sqoop/lib
[centos@source-1 ~]$ hdfs dfs -put /usr/share/java/mysql-connector-java-5.1.37.jar /user/centos/sqoop/lib/
[centos@source-1 ~]$ hdfs dfs -put /etc/hive/conf/hive-site.xml /user/centos/sqoop/lib/
[centos@source-1 ~]$ hdfs dfs -put /etc/tez/conf/tez-site.xml /user/centos/sqoop/lib/

[centos@source-1 ~]$ hdfs dfs -ls /user/centos/sqoop/lib/
Found 3 items
-rw-r--r--   3 centos hdfs      19228 2017-02-18 15:38 /user/centos/sqoop/lib/hive-site.xml
-rw-r--r--   3 centos hdfs     977873 2017-02-18 15:37 /user/centos/sqoop/lib/mysql-connector-java-5.1.37.jar
-rw-r--r--   3 centos hdfs       6737 2017-02-18 15:38 /user/centos/sqoop/lib/tez-site.xml

# remove stanza, $USER, --create-hcatalog-table

import --connect jdbc:mysql://172.22.65.123/test --username centos --password-file /user/centos/.password --table imported --hcatalog-table imported --hcatalog-home /usr/hdp/current/hive-webhcat --map-column-hive value=STRING --split-by rowkey

