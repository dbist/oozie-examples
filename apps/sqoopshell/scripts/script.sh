echo "I AM: `whoami`"
echo "Running On: `hostname`"
echo "CWD: `pwd`"
echo "Can I see these clients? Hive = `which hive`, Sqoop = `which sqoop`"
echo "`ls -l /usr/hdp/current/ | head -n 5`"
# sqoop list-tables --connect jdbc:postgresql://sandbox.hortonworks.com/ambari --username ambari -password bigdata

# yarn user executes the sqoop command, naturally yarn user has no access to /user/root directory that will contain the staging directory 
# so executing the sqoop command as root user or any regular user for that matter will work, because now the real user and the user executing
# sqoop command is the same user!
sudo -u root sqoop import --connect jdbc:postgresql://sandbox.hortonworks.com/ambari --username ambari -password bigdata --target-dir /tmp/sqoopoutput

