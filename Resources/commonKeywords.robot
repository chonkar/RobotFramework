*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${env}        qa
&{browser}    Chrome=chrome    Firefox=firefox
&{url}        dev=https://dev.saucedemo.com
...           qa=https://www.saucedemo.com/v1/
...           uat=https://uat.saucedemo.com

*** Keywords ***
Start TestCase
    [Arguments]    ${browser_name}=Firefox
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].${browser_name}Options()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Open Browser   ${url["${env}"]}    ${browser["${browser_name}"]}    options=${options}
    Maximize Browser Window

End TestCase
    Close Browser
