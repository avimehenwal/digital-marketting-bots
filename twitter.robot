
*** Settings ***
Documentation       Surf twitter and love tweets on timeline
Library             SeleniumLibrary
Suite Teardown      Close Browser

*** Variables ***
${LOGIN URL}      https://twitter.com/login
# ${LOGIN URL}      https://github.com/avimehenwal/twitter-bot
${BROWSER}        Firefox
${logInButton}      xpath:/html/body/div/div/div/div[2]/main/div/div/h1/span
${l1}               css:#react-root div > h1 > span
${l2}               css:#react-root > div > div > div.css-1dbjc4n.r-1pi2tsx.r-13qz1uu.r-417010 > main > div > div > form > div > div:nth-child(6) > label > div > div.css-1dbjc4n.r-18u37iz.r-16y2uox.r-1wbh5a2.r-1udh08x > div > input
${l3}               css:#react-root > div > div > div.css-1dbjc4n.r-1pi2tsx.r-13qz1uu.r-417010 > main > div > div > form > div > div:nth-child(7) > label > div > div.css-1dbjc4n.r-18u37iz.r-16y2uox.r-1wbh5a2.r-1udh08x > div > input
${l4}         css:#react-root > div > div > div.css-1dbjc4n.r-1pi2tsx.r-13qz1uu.r-417010 > main > div > div > form > div > div:nth-child(8) > div > div
${heart}        css:#react-root > div > div > div.css-1dbjc4n.r-18u37iz.r-1pi2tsx.r-13qz1uu.r-417010 > main > div > div > div > div > div > div:nth-child(2) > div > section > div > div > div > div:nth-child(1) > div > div > div > article > div > div:nth-child(3) > div.css-1dbjc4n.r-1oszu61.r-1gkumvb.r-1efd50x.r-5kkj8d.r-18u37iz.r-ahm1il.r-a2tzq0 > div:nth-child(3) > div > div
${links}         css:article > div > div.css-1dbjc4n.r-18u37iz.r-thb0q2 > div.css-1dbjc4n.r-1iusvr4.r-16y2uox.r-1777fci.r-5f2r5o.r-1mi0q7o > div:nth-child(1) > div > div > div.css-1dbjc4n.r-1d09ksm.r-18u37iz.r-1wbh5a2 > a
${jslinks}         article > div > div.css-1dbjc4n.r-18u37iz.r-thb0q2 > div.css-1dbjc4n.r-1iusvr4.r-16y2uox.r-1777fci.r-5f2r5o.r-1mi0q7o > div:nth-child(1) > div > div > div.css-1dbjc4n.r-1d09ksm.r-18u37iz.r-1wbh5a2 > a
${xlinks}        article > div > div.css-1dbjc4n.r-18u37iz.r-thb0q2 > div.css-1dbjc4n.r-1iusvr4.r-16y2uox.r-1777fci.r-5f2r5o.r-1mi0q7o > div:nth-child(1) > div > div > div.css-1dbjc4n.r-1d09ksm.r-18u37iz.r-1wbh5a2 > a
${z}           css:#react-root > div > div > div.css-1dbjc4n.r-18u37iz.r-1pi2tsx.r-13qz1uu.r-417010 > main > div > div > div > div > div > div.css-1dbjc4n.r-1jgb5lz.r-1ye8kvj.r-13qz1uu > div > div > section > div > div > div > div:nth-child(1) > div > div > div > article > div > div.css-1dbjc4n.r-18u37iz.r-thb0q2 > div.css-1dbjc4n.r-1iusvr4.r-16y2uox.r-1777fci.r-5f2r5o.r-1mi0q7o > div:nth-child(1) > div > div > div.css-1dbjc4n.r-1d09ksm.r-18u37iz.r-1wbh5a2 > a
${close}       css:#react-root > div > div > div.r-1d2f490.r-u8s1d.r-zchlnj.r-ipm5af.r-184en5c > div > div > div > div.css-18t94o4.css-1dbjc4n.r-1niwhzg.r-11mg6pl.r-sdzlij.r-1phboty.r-rs99b7.r-18kxxzh.r-1q142lx.r-1w2pmg.r-1n0xq6e.r-1mnahxq.r-1vsu8ta.r-aj3cln.r-1fneopy.r-o7ynqc.r-6416eg.r-lrvibr
${jsheart}      '#react-root > div > div > div.css-1dbjc4n.r-18u37iz.r-1pi2tsx.r-13qz1uu.r-417010 > main > div > div > div > div > div > div:nth-child(2) > div > section > div > div > div > div:nth-child(1) > div > div > div > article > div > div:nth-child(3) > div.css-1dbjc4n.r-1oszu61.r-1gkumvb.r-1efd50x.r-5kkj8d.r-18u37iz.r-ahm1il.r-a2tzq0 > div:nth-child(3) > div > div > div > svg'


