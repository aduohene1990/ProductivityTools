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
  ### 1. Setting Variables:
  folderPath: Specifies the directory to monitor.
  ssisJobName: Indicates the name of the SQL Server Agent job that should be triggered. 
  ### 2. File Patterns:
  The script defines different patterns (PMM_DB_IB01_, PMM_DB_IB02_, PMM_DB_ADJ_, PMM_DB_BR02_) to look for in the specified folder.
  
  ### 3. Main Loop (: loop):
    It initialises an empty foundFiles variable to keep track of found files.
    Then, it iterates through each pattern defined earlier.
    Within the pattern loop, it looks for the most recent file for each pattern using dir command and saves the file name to mostRecentFile. 
    It appends this file to foundFiles.
 
  ### 4. File Verification Loop:
    For each pattern, it checks if the respective file is found and outputs its name and extension if found.
    If any file is missing, it outputs a message indicating that it's waiting for all files and then loops back to the waiting section.
  ### 5. Triggering SSIS Job:
    If all the required files are found, it triggers the SSIS job using sqlcmd, executing the stored procedure msdb.dbo.sp_start_job to start the specified job.
  ### 6. Waiting and Looping:
    After each iteration, it waits for a specified time (e.g., 5 minutes using timeout) and then returns to the start of the loop to continue monitoring the folder.    
  





