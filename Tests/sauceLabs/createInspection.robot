
*** Settings ***
Resource  ../../Resources/PageObjects/commonKeywords.robot
Resource  ../../Resources/PageObjects/Dashboard.robot
Resource  ../../Resources/PageObjects/CreateInspectionKeywords.robot
Resource  ../../Resources/PageObjects/mycaseKeywords.robot

Library    allure_robotframework

Test Setup  commonKeywords.Start TestCase
Test Teardown  commonKeywords.End TestCase

*** Variables ***

*** Test Cases ***
Verify Logout Functionality
    [Documentation]  This TestCase will verify Logout Functionality
    [Tags]  Functional

    Dashboard.Basic Login TestCase
    Dashboard.Page Contain Inspection
    Dashboard.Click on Person Logo and LogOff




Verify the Compliance with Regulation Flow
    [Documentation]  This testcase verifies the Compliance with Regulation Flow
    [Tags]  Functional
    Dashboard.Basic Login TestCase
    Dashboard.Click on Create inspection Button
    Dashboard.Page Contain Inspection
    CreateInspectionKeywords.Fill the information
    mycaseKeywords.Wait for MyCases Page

