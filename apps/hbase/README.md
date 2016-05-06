## Sample HBase Oozie workflow using ExportSnapshot

#### Tested on HDP 2.4 Sandbox v.3

##### this script assumes you have an hbase table called tableA
```
create 'tableA', 'cf'
```
##### create a snapshot using
```
snapshot 'tableA', 'tableA-snapshot-2016-05-03'
list_snapshots
```
##### now upload the workflow and execute as user guest
```
su guest
hdfs dfs -put oozie ./
oozie job -oozie http://sandbox.hortonworks.com:11000/oozie -config oozie/apps/hbase/job.properties -run
```
