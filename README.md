# Batch monitor the presence of files at a specified location
This repository documents productivity tools that can be utilised in daily routines to automate repetitive tasks.

## Description of what the batch script does.
This batch script is designed to monitor a specific folder for the most recent files that match certain patterns. It then checks if all the specified files are present before triggering a SQL Server Integration Services (SSIS) job.

This is useful when the availability of files for downstream processing is erratic. So this batch script, when activated, would just wait for the files to arrive and then subsequently start the SQLAgent job.

This script batch monitors the presence of files in folders and triggers an SQL agent to run on the specified server.
1. [Monitor Files In Folder](https://github.com/aduohene1990/TechTools/blob/aduohene-tools/20231015%20-%20monitor_files_for_sql_agent_job.bat)
2. [Monitor Specific Files Before Processing](https://github.com/aduohene1990/TechTools/blob/aduohene-tools/20231015%20-%20monitor_files_for_sql_agent_job.bat)
    This batch script is designed to monitor a specific folder for the most recent files that match certain patterns. It then checks if all the specified files are present before triggering a SQL Server Integration.
     Services (SSIS) job.
  ### Setting Variables:
  folderPath: Specifies the directory to monitor.
  ssisJobName: Indicates the name of the SQL Server Agent job that should be triggered.





