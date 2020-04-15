*** Settings ***
Documentation       Placeholder for all Locator Variables

*** Variables ***

# Page Urls
${LOGIN URL}      	https://www.instagram.com/accounts/login/
${BROWSER}        	Chrome

# Framework Settings
${TIMEOUT}		  	2s
${SPEED}            0.1s
${NaN}			   	css:#avimehenwal
${iter}				5

# COMMOM PAGE VARIABLES
${title}            Instagram

# LOGIN PAGE
${username}       	css:#react-root > section > main > div > article > div > div:nth-child(1) > div > form > div:nth-child(2) > div > label > input
${password}       	css:#react-root > section > main > div > article > div > div:nth-child(1) > div > form > div:nth-child(3) > div > label > input
${click_login}      css:#react-root > section > main > div > article > div > div:nth-child(1) > div > form > div:nth-child(4)
${popup_notification}   css:button.aOOlW:nth-child(2)

# HOMEPAGE
${home_text}      	all_visual_interpretation
${child_heart}     	div.eo2As > section >span:nth-child(1)
${hearts}		   	css:article div.eo2As > section >span:nth-child(1)
${jsheart}		   	article div.eo2As > section >span:nth-child(1)
