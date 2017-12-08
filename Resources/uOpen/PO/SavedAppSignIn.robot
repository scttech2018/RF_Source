*** Settings ***
Library  Selenium2Library

*** Variables ***
# Return to your saved application: Sign In section
${APP_CONF_NUMBER_TEXT} =       xpath=//*[@id="confirmNo"]
${4_DIGIT_BIRTH_YEAR_TEXT} =    xpath=//*[@id="frm1"]/div[3]/div/div[3]/div/input[2]
${EMAIL_ADDRESS_ON_AP_TEXT} =   xpath=//*[@id="email"]
${FORGOT_CONF_NUMBER_LINK} =    xpath=//*[@id="frm1"]/div[3]/div/div[5]/div/a
${CONTINUE_BUTTON} =            xpath=//*[@id="frm1"]/div[4]/button

# App Conf Number: 2FZK261 (created on 10/30/17)
# App Conf Number: xpath=//*[@id="boxbody"]/form/div[1]/table/tbody/tr[2]/td/font