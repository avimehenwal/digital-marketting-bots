*** Settings ***
Documentation           Outreach Strategy
...                     Like first {N} visible posts on homescreen
Resource                ../resources/page_objects/Homepage.robot
Force Tags 			    Instagram       homepage


*** Test Cases ***
Test Functio
    Homepage Keyword Dummy

If Homepage
    Is Homepage

