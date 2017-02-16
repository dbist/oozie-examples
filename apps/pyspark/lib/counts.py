from pyspark import SparkContext, SparkConf
import sys

datain = sys.argv[1]
dataout = sys.argv[2]

conf = SparkConf().setAppName('counts_with_pyspark')
sc = SparkContext(conf=conf)

text_file = sc.textFile(str(datain))
counts = text_file.flatMap(lambda line: line.split(" ")) \
             .map(lambda word: (word, 1)) \
             .reduceByKey(lambda a, b: a + b)
counts.saveAsTextFile(str(dataout))
