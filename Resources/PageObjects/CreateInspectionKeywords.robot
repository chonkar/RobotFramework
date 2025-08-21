*** Settings ***
Library  SeleniumLibrary
Variables  Webelements.py

*** Variables ***
${Inspection}  Inspection Solution
${Address}  India



*** Keywords ***
Fill the information
    Wait Until Element Is Visible  ${InspectionTypeDropDown}
    Press Keys  ${InspectionTypeDropDown}  [Return]
    Press Keys  ${InspectionTypeDropDownValues}  [Return]
    Wait Until Element Is Visible  ${ReasonOfInspection}
    Input Text  ${ReasonOfInspection}  ${Inspection}
    Click Element  ${CreateInspectionChooseTemplate}
    Press Keys  None  ARROW_DOWN
    Press Keys  None  ARROW_DOWN
    Press Keys  None  RETURN
    Sleep  4s
    Click Element  ${CreateInspectionEntityName}
    Press Keys  None  ARROW_DOWN
    Press Keys  None  ARROW_DOWN
    Press Keys  None  RETURN
    Input Text  ${CreateInspectionAddress}  ${Address}
    Click Element  ${CreateInspectionCheckbox1}
    Execute Javascript    window.scrollBy(0, 500)
    Sleep  3s
    Click Element  ${CreateInspectionCheckbox2}
    Sleep  3s
    Click Element  ${CreateInspectionCheckbox3}
    Press Keys  ${CreateInspectionSubmitButton}  [Return]
