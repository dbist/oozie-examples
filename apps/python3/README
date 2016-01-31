#### Make sure python3 is installed, assuming Python3 is installed in /usr/local/bin/python3.3

```
hdfs dfs -put oozie/ ./
oozie job -oozie http://sandbox.hortonworks.com:11000/oozie -config oozie/apps/python3/job.properties -run
```

#### then navigate to http://sandbox.hortonworks.com:19888, pick the appropriate job for your workflow and you should see below

```
>>> Invoking Shell command line now >>

Stdoutput who am I? yarn
Stdoutput this is a Python script
Stdoutput Python Interpreter Version: 3.3.3 (default, Jan 31 2016, 17:36:09) 
Stdoutput [GCC 4.4.7 20120313 (Red Hat 4.4.7-16)]
Exit code of the Shell command 0
<<< Invocation of Shell command completed <<<
```
