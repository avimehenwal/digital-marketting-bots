*** Settings ***
Documentation           Add all Homepage relates tests/tasks
Resource                ../page_objects/Homepage.robot
Suite Setup             Ready Homepage
Force Tags 			    ${platform}     twitter     homepage


*** Test Cases ***
Test Case 1
    [Documentation]         Automation Strategy
    [Tags]                  bot
    Some Keyword


*** Keywords ***
Ready Homepage
    [Tags]          check       popup
    Is Homepage
    Ready Page
