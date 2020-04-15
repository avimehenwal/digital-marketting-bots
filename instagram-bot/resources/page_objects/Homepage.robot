*** Settings ***
Documentation       Homepage Page Object Model
...                 Only page related variable allowed here
...                 Use locators.robot for adding locators
...                 This is mostly for Keywords
Resource            ../common.robot
Resource            ../locators.robot
Resource            ../SharedKeywords.robot
Variables           ../variables.py


*** Variables ***
${matchtext}      	smoothengineer

*** Keywords ***
Is Homepage
    Match Page Title        ${title}

Homepage Keyword Dummy
    Log        Homepage Keyword

Ready Page
    Wait Until Page Contains Element        ${Popup}
    Focus And Click                         ${Popup}
    Run Keyword and Ignore Error    Wait Until Page Contains    ${matchtext}
	Scroll To Botton

