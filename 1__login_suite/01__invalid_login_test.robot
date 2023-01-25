*** Settings ***
Documentation       This file contains test cases related to invalid login
Resource    ../resource/base/common_functionalities.resource
Test Setup      Launch Browser and Navigate to Url
Test Teardown       Close Browser
Library     DataDriver      file=../test_data/orange_data.xlsx      sheet_name=InvalidLoginTest

Test Template       Invalid Login Template

*** Test Cases ***

TC1


*** Keywords ***
Invalid Login Template

    [Arguments]   ${username}   ${password}      ${expected_error}
    Input Text    name=username     ${username}
    Input Text    name=password     ${password}
    Click Element    xpath=//button[contains(normalize-space(),'Login')]
    Element Should Contain    xpath=//p[contains(normalize-space(),'Invalid')]      ${expected_error}




