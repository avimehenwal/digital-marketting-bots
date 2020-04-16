*** Settings ***
Documentation       Homepage Page Object Model
...                 > kindly use only page related variable allowed here
...                 > use locators.robot for adding all locators
...                 This is mostly for local data and keywords
Resource            ../../common_resources/framework_variables.robot
Resource            ../../common_resources/globalLibraries.robot
Resource            ../../common_resources/keywords.robot
Variables           ../../common_resources/variables.py
Resource            ../resources/common.robot
Resource            ../resources/Keywords.robot
Resource            ../resources/locators.robot
Variables           ../resources/variables.py


*** Variables ***
${matchtext}        avimehenwal
${popup_text}       Not Now
${title}            Twitter
${xpath}            xpath:
# //div[contains(@aria-label, 'Timeline: Your Home Timeline')]/div/div/div/div/div/div/article/div/div[2]/div[2]/div[2]/div[3]/div[3]

*** Keywords ***
Is Homepage
    MATCH TITLE         ${title}

Check Then Press
    [Arguments]         ${locator}
    [Documentation]     First check condition set from global variable then execute or skip
    Run Keyword if      '${CLICKLIKES}' == 'true'      Wait And Press Element       ${locator}

Log Page locators
    LOG ALL             ArticlesRoot = ${xpath}${ArticlesRoot}
    LOG ALL             Comments = ${xpath}${Comments}
    LOG ALL             Retweets = ${xpath}${Retweets}
    LOG ALL             Hearts = ${xpath}${Hearts}
    LOG ALL             Hearts CSS = ${HeartsCss}

Locate Hearts
    Wait Until Page Contains Element            ${xpath}${Hearts}
    Page Should Contain Element                 ${xpath}${Hearts}
    ${length}=	    Get Length	                ${xpath}${Hearts}
    Log To Console                              Hearts on page=${length}
    # Hearts on page=137, but on browser they are 7-8 ?

    # Should Be Equal As Integers	${length}	2
    # Scroll Into View
    # For Loop ITEM {N} times
    #     Click action
    # end

    # 'WebElement' object is not iterable
    Cover Element           ${xpath}${Hearts}
    @{es}=          Get WebElements         ${xpath}${Hearts}
    FOR    ${index}    ${item}    IN ENUMERATE    @{es}
        Log To Console                ${index} ${item}
        SCROLL IN VIEWPORT        ${HeartsCss}       ${index}
        # IMPLICIT WAIT 1
    END