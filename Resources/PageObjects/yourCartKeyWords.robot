*** Settings ***
Library  SeleniumLibrary
Variables  ../Webelements.py

*** Variables ***

*** Keywords ***
Click on CheckOut Button
    Wait Until Element Is Visible  ${YourCartcheckout_button}
    Press Keys  ${YourCartcheckout_button}  [Return]

Click on Remove Button
    Wait Until Element Is Visible  ${YourCartremove_button}
    Press Keys  ${YourCartremove_button}

Click on Continue Shopping Button
    Wait Until Element Is Visible  ${YourCartcontinueshopping_button}
    Press Keys  ${YourCartcontinueshopping_button}  [Return]

Attach Screenshot On Failure
    ${screenshot_path}=    Capture Page Screenshot
    Attach File    ${screenshot_path}    name=Failure Screenshot    attachment_type=PNG