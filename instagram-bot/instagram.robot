*** Settings ***
Documentation     Surf instagram and love posts on timeline
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      https://www.instagram.com/accounts/login/
${BROWSER}        Chrome
${TIMEOUT}		  10s
${username}       css:#react-root > section > main > div > article > div > div:nth-child(1) > div > form > div:nth-child(2) > div > label > input
${password}       css:#react-root > section > main > div > article > div > div:nth-child(1) > div > form > div:nth-child(3) > div > label > input
${click_login}      css:#react-root > section > main > div > article > div > div:nth-child(1) > div > form > div:nth-child(4)
${popup_notification}   css:button.aOOlW:nth-child(2)
${home_text}      all_visual_interpretation
${child_heart}     div.eo2As > section >span:nth-child(1)
${hearts}		   css:article div.eo2As > section >span:nth-child(1)
${jsheart}		   article div.eo2As > section >span:nth-child(1)

*** Tasks ***
Open Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Run Keyword And Continue On Failure      Handle Alert        action=ACCEPT
    Wait Until Page Contains Element        ${username}
    Input Text          ${username}    ${insta_user}   clear=True
    Wait Until Page Contains Element        ${password}
    Input Text          ${password}    ${insta_pass}   clear=True
    Page Should Contain Element         ${click_login}
    Wait Until Element Is Enabled       ${click_login}
    Set Focus To Element    ${click_login}
    Click Element   ${click_login}
    Log To Console      LOGIN DONE

Ready Homepage
    Wait Until Page Contains Element        ${popup_notification}
    Set Focus To Element    ${popup_notification}
    Click Element   ${popup_notification}
    Wait Until Page Contains    ${home_text}    timeout=${TIMEOUT}      error=username not present on page

Articles On Page
	# ${items}=     Get WebElements			${hearts}
	${items}=	Get Element Count	${hearts}
	Should Be True		${items} > 2
	Log To Console			Article on Page = ${items}
	FOR  	${index}	IN RANGE 	${items}
		Log 		index ${index}
		# ${article_heart}=	Catenate	${item}     ${heart}
		# Log 		article_heart ${article_heart}
		Scroll In Viewport		    ${index}
	END


*** Keywords ***
Scroll In Viewport
	[Arguments]     ${index}
	# Log To Console 		item ${item}
	# Log To Console 		index ${index}
    Execute Javascript    document.querySelectorAll('${jsheart}')[${index}].scrollIntoView({ behavior: 'smooth', block: 'center'})
	# Wait Until Page Contains Element		${item}		${TIMEOUT}
	# Page Should Contain Element         ${item}
	# Scroll Element Into View		${item}
	# Set Focus To Element    ${item}
    # Click Element   ${item}
    # Log To Console      article CLICK DONE


# Homepage
# root
# article
# 	header
# 	div
# 	div
# 	div
# article > div.eo2As > section > span > button.wpO6b
# article:nth-child(1) > div.eo2As
# #react-root > section > main > section > div.cGcGK > div:nth-child(1) > div > article:nth-child(1) > div.eo2As > section.ltpMr.Slqrh > span.fr66n > button
# #react-root > section > main > section > div.cGcGK > div:nth-child(1) > div > article:nth-child(1) > div.eo2As > section.ltpMr.Slqrh > span.fr66n > button > svg

