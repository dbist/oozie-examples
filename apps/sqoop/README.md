#### in HDP 2.5 we have to add the following property to hive-site.xml to disable parallel movers in hdfs when using `--hive-import` in Sqoop
```
<property>
      <name>hive.mv.files.thread</name>
      <value>0</value>
</property>
```

#### [See this article for discussion](https://community.hortonworks.com/questions/61899/sqoop-hive-import-failing.html#answer-80353)

