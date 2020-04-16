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
    LOG ALL             Hearts CSS = ${HeartsCssLoc}

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
    # Cover Element           ${xpath}${Hearts}
    # @{es}=          Get WebElements         css:${HeartsCss}
    # FOR    ${index}    ${item}    IN ENUMERATE    @{es}
    FOR 	${index} 	IN RANGE      ${NUM_POSTS}
        SCROLL IN VIEWPORT        ${HeartsCss}       ${index}
        IMPLICIT WAIT 1
        ${likes}=       Get Text        ${HeartsCssLoc}
        LOG ALL         > LIKES = ${likes}
        CLICK                     ${HeartsCssLoc}
        IMPLICIT WAIT 1

        # Cover Element             css:${HeartsCss}[${index}]
    END

Continue Scrolling
    [Documentation]         Continue scrolling down, loadign new content and clicking likes
    ...     Todo: explore more concrete conditions where it fails
    @{es}=          Get WebElements         css:${HeartsCss}
    ${index}=       1
    LOG ALL                       ${NUM_POSTS}
	FOR 	${i} 	IN RANGE      ${NUM_POSTS}
		Log To Console      > ITERATION = ${i}
        Cover Element           ${es}[${index}]
		Implicit Wait 1
		Scroll In Viewport     ${HeartsCss}       ${index}
		# Implicit Wait 1
        # CLICK                   ${es}[${index}]
	END

<div dir="ltr" class="css-901oao r-1awozwy r-1re7ezh r-6koalj r-1qd0xha r-n6v787 r-16dba41 r-1h0z5md r-ad9z0x r-bcqeeo r-o7ynqc r-clp7b1 r-3s2u2q r-qvutc0"><div class="css-1dbjc4n r-xoduu5"><div class="css-1dbjc4n r-1niwhzg r-sdzlij r-1p0dtai r-xoduu5 r-1d2f490 r-xf4iuw r-u8s1d r-zchlnj r-ipm5af r-o7ynqc r-6416eg"></div><svg viewBox="0 0 24 24" class="r-4qtqp9 r-yyyyoo r-1xvli5t r-dnmrzs r-bnwqim r-1plcrui r-lrvibr r-1hdv0qi"><g><path d="M12 21.638h-.014C9.403 21.59 1.95 14.856 1.95 8.478c0-3.064 2.525-5.754 5.403-5.754 2.29 0 3.83 1.58 4.646 2.73.814-1.148 2.354-2.73 4.645-2.73 2.88 0 5.404 2.69 5.404 5.755 0 6.376-7.454 13.11-10.037 13.157H12zM7.354 4.225c-2.08 0-3.903 1.988-3.903 4.255 0 5.74 7.034 11.596 8.55 11.658 1.518-.062 8.55-5.917 8.55-11.658 0-2.267-1.823-4.255-3.903-4.255-2.528 0-3.94 2.936-3.952 2.965-.23.562-1.156.562-1.387 0-.014-.03-1.425-2.965-3.954-2.965z"></path></g></svg></div><div class="css-1dbjc4n r-xoduu5 r-1udh08x"><span class="css-901oao css-16my406 r-1qd0xha r-1gkfh8e r-1flse00 r-1un7vkp r-bcqeeo r-d3hbe1 r-1wgg2b2 r-axxi2z r-qvutc0"><span class="css-901oao css-16my406 r-1qd0xha r-ad9z0x r-bcqeeo r-qvutc0">4</span></span></div></div>