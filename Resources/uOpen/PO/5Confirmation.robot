# PAGE ERROR WHEN FIELDS ARE MISSED: None - there are no fields to select on this page. Only the final 'finish' button

*** Settings ***
#Resource  ../../../Resources/Common/CommonLib.robot
Library  Selenium2Library
Library  Dialogs

*** Variables ***
${Conf_PageName} =  Confirmation

# Confirmation Section
${APP_CONF_NUMBER_VALIDATION_STATIC_TEXT} =         xpath=//*[@class="confirmationNumber"]
${PRODUCT_VALIDATION_STATIC_TEXT} =                 xpath=//*[@id="boxbody"]/form[2]/fieldset/table[1]/tbody/tr[2]/td[1]
${AMOUNT_VALIDATION_STATIC_TEXT} =                  xpath=//*[@id="boxbody"]/form[2]/fieldset/table[1]/tbody/tr[2]/td[2]
${ACCT_NUM_VALIDATION_STATIC_TEXT} =                xpath=//*[@id="boxbody"]/form[2]/fieldset/table[1]/tbody/tr[2]/td[3]
${ACCT_STATUS_VALIDATION_STATIC_TEXT} =             xpath=//*[@id="boxbody"]/form[2]/fieldset/table[1]/tbody/tr[2]/td[4]
${ADDITIONAL_SERVICES_VALIDATION_STATIC_TEXT} =     xpath=//*[@id="boxbody"]/form[3]/fieldset/div/div/div

${FINISH_BUTTON} =                                  xpath=//*[@id="boxbody"]/form[4]/div/button

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains  ${Conf_PageName}  timeout=120

Check for Application Confirmation Number
    ${APP_CONF_NUMBER} =  Get Text  ${APP_CONF_NUMBER_VALIDATION_STATIC_TEXT}
    Log  This is the App Confirmation Number value: ${APP_CONF_NUMBER}

Check for Products Selected
    ${PRODUCT_VALIDATION} =  Get Text  ${PRODUCT_VALIDATION_STATIC_TEXT}
    Log  This is the Products Selected value: ${PRODUCT_VALIDATION}

Check for Amount Value
    ${AMOUNT_VALIDATION} =  Get Text  ${AMOUNT_VALIDATION_STATIC_TEXT}
    Log  This is the Amount Value: ${AMOUNT_VALIDATION}

Check for Account Status
    ${ACCT_STATUS} =  Get Text  ${ACCT_STATUS_VALIDATION_STATIC_TEXT}
    Log  This is the Account Status value: ${ACCT_STATUS}

Check for Additional Services
    ${ADDITIONAL_SERVICES} =  Get Text  ${ADDITIONAL_SERVICES_VALIDATION_STATIC_TEXT}
    Log  This is the Add'l Services value: ${ADDITIONAL_SERVICES}

Finish the Application
    Click Button  ${FINISH_BUTTON}
