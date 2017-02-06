#### in HDP 2.5 we have to add the following property to hive-site.xml to disable parallel movers in hdfs when using `--hive-import` in Sqoop
```
<property>
      <name>hive.mv.files.thread</name>
      <value>0</value>
</property>
```

#### [See this article for discussion](https://community.hortonworks.com/questions/61899/sqoop-hive-import-failing.html#answer-80353)

1. make sure user permissions on hdfs are correct
2. make sure the driver for MySQL is in lib directory of the workflow or in sharelib
3. yarn container size is enough to run more than one job at a time
4. proxy user is set up for core-site.xml
5. user can connect to MySQL from a remote machine
 ```
GRANT ALL PRIVILEGES ON *.* TO 'centos'@'172.22.124.%'
    IDENTIFIED BY 'password'  
    WITH GRANT OPTION;
    FLUSH PRIVILEGES;
```

