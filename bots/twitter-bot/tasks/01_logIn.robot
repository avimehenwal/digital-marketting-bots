*** Settings ***
Documentation           Enter login Information to the form
...                     and submit before passing control to next page
Resource                ../page_objects/LoginPage.robot
Force Tags 			    ${platform}     twitter     login
Suite Setup             Is Login Page


*** Test Cases ***
Fill Login Form And Submit
    [Tags]          form
    Submit Login Form
