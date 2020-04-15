*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      https://twitter.com/explore
${BROWSER}        Firefox

*** Test Cases ***
Twitter Explore Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Handle Alert
    ${title}=     Get Title
    Log To Console      ${title}