*** Tasks ***
Twitter Login
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Implicit Wait
    Run Keyword And Continue On Failure      Handle Alert        action=ACCEPT
    # Log         ${message}
    Wait Until Page Contains Element     ${l1}    timeout=1m
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
    # Log Source

Scroll Homepage
    # Execute Javascript          window.scrollTo(0,2500)
    Implicit Wait
    ${q}=   Get WebElements     ${links}
    Log To Console     Link Webelements ${q}
    ${length}=      Get length    ${q}
    Log To Console       Webelements Length ${length}
    ${c}=       Get Element Count    ${links}
    Log To Console      Get Element Count ${c}
    ${all}=     Get All Links
    Log To Console     ALL links ${all}


    # just try to scroll through collected links
    # FOR    ${j}    IN    @{q}
    #     Implicit Wait
    #     ${o}=     Get Element Attribute     ${j}     title
    #     Log To Console     Attribute title = ${o}
    #     ${width}	${height} =	   Get Element Size     ${j}
    #     Log To Console     Size ${width} ${height}

    # END


    FOR    ${index}    ${i}    IN ENUMERATE    @{q}
        Log To Console      Enter Foor Loop
        Log To Console      ${index}
        Log To Console      ${i}
        Wait Until Page Contains Element       ${i}     timeout=30s
        Scroll     ${index}
        Wait Until Element Is Visible      ${i}
        Click Close
        ${t}=      Get Text     ${i}
        Log To Console       ${t}
        Set Focus To Element    ${i}
        Log To Console      DONE
        Click Element   ${i}

        # LIKE TWEET
        # Implicit Wait
        Wait Until Page Contains Element       ${heart}     timeout=30s
        Click Close
        Log To Console     click close
        Scroll To Heart
        # Scroll Element Into View            ${heart}
        # ${st}=    Run Keyword And Return Status      Scroll Element Into View            ${heart}
        # Run Keyword If    not ${st}     Execute Javascript       window.scrollTo(0,document.body.scrollHeight)
        # Execute Javascript       window.scrollTo(0,document.body.scrollHeight)
        Wait Until Element Is Visible      ${heart}
        Set Focus To Element    ${heart}
        # Click Element         ${heart}
        Go Back
    END

    # Log    Outside loop
    # loop 3 time
    # Execute Javascript          window.scrollTo(0,document.body.scrollHeight)
    # sleep time to load
    # Scroll Element Into View    ${l5}
    # HTML Tag article
    # [Teardown]    Close Browser


*** Keywords ***
Input Username
    [Arguments]    ${username}
    Input Text    username_field    ${username}
    a.r-p1n3y5 > div:nth-child(1)

Implicit Wait
    Run Keyword And Ignore Error       Wait Until Page Contains Element     ${l1}    timeout=10s

Click Close
    Run Keyword And Ignore Error      Click Element      ${close}

Scroll To Heart
    Log To Console        look for heart ${jsheart}
    Execute Javascript    document.querySelector(${jsheart}).scrollIntoView({ behavior: 'smooth', block: 'nearest'})


Scroll
    [Arguments]    ${index}
    # ${st}=    Run Keyword And Return Status      Scroll Element Into View            ${j}
    # Run Keyword If    not ${st}     Execute Javascript       window.scrollTo(0,document.body.scrollHeight)
    # Run Keyword If    not ${st}     Execute Javascript       window.scrollTo(0,document.body.scrollHeight)
    # Execute Javascript    window.document.evaluate("${j}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true)
    # ${count}=    Get Element Count    ${links}
    Log To Console    scrolling page to ${index} ${jslinks}
    Execute Javascript    document.querySelectorAll('${jslinks}')[${index}].scrollIntoView({ behavior: 'smooth', block: 'center'})
        # ${WebElement}=      Execute Javascript    return document.querySelectorAll('${jslinks}')[${index}].scrollIntoView({ behavior: 'auto', block: 'center'})
        # Log To Console      ${WebElement}
        # Execute Javascript    console.log(element)
        # ${WebElement}=      Execute Javascript    return window.element
        # Execute Javascript    window.element.scrollIntoView({ behavior: 'auto', block: 'center'})
    # ${st}=      Execute Javascript    console.log('Element')
    # Log To Console       ${st}