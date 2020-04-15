*** Settings ***
Documentation       LogIn Page Object Model
...                 Only page related variable allowed here
...                 Use locators.robot for adding locators
...                 This is mostly for Keywords
Resource            ../common.robot
Resource            ../locators.robot
Resource            ../SharedKeywords.robot
Variables           ../variables.py

*** Variables ***


*** Keywords ***
Is Login Page
    Match Page Title        ${title}

LoginPage Keyword Dummy
    Log        LoginPage Keyword

Submit Login Form
    Wait And Input Text        ${username}      ${accounts}
    Wait And Input Text        ${password}      ${insta_pass}
    Wait And Press Button      ${click_login}
    Log To Console      LOGIN DONE

