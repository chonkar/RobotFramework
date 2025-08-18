@echo off
setlocal

:: Go to the project folder
cd /d D:\RobotFramework_AIS

echo === Cleaning old results ===
rmdir /s /q Results\robot_results 2>nul
rmdir /s /q Results\allure_results 2>nul
rmdir /s /q Results\allure_report 2>nul

echo === Running Robot Framework Tests ===
robot -d Results\robot_results --listener allure_robotframework;Results\allure_results Tests

echo === Generating Allure Report ===
allure generate Results\allure_results --clean -o Results\allure_report

echo === Opening Allure Report in Browser ===
start "" Results\allure_report\index.html

echo === All Done! Report available in Results\allure_report ===

pause
endlocal