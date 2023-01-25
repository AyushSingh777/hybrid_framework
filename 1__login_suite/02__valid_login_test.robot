*** Settings ***
Documentation       This file contains test cases related to valid login
Resource    ../resource/base/common_functionalities.resource

Test Setup      Launch Browser and Navigate to Url
Test Teardown       Close Browser
Test Template       Valid Login Template



*** Test Cases ***

TC1     Admin      admin123     Dashboard
TC2     Admin1      admin123     Dashboard

*** Keywords ***

Valid Login Template

    [Arguments]   ${username}   ${password}      ${expected_header}
    Input Text    name=username     ${username}
    Input Text    name=password     ${password}
    Click Element    xpath=//button[contains(normalize-space(),'Login')]
    Element Should Contain    xpath=//h6[contains(normalize-space(),'Dash')]     ${expected_header}
