The project goal is to provide a service for tracking changes in the database. This project aims to target specific tables and check if the tables were updated in a specified time interval. The user can execute one script with the arguments of table name, column name, and time interval. Then the server will keep checking for updates at the time interval for that column of the table. This is efficient in making sure the database is being updated.

Project Overview
Service: Database Change Tracking
Tracking changes in database tables and columns within specific time intervals. User specifies the table name, column name, and time interval. There are 5 scripts that are interconnected. 
1. Cron Job Script: This is the executable script that user runs. It takes three arguments Table Name, Column Name, and Time Interval (in minutes). The Cron job script can be modified to change time interval specification by the user. This script calls the change script with the two arguments of table name and column name.
2. Change Script: This runs the entire change tracking process. It takes two arguments, Table Name and Column Name. This script first calls the database using the SQL Connection script and provides it will the Query argument using the table and column names. The result of this query is saved in a text file specific to the table name and column name. There are two text files, latest updates, and last updates. The script then compares the two values. If there is a change detected or not, the script saves a message to the messages text file in the /var/www/html/ folder. This script also logs the activity of the cron job execution as well as if the update change was successful or not.
3. SQL Connection Script: This establishes connection with the SQL database. It takes Query as the argument. This is editable by the admin group only due to data sensitivity. This can be modified to server and database specifications.
4. Project PHP Script: This is the script for the web server. It displays text from the messages file that is updated by the Change Script. It uses a fetch message script to get the message.
5. Fetch Message Script: This script fetches the messages inserted into the message text file by the Change Script.



Working of Service

Test Run: $ bash cron.sh AirlockChamber RecordTime 1

Tracking RecordTime column from AirlockChamber
![alt text](https://github.com/harsiratgrewal/DB_Change_Tracker/blob/images/Before.png?raw=true)


Inserting a row to the AirlockChamber table
 

After a change was detected
 
