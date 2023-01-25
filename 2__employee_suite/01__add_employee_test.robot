*** Settings ***
Documentation       This file contains test cases for add valid employee
...     records
Resource    ../resource/base/common_functionalities.resource

Test Setup      Launch Browser and Navigate to Url
Test Teardown       Close Browser
Library     DataDriver      file=../test_data/orange_data.xlsx      sheet_name=addEmployeetest
Test Template       add valid Employee Template

*** Test Cases ***
add valid Epmloyee Test_${test_name}



*** Keywords ***
add valid Employee Template

    [Arguments]   ${username}   ${password}     ${firstName}        ${middleName}       ${lastName}      ${expected_header}   ${expected_value}

    Input Text    name=username    ${username}
    Input Text    name=password    ${password}
    Click Element    xpath=//button[contains(normalize-space(),'Login')]
    Click Element    xpath=//span[contains(normalize-space(),'PIM')]
    Click Element    link=Add Employee
    Input Text    name=firstName    ${firstName}
    Input Text    name=middleName   ${middleName}
    Input Text    name=lastName     ${lastName}
    Sleep    3s
    Click Element    xpath=//button[contains(normalize-space(),'Save')]
    Element Should Contain    xpath=//h6[contains(normalize-space(),'${firstName}')]    ${expected_header}
#    Element Should Contain    xpath=//input[@name='']    jack
    Element Attribute Value Should Be    xpath=//input[@name='firstName']    value       ${expected_value}


