*** Settings ***
Documentation       Twitter Bot specifi shared Variables
...                 > all global variables      -> CAPITALCASE
...                 > all locators names        -> CamelCase
...                 > all local text variables  -> smallcase
...                 can use {.}, { } and {_} in variable naming
...     Eg: ${user name}, ${user.name}, ${user_name} are all recommended


*** Variables ***

# BOT PAGE URLs SECTION ------------------------------------------------
${LOGIN URL}      	https://twitter.com/login
${EXPLORE_URL}      https://twitter.com/explore
${LOGOUT_URL}       https://twitter.com/logout

# LOCATORS ------------------------------------------------------------
# 1. LOGIN PAGE
${LoginUserName}      xpath://input[@name="session[username_or_email]" and @type="text"]
${LoginPassword}      xpath://input[@name="session[password]" and @type="password"]
${LoginBtn}           xpath:(//form//div/span/span[text()='Log in'])[1]
${Popup}              css:div.piCib button.aOOlW:nth-child(2)

# 2. HOMEPAGE
${matchtext}      	all_visual_interpretation
${child_heart}     	div.eo2As > section >span:nth-child(1)
${Hearts}		   	css:article div.eo2As > section >span:nth-child(1)
${jsHeart}		   	article div.eo2As > section >span:nth-child(1)


# TEXT BASED VALUES ------------------------------------------------------
${bot_page_contains_text}         Twitter
