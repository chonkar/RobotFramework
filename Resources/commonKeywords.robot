*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${env}  qa
&{browser}  Chrome=chrome  FireFox=ff
&{url}  dev=dev.saucedemo.com  qa=https://www.saucedemo.com/v1/  uat=uat.saucedemo.com

*** Keywords ***
Start TestCase
    [Arguments]  ${browser_name}=FireFox
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].${browser_name}.options.Options()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Open Browser  ${url.${env}} ${Browser.FireFox}
    Maximize Browser Window
    Sleep  2s

End TestCase
    Close Browser
