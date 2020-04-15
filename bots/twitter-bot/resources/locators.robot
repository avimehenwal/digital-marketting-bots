*** Settings ***
Documentation       Twitter Bot specifi shared Variables
...                 > all global variables      -> CAPITALCASE
...                 > all locators names        -> CamelCase
...                 > all local text variables  -> smallcase
...                 can use {.}, { } and {_} in variable naming
...     Eg: ${user name}, ${user.name}, ${user_name} are all recommended


*** Variables ***

# PAGE URLs in CAPITAL case
${LOGIN URL}      	https://www.instagram.com/accounts/login/


# **************** ALL LOCATORS in CAMEL-CASE divided by Sections
# LOGIN PAGE
${UserName}       	  css:#react-root > section > main > div > article > div > div:nth-child(1) > div > form > div:nth-child(2) > div > label > input
${Password}        	  css:#react-root > section > main > div > article > div > div:nth-child(1) > div > form > div:nth-child(3) > div > label > input
${LoginBtn}           css:#react-root > section > main > div > article > div > div:nth-child(1) > div > form > div:nth-child(4)
${Popup}              css:div.piCib button.aOOlW:nth-child(2)

# HOMEPAGE
${matchtext}      	all_visual_interpretation
${child_heart}     	div.eo2As > section >span:nth-child(1)
${Hearts}		   	css:article div.eo2As > section >span:nth-child(1)
${jsHeart}		   	article div.eo2As > section >span:nth-child(1)

