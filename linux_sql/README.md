# Linux_Usage_Agent

## Introduction
**Linux_Host_Agent** is implemented to assist infrastructure managers for keeping track of hardware specifications and resource usage. It provides them with realtime quality data which helps to optimize efficiency and preplan future growth.
## Architecture and Design
<!--![](Linux_Usage_Agent_fig.png)-->
![](linux-proj-1.svg)
There are two tables in our database host_info and host_usage
1. **host_info** contains hardware specifications for each node attached to the cluster.It contains values such as hostname,cpu_number its architecture, cpu model and its speed ,memory size, L2 cache size and timestamp.
2. **host_usage**  contains each node's performance data. which is being collected every minute. Data values include a timestamp, free memory, CPU idle, CPU kernel, disk input-output.

To gather data and add into above mentioned  tables we have two bash scripts host_info.sh and host_usage.sh 
host_info.sh is only run once to get the information of the system at start
host_usage.sh runs every minute using a scheduler in order to collect host usage data and insert it into the database.
To schedule host_usage run every minute, we create a crontab job which runs the host_usage.sh every minute
## Usage
1) Script init.sh  initialize database and create tables in postgresql database.It first create database host_agent and then creates table host_info and host_usage in created database.
2) Scrip host_info.sh takes the values of host node such as node_name its cpu model its memeory size and also take timesatmp as input and run a DML script inside it to insert all that information into table host_info which is in postgresql database. 
3) Script host_usage.sh runs every minute it takes host nodes usage information such as cpu usage memory usage and space available.It add timesatmps with it and then run DML script to enter these values in table host_usage in postgresql database 
4) crontab setup
``` bash
#crontab scheduler script is developed using online crontab generator tools
# absolute path and logfile path is also provided
crontab -e
# generated code is pasted in text editor which appears after running above command
# make sure the bash file you runing a schedule on have executable permissions
# if not give permissions using command
chmod u+x filename
# or 
chmod 777 filename
```
## Improvements
There are several improvements which can be made in this application some of them are listed below.
1. An Emergency Alarm can be implemented which notify whenever system has reached a critical usage threshhold. Which helps to add more nodes to keep load undercontrol.
2. More usage statistics coould be logged which helps create better picture of cluster performance.
3. Automattic report generation can be added for executives for daily,weekly,monthly and yearly basis.
4. Capability to automatically detect hardware updates and log it can be added.
5. SQL Table can be normalized to query data efficently
