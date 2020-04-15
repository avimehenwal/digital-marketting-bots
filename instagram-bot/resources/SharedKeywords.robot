*** Settings ***
Documentation               Only Shared Keywords
...                         Available to all page objects
...                         Kindly do not add variables here

*** Keywords ***
Match Page Title
	[Arguments]			${expected}
	[Documentation]		Useful to check if we are on right page
    ${title}=			Get Title
    Should Be Equal     ${title}		${expected}

Silently Handle Alert
	[Documentation]		Supress language change check dialog box
	...					Add exact message here
	...					Only seen at entrypoint window
	Run Keyword and Ignore Error      Handle Alert        action=ACCEPT


# -------------------------------------------------------------FORM FILLING
Wait And Input Text
    [Arguments]         ${locator}      ${text}
    [Documentation]     Wait, then look for element before filling
    Wait Until Page Contains Element        ${locator}
    Page Should Contain Element             ${locator}
    Input Text          ${locator}    ${text}       clear=True

Wait And Press Button
    [Arguments]         ${locator}
    [Documentation]     Wait, then look for element, is enabled then press
    Wait Until Page Contains Element        ${locator}
    Page Should Contain Element         ${locator}
    Wait Until Element Is Enabled       ${locator}
    Set Focus To Element                ${locator}
    Click Element                       ${locator}

# --------------------------------------------------------------
Scroll In Viewport
	[Arguments]     ${index}
	# Log To Console 		item ${item}
	Log To Console 		Scrollong at index ${index}
    Execute Javascript    document.querySelectorAll('${jsheart}')[${index}].scrollIntoView({ behavior: 'smooth', block: 'center'})

Click On Item
	[Arguments]     ${item}
	Wait Until Page Contains Element		${item}		${TIMEOUT}
	Page Should Contain Element         ${item}
	# Scroll Element Into View		${item}
	Set Focus To Element    ${item}
	Click Element   ${item}
	Log To Console      HEART CLICK DONE

Scroll To Botton
	Execute Javascript    window.scrollTo(0,document.body.scrollHeight)

Implicit Wait
    Run Keyword And Ignore Error     \
	  Wait Until Page Contains Element     ${NaN}    timeout=${TIMEOUT}

Implicit Wait 1
    Run Keyword And Ignore Error     \
	  Wait Until Page Contains Element     ${NaN}    timeout=1s

Implicit Wait 2
    Run Keyword And Ignore Error    \
	   Wait Until Page Contains Element     ${NaN}    timeout=2s

Select Accounts
	[Arguments]     ${accounts}
	FOR    ${account}    IN    @{accounts}
		Log To Console 		${account}
	END

Open Login Page
	[Arguments]     ${accounts}
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Run Keyword and Ignore Error      Handle Alert        action=ACCEPT
    Wait Until Page Contains Element        ${username}
    Input Text          ${username}    ${accounts}   clear=True
    Wait Until Page Contains Element        ${password}
    Input Text          ${password}    ${insta_pass}   clear=True
    Page Should Contain Element         ${click_login}
    Wait Until Element Is Enabled       ${click_login}
    Set Focus To Element    ${click_login}
    Click Element   ${click_login}
    Log To Console      LOGIN DONE
	Botify Account

Botify Account
	Ready Homepage
	Give Hearts to Initial Posts on Homepage
	Continue Scrolling

Example keyword
	[Arguments]     ${accounts}
	Log To Console  	From Example Keyword ${accounts}

Ready Homepage
    Wait Until Page Contains Element        ${popup_notification}
    Set Focus To Element    ${popup_notification}
    Click Element   ${popup_notification}
    Run Keyword and Ignore Error    Wait Until Page Contains    ${home_text}    timeout=${TIMEOUT}      error=username not present on page
	Scroll To Botton

Give Hearts to Initial Posts on Homepage
	${heart_elements}=     Get WebElements			${hearts}
	${items}=	Get Element Count	${hearts}
	Should Be True		${items} > 2
	Log To Console			Article on Page = ${items}
	FOR  	${index}	IN RANGE 	${items}
		Log 		index ${index}
		# ${article_heart}=	Catenate	${item}     ${heart}
		Scroll In Viewport		    ${index}
		# Log				@{heart_elements}[${index}]
		Click On item 		@{heart_elements}[${index}]
	END

Continue Scrolling
	FOR 	${i} 	IN RANGE      ${iter}
		Log To Console      > ITERATION = ${i}
		Implicit Wait 2
		Scroll In Viewport     4
		Implicit Wait 1
		${heart_elements}=     Get WebElements			${hearts}
		Click On item 		@{heart_elements}[4]
	END

Run Suite Teardown
	Run Keyword and Ignore Error   		Close All Browser