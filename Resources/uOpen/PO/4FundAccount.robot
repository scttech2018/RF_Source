# PAGE ERROR WHEN FIELDS ARE MISSED:
# Please correct and resubmit the highlighted errors.Please move mouse over the field for error description.

*** Settings ***
Resource  ../../../Resources/Common/CommonLib.robot
Library  Selenium2Library
Library  Dialogs


*** Variables ***
# Excel data stuff
${FA_PageName} =  Fund Account

# Fund Account Section
${ADD_REMOVE_PRODUCTS_LINK} =               xpath=//*[@id="fproduct"]/a
# Disclosures Section
${I_HAVE_READ_1_LINK} =                     xpath=//*[@id="disclosureFormBean.chkAgree1lbl"]/span/a
${I_HAVE_READ_1_CHECKBOX} =                 xpath=//*[@id="disclosureFormBean.chkAgree1"]
${I_HAVE_READ_2_LINK} =                     xpath=//*[@id="disclosureFormBean.chkAgree2lbl"]/span/a
${I_HAVE_READ_2_CHECKBOX} =                 xpath=//*[@id="disclosureFormBean.chkAgree2"]
${OPT_OUT_I_DO_NOT_WANT_RADIO} =            xpath=//*[@id="odpAuthNo"]
${OPT_IN_I_DO_WANT_RADIO} =                 xpath=//*[@id="odpAuthYes"]
# New Accounts Section
${TEST_SAVING_TEXT} =                       xpath=//*[@id="2"]
${TOTAL_AMOUNT_VALIDATION_STATIC_TEXT} =    xpath=//*[@id="funding_total_amount"]
# Funding Source Section
${TRANSFER_FROM_RADIO} =                    xpath=//*[@id="fundingsourcetypeACH"]
${CREDIT_DEBIT_CARD_RADIO} =                xpath=//*[@id="fundingsourcetypeCC"]
${CHECK_BY_MAIL_RADIO} =                    xpath=//*[@id="fundingsourcetypeMail"]
${CHECK_CASH_IN_BRANCH_RADIO} =             xpath=//*[@id="fundingsourcetypeCheckBranch"]
${WIRE_TRANSFER_RADIO} =                    xpath=//*[@id="fundingsourcetypeWireTransfer"]

# we need to have unique buttons for Save & Continue (FA = Fund Account page)
${FA_SAVE_AND_RETURN_BUTTON} =              xpath=//*[@id="sub1"]
${FA_SUBMIT_APP_BUTTON} =                   xpath=//*[@id="sub"]

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains  ${FA_PageName}  timeout=120

Load the Page Data
    ${PO_Dictionary}  CommonLib.Get Values from Spreadsheet  ${FA_PageName}
    #CommonLib.Print out the Dictionary  ${PO_Dictionary}

Fill in the Disclosures Info
    Click Link  ${I_HAVE_READ_1_LINK}
    Click Element  ${I_HAVE_READ_1_CHECKBOX}
    Click Link  ${I_HAVE_READ_2_LINK}
    Click Element  ${I_HAVE_READ_2_CHECKBOX}
    Click Element  ${OPT_OUT_I_DO_NOT_WANT_RADIO}

Input New Account Value
    Select Window  ${BROWSER_TITLE}
    Input Text  ${TEST_SAVING_TEXT}  ${PO_Dictionary.AMOUNT}

Select the Funding Source
    Click Element  ${CHECK_BY_MAIL_RADIO}

Select Continue button
    Click Button  ${FA_SUBMIT_APP_BUTTON}
