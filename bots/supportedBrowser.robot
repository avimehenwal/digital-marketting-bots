*** Settings ***
Documentation           Simple example using SeleniumLibrary.
Library                 SeleniumLibrary
Test Template           Get Page Title From Browser
Test Teardown           Close Browser
Force Tags              self-test

*** Variables ***
${LOGIN URL}            https://avimehenwal.in/
${BROWSER}              Firefox


*** Test Cases ***      BROWSER_NAME
Test On Chrome          Chrome
Test On Firefox         Firefox


*** Keywords ***
Get Page Title From Browser
    [Arguments]         ${BROWSER_NAME}
    [Timeout]           1m
    Log To Console      Opening Session On ${BROWSER_NAME}
    Open Browser        ${LOGIN URL}    ${BROWSER_NAME}
    Run Keyword And Ignore Error        Handle Alert
    ${title}=           Get Title
    Log To Console      ${title}
