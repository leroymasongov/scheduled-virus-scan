# this code sets up the task defined in 

# Define the path and filename of the PowerShell script
$scriptPath = '.\StartFullScan.ps1'

# Define the trigger for weekly execution (Sunday at 1:00 AM)
$taskTrigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Sunday -At 1am

# Define the action to run the PowerShell script
$taskAction = New-ScheduledTaskAction -Execute "PowerShell" -Argument "-NoProfile -ExecutionPolicy Bypass -File '$scriptPath'"

# Register the scheduled task
Register-ScheduledTask -TaskName "WeeklyVirusScan" -Trigger $taskTrigger -Action $taskAction