*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${env}        qa
&{browser}    Chrome=chrome    Firefox=firefox
&{url}        dev=https://dev.saucedemo.com
...           qa=https://www.saucedemo.com
...           uat=https://uat.saucedemo.com

*** Keywords ***
Start TestCase
    [Arguments]    ${browser_name}=Chrome
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].${browser_name}Options()    sys, selenium.webdriver
    
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    
    ${profile_dir}=    Evaluate    __import__('tempfile').mkdtemp()    modules=tempfile
    Call Method    ${options}    add_argument    ${"--user-data-dir=%s" % profile_dir}

    Create WebDriver    Chrome    chrome_options=${options}
    Go To    ${url["${env}"]}
    Maximize Browser Window

End TestCase
    Close Browser
