*** Settings ***
Library  SeleniumLibrary
Variables  ../Webelements.py

Test Teardown    Run Keyword If    '${TEST STATUS}' == 'FAIL'    Attach Screenshot On Failure

*** Variables ***
&{userdetails}  first_name=Kavita  last_name=Chonkar  postcode=452016
#${continue_Button}  xpath://input[@value='CONTINUE']
#${Cancel_Button}  xpath://a[contains(text(),'CANCEL')]


*** Keywords ***
Enter User Details
    Wait Until Element Is Visible  id:first-name
    Input Text  id:first-name  ${userdetails.first_name}
    Input Text  id:last-name  ${userdetails.last_name}
    Input Text  id:postal-code  ${userdetails.postcode}

Click on Continue Button
    Press Keys  ${CheckoutYourInformationPage_continue_Button}  [Return]

Click on Cancel Button
    Press Keys  ${CheckoutYourInformationPage_Cancel_Button}  [Return]

Attach Screenshot On Failure
    ${screenshot_path}=    Capture Page Screenshot
    Attach File    ${screenshot_path}    name=Failure Screenshot    attachment_type=PNG

