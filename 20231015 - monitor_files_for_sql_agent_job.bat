rem This batch monitors the presence of files in folder before triggering a sql agent 
rem to run on the specified server

@echo off
setlocal enabledelayedexpansion

rem specify variables
set "folderPath=\\bhxappfs01\InhouseApps\UAT\Blue Yonder\Outbound"
set "ssisJobName=Dashboard_CostPriceDeltaOutput"
set "expectedFileCount=4" 

:loop
set "fileCount=0"
rem Loop through files in the folderPath
for %%F in ("%folderPath%\PMM_DB_*") do (
    if not "%%~aF"=="d" (
        set /a "fileCount+=1"
    )
)
rem Display file count
echo Files found: !fileCount!

rem check file count and trigger the ssis job
if !fileCount! geq %expectedFileCount% (
    echo Triggering the SSIS job...
    sqlcmd -S JUNEAU -Q "EXEC msdb.dbo.sp_start_job @job_name = '%ssisJobName%'"
)

:: Pause for 5minutes
timeout /t 300 > nul
goto loop
