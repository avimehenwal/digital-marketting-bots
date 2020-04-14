
*** Settings ***
Documentation     Surf twitter and love tweets on timeline
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      https://twitter.com/login
# ${LOGIN URL}      https://github.com/avimehenwal/twitter-bot
${BROWSER}        Firefox
${logInButton}      xpath:/html/body/div/div/div/div[2]/main/div/div/h1/span
${l1}               css:#react-root div > h1 > span
${l2}               css:#react-root > div > div > div.css-1dbjc4n.r-1pi2tsx.r-13qz1uu.r-417010 > main > div > div > form > div > div:nth-child(6) > label > div > div.css-1dbjc4n.r-18u37iz.r-16y2uox.r-1wbh5a2.r-1udh08x > div > input
${l3}               css:#react-root > div > div > div.css-1dbjc4n.r-1pi2tsx.r-13qz1uu.r-417010 > main > div > div > form > div > div:nth-child(7) > label > div > div.css-1dbjc4n.r-18u37iz.r-16y2uox.r-1wbh5a2.r-1udh08x > div > input
${l4}         css:#react-root > div > div > div.css-1dbjc4n.r-1pi2tsx.r-13qz1uu.r-417010 > main > div > div > form > div > div:nth-child(8) > div > div
*** Tasks ***
Twitter Login
    Open Browser    ${LOGIN URL}    ${BROWSER}
    ${message} =	Handle Alert        action=ACCEPT
    Wait Until Page Contains Element     ${l1}    timeout=1m
    Log         ${message}
    ${title}=   Get Title
    Log         ${title}
    Wait Until Page Contains        Twitter    timeout=1m
    Page Should Contain            Twitter
    # Get Text       ${logInButton}
    ${e}=       Get WebElements     ${l1}
    ${t}=       Get Text       ${l1}
    Log         ${t}
    Input Text          ${l2}    ${user}   clear=True
    Input Text          ${l3}    ${pass}   clear=True
    Page Should Contain Element         ${l4}
    Wait Until Element Is Enabled       ${l4}
    Click Element        ${l4}
    Wait Until Page Contains        Home
    # Input Username    demo
    # Input Password    mode
    # Submit Credentials
    # Welcome Page Should Be Open
    Log Source
    # [Teardown]    Close Browser

*** Keywords ***
Input Username
    [Arguments]    ${username}
    Input Text    username_field    ${username}
    a.r-p1n3y5 > div:nth-child(1)


