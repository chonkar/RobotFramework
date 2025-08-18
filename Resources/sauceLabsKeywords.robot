*** Settings ***
Library  SeleniumLibrary
Variables  Webelements.py

*** Variables ***
${username}  standard_user
${password}  secret_sauce
${ProductText}  Products



*** Keywords ***
Basic Login TestCase
    Input Text  ${LoginPage_user_name}  ${username}
    Input Text  ${LoginPage_password}  ${password}
    Wait Until Element Is Visible  ${LoginPage_login_button}
    Press Keys  ${LoginPage_login_button}  [Return]
    Wait Until Element Is Visible  ${LoginPage_sort_container}
    Page Should Contain  ${ProductText}

Select the Filter
    Wait Until Element Is Visible  ${LoginPage_sort_container}
    Select From List By Index  ${LoginPage_sort_container}  2

Page Contain Product
    Wait Until Element Is Visible  ${LoginPage_sort_container}
    Page Should Contain  Products
