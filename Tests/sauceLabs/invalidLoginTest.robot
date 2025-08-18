*** Settings ***
Resource  ../../Resources/commonKeywords.robot
Library  DataDriver  ../../TestData/Testdata.csv
Variables  ../../Resources/Webelements.py


Suite Setup  commonKeywords.Start TestCase
Suite Teardown  commonKeywords.End TestCase
Test Template    Verify Login With Invalid Credentials

*** Test Cases ***
Verify Login With Invalid Credentials  ${username}  ${password}

*** Keywords ***
Verify Login With Invalid Credentials
    [Arguments]  ${username}  ${password}
    Input Text  ${LoginPage_user_name}  ${username}
    Input Text  ${LoginPage_password}  ${password}
    Wait Until Element Is Visible  ${LoginPage_login_button}
    Press Keys  ${LoginPage_login_button}  [Return]

