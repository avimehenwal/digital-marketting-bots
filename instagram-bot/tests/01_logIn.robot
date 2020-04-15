*** Settings ***
Documentation           Enter login Information to the form
...                     and submit before passing control to next page
Resource                ../resources/page_objects/LoginPage.robot
Force Tags 			    Instagram       login


*** Test Cases ***
Test Functio
    LoginPage Keyword Dummy

If Login Page
    Is Login Page

Fill Login Form And Submit
    Submit Login Form
