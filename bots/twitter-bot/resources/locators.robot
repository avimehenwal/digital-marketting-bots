*** Settings ***
Documentation       Twitter Bot specifi shared Variables
...                 > all global variables      -> CAPITALCASE
...                 > all locators names        -> CamelCase
...                 > all local text variables  -> smallcase
...                 can use {.}, { } and {_} in variable naming
...     Eg: ${user name}, ${user.name}, ${user_name} are all recommended


*** Variables ***

# BOT PAGE URLs SECTION ------------------------------------------------
${LOGIN URL}      	        https://twitter.com/login
${EXPLORE_URL}              https://twitter.com/explore
${LOGOUT_URL}               https://twitter.com/logout
${NOTIFICATION_URL}         https://twitter.com/notifications
${MESSAGES_URL}             https://twitter.com/messages
${BOOKMARKS_URL}            https://twitter.com/i/bookmarks
${LISTS_URL}                https://twitter.com/avimehenwal/lists
${PROFILE_URL}              https://twitter.com/avimehenwal
${COMPOSETWEET_URL}         https://twitter.com/compose/tweet

# LOCATORS ------------------------------------------------------------
# 1. LOGIN PAGE
${LoginUserName}      xpath://input[@name="session[username_or_email]" and @type="text"]
${LoginPassword}      xpath://input[@name="session[password]" and @type="password"]
${LoginBtn}           xpath:(//form//div/span/span[text()='Log in'])[1]
${Popup}              css:div.piCib button.aOOlW:nth-child(2)

# 2. HOMEPAGE
${TimelineRoot}             xpath://div[contains(@aria-label, 'Timeline: Your Home Timeline')]
${articles}                 /div/div/div/div/div/div/article
${ArticlesRoot}             ${TimelineRoot}${articles}
# ${ArticlesRootActions}      ${ArticlesRoot}${article_actions}
# Setting variable '${Comments}' failed
${comment_append}           /div/div[2]/div[2]/div[2]/div[3]/div[1]
${retweets_append}          /div/div[2]/div[2]/div[2]/div[3]/div[2]
${hearts_append}            /div/div[2]/div[2]/div[2]/div[3]/div[3]
${Comments}                 ${ArticlesRoot}${comment_append}
${Retweets}                 ${ArticlesRoot}${retweets_append}
${Hearts}                   ${ArticlesRoot}${hearts_append}


${matchtext}      	all_visual_interpretation
${child_heart}     	div.eo2As > section >span:nth-child(1)
${Hearts}		   	css:article div.eo2As > section >span:nth-child(1)
${jsHeart}		   	article div.eo2As > section >span:nth-child(1)


# TEXT BASED VALUES ------------------------------------------------------
${bot_page_contains_text}         Twitter
