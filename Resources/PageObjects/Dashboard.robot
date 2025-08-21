*** Settings ***
Library  SeleniumLibrary
Variables  Webelements.py

*** Variables ***
${username}  samuel@gmail.com
${password}  Abc@123




*** Keywords ***
Basic Login TestCase
    Input Text  ${LoginPage_user_name}  ${username}
    Input Text  ${LoginPage_password}  ${password}
    Wait Until Element Is Visible  ${LoginPage_login_button}
    Press Keys  ${LoginPage_login_button}  [Return]

Page Contain Inspection
    Wait Until Element Is Visible  ${DashboardCreateInspectionLabel}
    Page Should Contain Element  ${DashboardCreateInspectionLabel}

Click on Create inspection Button
    Wait Until Element Is Visible  ${DashboardComplianceWithRegulation}
    Press Keys  ${DashboardComplianceWithRegulation}  Return

Click on Person Logo and LogOff
    Press Keys  ${DashboardPagePersonLogo}  [Return]
    Press Keys  ${DashboardSignOutButton}  [Return]


