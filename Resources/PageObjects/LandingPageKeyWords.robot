*** Settings ***
Library  SeleniumLibrary
Variables  ../Webelements.py

*** Variables ***

*** Keywords ***
Click on Add to Cart Button
    Press Keys  ${LandingPage_cart_button}  [Return]

Click on Cart Icon
    Wait Until Element Is Visible  ${LandingPage_shopping_cart}
    Press Keys  ${LandingPage_shopping_cart}  [Return]

Attach Screenshot On Failure
    ${screenshot_path}=    Capture Page Screenshot
    Attach File    ${screenshot_path}    name=Failure Screenshot    attachment_type=PNG
