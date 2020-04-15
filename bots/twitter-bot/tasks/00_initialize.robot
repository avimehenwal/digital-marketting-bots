*** Settings ***
Documentation           Make browser available to all subsequent tests/tasks
Resource                ../page_objects/LoginPage.robot
Force Tags 			    ${platform}     setup
Default Tags            twitter



*** Test Cases ***

Ready Browser
    Set Selenium Timeout	        ${TIMEOUT}
    Set Selenium Implicit Wait	    ${TIMEOUT}
    Set Selenium Speed	            ${SPEED}

    Open Browser                    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Silently Handle Alert


# END