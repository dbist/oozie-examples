# to view oozie or hadoop job log information, provide ?user.name=username to http in webbrowser
http://sandbox.hortonworks.com:11000/oozie/?user.name=root

# User [dr.who] is not authorized to view the logs for attempt_1446055912418_0006_m_000000_0 in log file [sandbox.hortonworks.com_45454]

# change to

http://sandbox.hortonworks.com:19888/jobhistory/logs/sandbox.hortonworks.com:45454/container_e04_1446055912418_0006_01_000002/attempt_1446055912418_0006_m_000000_0/root?user.name=root

# notice ?user.name=root at the end, that's the user executing the job

# more info at 
http://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-common/HttpAuthentication.html

# create user in Sandbox hdfs

sudo -u hdfs hdfs dfs -mkdir /user/root
sudo -u hdfs hdfs dfs -chown -R root:hdfs /user/root

# upload oozie workflow directory to hdfs user directory

hdfs dfs -put oozie/ ./

# to run an oozie job

oozie job -oozie http://sandbox.hortonworks.com:11000/oozie -config oozie/apps/pig/job.properties -run
