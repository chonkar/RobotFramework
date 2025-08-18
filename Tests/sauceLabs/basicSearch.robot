
*** Settings ***
Resource  ../../Resources/commonKeywords.robot
Resource  ../../Resources/sauceLabsKeywords.robot
Resource  ../../Resources/PageObjects/LandingPageKeyWords.robot
Resource  ../../Resources/PageObjects/yourCartKeyWords.robot
Resource  ../../Resources/PageObjects/CheckOut_YourInformation.robot
Library    allure_robotframework

Test Setup  commonKeywords.Start TestCase
Test Teardown  commonKeywords.End TestCase

*** Variables ***

*** Test Cases ***
Verify Login Functionality
    [Documentation]  This testcase verifies the Login Functionality
    [Tags]  Functional

    sauceLabsKeywords.Basic Login TestCase
    sauceLabsKeywords.Select the Filter
    LandingPageKeyWords.Click on Add to Cart Button
    LandingPageKeyWords.Click on Cart Icon
    yourCartKeyWords.Click on CheckOut Button
    CheckOut_YourInformation.Enter User Details
    CheckOut_YourInformation.Click on Continue Button


Verify Continue Shopping Button is navigating to correct Page
    [Documentation]  This testcase verifies the Login Functionality
    [Tags]  Functional

    sauceLabsKeywords.Basic Login TestCase
    sauceLabsKeywords.Select the Filter
    LandingPageKeyWords.Click on Add to Cart Button
    LandingPageKeyWords.Click on Cart Icon
    yourCartKeyWords.Click on Continue Shopping Button
    sauceLabsKeywords.Page Contain Product
