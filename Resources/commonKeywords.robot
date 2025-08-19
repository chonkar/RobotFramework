*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${env}  qa
&{browser}  Chrome=chrome  FireFox=ff
&{url}  dev=dev.saucedemo.com  qa=https://www.saucedemo.com/v1/  uat=uat.saucedemo.com

*** Keywords ***
Start TestCase
    [Arguments]  ${browser_name}=FireFox
    Open Browser  ${url.${env}} ${Browser.FireFox}  headless=True
    Maximize Browser Window
    Sleep  2s

End TestCase
    Close Browser
