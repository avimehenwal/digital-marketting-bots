*** Settings ***
Documentation               Shared Low Level Base keywords for all bots
...                         Available to all page objects
...                         Kindly do not add variables here
...							use all BOLD for Globals


*** Keywords ***

# ------------------------------------------------------ INTERACTION BASED
IS ELEMENT ENABLED
    [Arguments]         ${locator}
    [Documentation]     Base Element
	...					Handles all checking for each Element interaction action like
	...					Get text, Click, Input data, Read attributes
	...					use this widely to get consistent failures and fixtures
	Wait Until Page Contains Element        ${locator}
    Page Should Contain Element             ${locator}
	Wait Until Element Is Enabled       	${locator}
	Element Should Be Enabled 				${locator}

# -------------------------------------------------------------FORM FILLING
CLICK
    [Arguments]         ${locator}
    [Documentation]     Prepare element to be clicked
	...					then Focus on element and then click
	IS ELEMENT ENABLED          			${locator}
    Set Focus To Element                    ${locator}
    Click Element                           ${locator}

INPUT
    [Arguments]         ${locator}      ${text}
    [Documentation]     Wait, then look for element before filling
	IS ELEMENT ENABLED          		${locator}
    Input Text          ${locator}    	${text}       clear=True


# ------------------------------------------------------ DATA CHECKING TYPES
MATCH TITLE
	[Arguments]			${expected}
	[Documentation]		Useful to check if we are on right page
    ${title}=			Get Title
    Should Contain      ${title}		${expected}		msg=${title}



# ------------------------------------------------------------ PROBLAMATIC KEYWORDS
ALERT HANDLER
	[Documentation]		Supress language change check dialog box
	...					Only seen at entrypoint window
	...					Todo: Add exact message here
	Run Keyword and Ignore Error      Handle Alert        action=ACCEPT

# ------------------------------------------------------------- SCROLLING OPTIONS
SCROLL IN VIEWPORT
	[Arguments]		    ${locator} 			${index}
	[Documentation]		seleniumLibrary implemented keyword doesnt work
	...					only JS method works
	# Log To Console 		item ${item}
	Log To Console 		Scrollong at index ${index}
    Execute Javascript    document.querySelectorAll('${locator}')[${index}].scrollIntoView({ behavior: 'smooth', block: 'center'})

SCROLL TO BOTTON
	Execute Javascript    window.scrollTo(0,document.body.scrollHeight)


# -------------------------------------------------------------- WAITS
IMPLICIT WAIT
    Run Keyword And Ignore Error     	Wait Until Page Contains Element     ${NaN}

IMPLICIT WAIT 1
    Run Keyword And Ignore Error     	Wait Until Page Contains Element     ${NaN}    timeout=1s

IMPLICIT WAIT 2
    Run Keyword And Ignore Error		Wait Until Page Contains Element     ${NaN}    timeout=2s


# --------------------------------------------------------------- OTHERS
SELECT ACCOUNTS
	[Arguments]     ${accounts}
	FOR    ${account}    IN    @{accounts}
		Log To Console 		${account}
	END

# ---------------------------------------------------------- TEARDOWN
RUN SUITE TEARDOWN
	Run Keyword and Ignore Error   		Close All Browser

LOG ALL
	[Arguments]				${msg}
	Log To Console			${msg}
	Log 					${msg}

# END
