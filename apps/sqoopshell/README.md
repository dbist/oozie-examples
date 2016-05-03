# setup
sudo -u hdfs hdfs dfs -mkdir /user/yarn
sudo -u hdfs hdfs dfs -chown yarn:hdfs /user/yarn

# for sqoop to run as different user, need to set this property on every server so that
# yarn user can elevate to the user who's executing the sqoop command, otherwise will get tty not enabled error
vi visudo, enter the next line as last line of the file
yarn    ALL=(ALL)       NOPASSWD: ALL

