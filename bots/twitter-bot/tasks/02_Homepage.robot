*** Settings ***
Documentation           Add all Homepage relates tests/tasks
Resource                ../page_objects/Homepage.robot
Suite Setup             Is Homepage
Force Tags 			    ${platform}     twitter     homepage


*** Test Cases ***
Print Locators
    Log Page locators

Traverse Hearts
    [Documentation]         Locate Hearts on homepage
    [Tags]                  bot
    Locate Hearts


*** Keywords ***
