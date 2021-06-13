#!/bin/bash

log_path=/home/ritesh/Hadoop/log
log_file=$log_path/$(basename $0 | sed 's/\..*//g').$(date +"%Y%m%d").log

feed_file=/home/ritesh/Desktop/HRDataset_v14.csv

#---Feed File Check---#

if [ -f $feed_file ];
then
	echo "Feed Available"
else
	echo "Feed still not available"
	exit
fi

#---Zero Record Check---#

count=$(cat $feed_file | wc -l)

if [ $count -gt 2 ];
then
	echo "File is ok and ready to get copied to HDFS"
else
	echo "Low Record count, please check feed file"
	exit;		
fi

#---copying feed file from Local to HDFS---#

hdfs dfs -copyFromLocal /home/ritesh/Desktop/HRDataset_v14.csv /hdfs_files/ > $log_file

#---Python Script to create sub dataset from feed file---#

python /home/ritesh/Python/sub_dataset_creation.py

#---Runing Hive Script to load feed data to Hive table---#

hive -f /home/ritesh/Desktop/sample.sql >> $log_file

if [ $? -eq 0 ]:
then 
	echo "Data Ingestion completed successfully, removing temp dataset"
	rm -f /home/ritesh/Desktop/HRdata_temp.csv
else
	echo "Data Ingestion failed"
fi

exit
