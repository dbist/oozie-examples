set hcat.bin /usr/bin/hcat;
sql show tables;

A = LOAD 'sample_08' USING org.apache.hive.hcatalog.pig.HCatLoader();
B = LIMIT A 5;
DUMP B;
