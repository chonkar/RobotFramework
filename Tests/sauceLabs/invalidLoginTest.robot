*** Settings ***
Resource  ../../Resources/PageObjects/commonKeywords.robot
Library  DataDriver  ../../TestData/Testdata.csv
Variables  ../../Resources/PageObjects/Webelements.py
Library    Collections


Test Setup  commonKeywords.Start TestCase
Test Teardown  commonKeywords.End TestCase
Test Template    Verify Login With Invalid Credentials

*** Test Cases ***
Verify Login With Invalid Credentials  ${username}  ${password}

*** Keywords ***
Verify Login With Invalid Credentials
    [Arguments]    ${username}    ${password}

    Input Text    ${LoginPage_user_name}    ${username}    clear=True
    Input Text    ${LoginPage_password}     ${password}    clear=True

    # Click login
    Press Keys    ${LoginPage_login_button}    [Return]

