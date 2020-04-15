*** Settings ***
Documentation       TWITTER LOGIN PAGE OBJECT MODEL
Resource            ../../common_resources/framework_variables.robot
Resource            ../../common_resources/globalLibraries.robot
Resource            ../../common_resources/keywords.robot
Variables           ../../common_resources/variables.py
Resource            ../resources/common.robot
Resource            ../resources/Keywords.robot
Resource            ../resources/locators.robot
Variables           ../resources/variables.py


*** Variables ***
${title}            Login


*** Keywords ***
Is Homepage
    [Documentation]         Do not miss adding documentation here
    Match Page Title        ${title}

Check Then Press
    [Arguments]         ${locator}
    [Documentation]     First check condition set from global variable then execute or skip
    Run Keyword if      '${CLICKLIKES}' == 'true'      Wait And Press Element       ${locator}


*** Keywords ***
Is Login Page
    Match Page Title        ${title}

LoginPage Keyword Dummy
    Log        LoginPage Keyword

Submit Login Form
    [Documentation]             All information from variables
    Wait And Input Text         ${UserName}      ${insta_user}
    Wait And Input Text         ${Password}      ${insta_pass}
    Wait And Press Element      ${LoginBtn}
    Log To Console      LOGIN DONE
