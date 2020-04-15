*** Settings ***
Documentation           Concluding steps
Resource                ../page_objects/LoginPage.robot
Force Tags 			    ${platform}     twitter     teardown
# Suite Teardown          Run Suite Teardown


*** Test Cases ***
Test Case 1
    [Documentation]         Automation Strategy
    [Tags]                  bot
    Some Keyword


*** Keywords ***