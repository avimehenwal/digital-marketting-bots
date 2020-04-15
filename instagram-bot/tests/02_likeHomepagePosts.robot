*** Settings ***
Documentation           Outreach Strategy
...                     Like first {N} visible posts on homescreen
Resource                ../resources/page_objects/Homepage.robot
Force Tags 			    Instagram       homepage


*** Test Cases ***
Test Functio
    [Tags]           test-structure
    Homepage Keyword Dummy

If Homepage
    [Tags]          check
    Is Homepage

Prepare Homepage
    [Tags]          popup
    Ready Page
