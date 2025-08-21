*** Settings ***
Library  SeleniumLibrary
Variables  Webelements.py

*** Variables ***
${Inspection}  Inspection Solution



*** Keywords ***
Wait for MyCases Page
    Page Should Contain Element  ${MyCasesAaseyaInspectionSolution}