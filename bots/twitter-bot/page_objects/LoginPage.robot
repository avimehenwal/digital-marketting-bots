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
${title}                    Login



*** Keywords ***
Is Login Page
    [Documentation]         Do not miss adding documentation here
    MATCH TITLE             ${title}

Submit Login Form
    [Documentation]         All information from variables
    INPUT                   ${LoginUserName}         ${twitter_bot}[0][user]
    INPUT                   ${LoginPassword}         ${twitter_bot}[0][pass]
    CLICK                   ${LoginBtn}
    Log To Console          LOGIN DONE
