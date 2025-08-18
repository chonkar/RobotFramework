*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${env}  qa
&{browser}  Chrome=chrome  FireFox=ff
&{url}  dev=dev.saucedemo.com  qa=https://www.saucedemo.com/v1/  uat=uat.saucedemo.com

*** Keywords ***
Start TestCase
    Open Browser  ${url.${env}}  ${Browser.FireFox}
    Sleep  3s
    Maximize Browser Window


End TestCase
    Close Browser
