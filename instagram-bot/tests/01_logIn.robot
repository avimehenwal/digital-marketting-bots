*** Settings ***
Documentation           Enter login Information to the form
...                     and submit before passing control to next page
Resource                ../resources/page_objects/LoginPage.robot
Force Tags 			    Instagram       login


*** Test Cases ***
If Login Page
    [Tags]          check
    Is Login Page

Fill Login Form And Submit
    [Tags]          form
    Submit Login Form
