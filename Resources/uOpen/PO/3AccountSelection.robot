# PAGE ERROR WHEN FIELDS ARE MISSED:
# A minimum of one product is required.

*** Settings ***
Resource  ../../../Resources/Common/CommonLib.robot
Library  Selenium2Library
Library  Dialogs

*** Variables ***
${AS_PageName} =  Account Selection

# Savings Account section
${TEST_SAVINGS_CHECKBOX} =          xpath=//*[@id="SV_121"]
# Additional Products and Services Info section
${ATM_CARD_CHECKBOX} =              xpath=//*[@id="O_ATC_TR"]/td/a
${CHECK_ORDER_CHECKBOX} =           xpath=//*[@id="O_CHO"]
${DEBIT_CARD_CHECKBOX} =            xpath=//*[@id="O_DBC"]
${E-STATEMENTS__CHECKBOX} =         xpath=//*[@id="O_ES"]
${ONLINE_BANKING_CHECKBOX} =        xpath=//*[@id="O_OB"]
${OVERDRAFT_PROTECTION_CHECKBOX} =  xpath=//*[@id="O_ODP"]
${TELEPHONE_BANKING_CHECKBOX} =     xpath=//*[@id="O_TB"]

# we need to have unique buttons for Save & Continue (AS = Account Selection page)
${AS_SAVE_AND_RETURN_BUTTON} =      xpath=//*[@id="sub1"]
${AS_CONTINUE_BUTTON} =             xpath=//*[@id="sub2"]

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains  ${AS_PageName}  timeout=120

Load the Page Data
    ${PO_Dictionary}  CommonLib.Get Values from Spreadsheet  ${AS_PageName}

Select the Account
    Checkbox Should Be Selected  ${TEST_SAVINGS_CHECKBOX}

Fill in Additional Products and Services
    Unselect Checkbox  ${CHECK_ORDER_CHECKBOX}
    Unselect Checkbox  ${DEBIT_CARD_CHECKBOX}
    Unselect Checkbox  ${E-STATEMENTS__CHECKBOX}
    Unselect Checkbox  ${TELEPHONE_BANKING_CHECKBOX}

Select Continue button
    Click Element  ${AS_CONTINUE_BUTTON}