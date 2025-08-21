*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${env}        qa
&{browser}    Chrome=chrome    Firefox=firefox
&{url}        dev=https://dev.saucedemo.com
...           qa=http://52.140.64.177:9099/
...           uat=https://uat.saucedemo.com

*** Keywords ***
Start TestCase
    [Arguments]    ${browser_name}=Chrome
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].${browser_name}Options()    sys, selenium.webdriver
    
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    
    ${profile_dir}=    Evaluate    __import__('tempfile').mkdtemp()    modules=tempfile
    ${user_data_arg}=    Set Variable    --user-data-dir=${profile_dir}
    Call Method    ${options}    add_argument    ${user_data_arg}

    Create WebDriver    Chrome    options=${options}
    Go To    ${url["${env}"]}
    Maximize Browser Window

End TestCase
    Close Browser
