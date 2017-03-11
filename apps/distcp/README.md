#### nameservices must be configured in both clusters
#### oozie proxy user must be configured on both clusters
#### distcp with insecure and secure clusters is not well supported, hence ipc.client.fallback-to-simple-auth-allowed=true takes no effect
#### you have to enable the property globally on HDFS side of the secure cluster.
#### it's best to keep two clusters both secure or both insecure.
