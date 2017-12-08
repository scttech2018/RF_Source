# PAGE ERROR WHEN FIELDS ARE MISSED:
# Please correct and resubmit the highlighted errors.Please move mouse over the field for error description.

*** Settings ***
Resource  ../../../Resources/Common/CommonLib.robot
Library  Selenium2Library
Library  Dialogs

*** Variables ***
${PA_PageName} =  Primary Applicant

###################################################################################################
# Personal & Identity Information
${APPLYING_FOR_LOAN_YES_RADIO} =                xpath=//*[@id="loanPresentYes"]
${APPLYING_FOR_LOAN_NO_RADIO} =                 xpath=//*[@id="loanPresentNo"]
${FIRST_NAME_TEXT} =                            xpath=//*[@id="firstNameId"]
${MIDDLE_INITIAL_TEXT} =                        xpath=//*[@id="mIid"]
${LAST_NAME_TEXT} =                             xpath=//*[@id="lastNameId"]
${SUFFIX_SELECT} =                              xpath=//*[@id="suffix"]
${DOB_TEXT} =                                   xpath=//*[@id="dobId"]
${SSN_TEXT} =                                   xpath=//*[@id="ssnnew"]
${US_CITIZEN_YES_RADIO} =                       xpath=//*[@id="countrySelectionYes"]
${US_CITIZEN_NO_RADIO} =                        xpath=//*[@id="countrySelectionNo"]
${COUNTRY_OF_CITIZENSHIP_SELECT} =              xpath=//*[@id="citizenshipCountry"]
${EMAIL_TEXT} =                                 xpath=//*[@id="email"]
${CONFIRM_EMAIL_TEXT} =                         xpath=//*[@id="email2"]
${PHOTO_ID_SELECT} =                            xpath=//*[@id="photoId"]
${PHOTO_ID_NUM_TEXT} =                          xpath=//*[@id="idNumber"]
${ISSUE_DATE_TEXT} =                            xpath=//*[@id="issueDate"]
${EXPIRATION_DATE_TEXT} =                       xpath=//*[@id="expiryDate"]
${ISSUE_STATE_SELECT} =                         xpath=//*[@id="issueState"]
${ISSUING_COUNTRY_SELECT} =                     xpath=//*[@id="issueCountry"]
${MOTHERS_MAIDEN_NAME_TEXT} =                   xpath=//*[@id="motherName"]
${SECURITY_WORD_TEXT} =                         xpath=//*[@id="securityWord"]
${IRS_NOTIFICATION_CHECKBOX} =                  xpath=//*[@id="frm1"]/fieldset[1]/div[2]/div[13]/div/input
###################################################################################################
# Address & Contact Section
${PHYSICAL_ADDRESS_1_TEXT} =                    xpath=//*[@id="address.address1"]
${PHYSICAL_ADDRESS_2_TEXT} =                    xpath=//*[@id="address.address2"]
${ZIP_CODE_TEXT} =                              xpath=//*[@id="address.zipcode1"]
${CITY_TEXT} =                                  xpath=//*[@id="address.city"]
${STATE_TEXT} =                                 xpath=//*[@id="address.state"]
${HOUSING_STATUS_SELECT} =                      xpath=//*[@id="residenceType"]
${MORTGAGE_RENT_PAYMENT_TEXT} =                 xpath=//*[@id="residencePayment"]
# If 'At this address for 2 Years?' = No, then we need to account for the following POPUP fields
${ADDRESS_FOR_2_YEARS_YES_RADIO} =              xpath=//*[@id="prevAddressYes"]
${ADDRESS_FOR_2_YEARS_NO_RADIO} =               xpath=//*[@id="prevAddressNo"]

${PREV_ADDRESS_1_POPUP_TEXT} =                  xpath=//*[@id="prevAddress.address1"]
${PREV_ADDRESS_2_POPUP_TEXT} =                  xpath=//*[@id="prevAddress.address2"]
${PREV_ADDRESS_ZIP_CODE_POPUP_TEXT} =           xpath=//*[@id="prevAddress.zipcode1"]
${PREV_ADDRESS_CITY_POPUP_TEXT} =               xpath=//*[@id="prevAddress.city"]
${PREV_ADDRESS_STATE_POPUP_SELECT} =            xpath=//*[@id="prevAddress.state"]
${PREV_ADDRESS_CLOSE_BUTTON} =                  xpath=//*[@id="dialogClose"]
${PREV_ADDRESS_SUBMIT_BUTTON} =                 xpath=//*[@id="dialogSubmit"]
${PREV_ADDRESS_X_TO_CLOSE_BUTTON} =             xpath=//*[@id="previousFrm1"]/div[1]/h2[1]
# If 'Mailing address same as physical address?' = No, then we need to account for the following POPUP fields
${MAILING_ADDRESS_SAME_AS_PHYSICAL_YES_RADIO} =     xpath=//*[@id="mailAddressYes"]
${MAILING_ADDRESS_SAME_AS_PHYSICAL_NO_RADIO} =      xpath=//*[@id="mailAddressNo"]

${MAILING_ADDRESS_SAME_1_POPUP_TEXT} =               xpath=//*[@id="mailAddress.address1"]
${MAILING_ADDRESS_SAME_2_POPUP_TEXT} =               xpath=//*[@id="mailAddress.address2"]
${MAILING_ADDRESS_SAME_ZIP_CODE_POPUP_TEXT} =        xpath=//*[@id="mailAddress.zipcode1"]
${MAILING_ADDRESS_SAME_CITY_POPUP_TEXT} =            xpath=//*[@id="mailAddress.city"]
${MAILING_ADDRESS_SAME_STATE_POPUP_SELECT} =         xpath=//*[@id="mailAddress.state"]
${MAILING_ADDRESS_SAME_CLOSE_BUTTON} =               xpath=//*[@id="dialogClose"]
${MAILING_ADDRESS_SAME_SUBMIT_BUTTON} =              xpath=//*[@id="dialogSubmit"]
${MAILING_ADDRESS_SAME_X_TO_CLOSE_BUTTON} =          xpath=//*[@id="mailingFrm1"]/div[1]/h2[1]
#############################################
${HOME_PHONE_TEXT} =                            xpath=//*[@id="homePhone"]
${MOBILE_PHONE_TEXT} =                          xpath=//*[@id="cellPhone"]
${WORK_PHONE_TEXT} =                            xpath=//*[@id="workPhone"]
${EXTENSION_TEXT} =                             xpath=//*[@id="ext"]
###################################################################################################
# Employment & Income Section
${EMPLOYMENT_STATUS_SELECT} =                   xpath=//*[@id="employmentType"]
# If 'Employed' is selected, then you will get a popup with the following fields:
${EMPLOYMENT_INFO_OCCUPATION_TEXT} =            xpath=//*[@id="occupation"]
${EMPLOYMENT_INFO_EMPLOYER_NAME_TEXT} =         xpath=//*[@id="employerNameId"]
${EMPLOYMENT_INFO_PHONE_TEXT} =                 xpath=//*[@id="empPhone"]

${PREV_OCCUPATION_RETIRED_UNEMPLOYED_TEXT} =    xpath=//*[@id="tmpRetiredOccupationId"]

# The following two fields will appear in the popup if 'I am applying for a loan' = Yes
${EMPLOYMENT_START_DATE_TEXT} =                 xpath=//*[@id="hireDate"]
${MONTHLY_GROSS_SALARY_TEXT} =                  xpath=//*[@id="grossMonthlyIncome"]

${OTHER_INCOME_SOURCE_SELECT} =                 xpath=//*[@id="addlIncomeSource"]
${OTHER_INCOME_TEXT} =                          xpath=//*[@id="addlMonthlyIncome"]
${OTHER_INCOME_DESCRIPTION_TEXT} =              xpath=//*[@id="addlIncomeDesc"]
${PAYMENT_FREQUENCY_SELECT} =                   xpath=//*[@id="addlIncomeFrequency"]
# Other Info Section
${WHERE_DID_YOU_LEARN_SELECT} =                 xpath=//*[@id="whereDidULearnId"]
${PROMO_CODE_TEXT} =                            xpath=//*[@id="promoCode"]
${ADD_JOINT_APP_YES_RADIO} =                    xpath=//*[@id="jointSelectionYes"]
${ADD_JOINT_APP_NO_RADIO} =                     xpath=//*[@id="jointSelectionNo"]

# we need to have unique buttons for Save & Continue (PA = Primary Application page)
${PA_SAVE_AND_RETURN_BUTTON} =                  xpath=//*[@id="sub1"]
${PA_CONTINUE_BUTTON} =                         xpath=//*[@id="sub"]

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains  ${PA_PageName}  timeout=120

Load the Page Data
    ${PO_Dictionary}  CommonLib.Get Values from Spreadsheet  ${PA_PageName}

Fill in Personal Identify Info
    Run Keyword If  '${PO_Dictionary.APPLYING_FOR_LOAN}' == 'No'
    ...  Run Keywords
    ...  Click Element  ${APPLYING_FOR_LOAN_NO_RADIO}
    ...  ELSE
    ...  Click Element  ${APPLYING_FOR_LOAN_YES_RADIO}

    # If 'Are you a U.S. Citizen' = No, then add & fill in the following fields:
    Run keyword If  '${PO_Dictionary.US_CITIZEN}' == 'No'  run keywords  Click Element  ${US_CITIZEN_NO_RADIO}
    ...  AND  Select From List  ${COUNTRY_OF_CITIZENSHIP_SELECT}  ${PO_Dictionary.COUNTRY_OF_CITIZENSHIP}

    Run Keyword If  '${PO_Dictionary.US_CITIZEN}' == 'Yes'
    ...  Click Element  ${US_CITIZEN_YES_RADIO}

    Input Text  ${EMAIL_TEXT}  ${PO_Dictionary.EMAIL}
    Input Text  ${CONFIRM_EMAIL_TEXT}  ${PO_Dictionary.CONFIRM_EMAIL}

    Select From List  ${PHOTO_ID_SELECT}  ${PO_Dictionary.PHOTO_ID}

    # If 'Photo ID' = Passport with Photo, then fill in: ${ISSUING_COUNTRY_SELECT}
    Run keyword If  "${PO_Dictionary.PHOTO_ID}" == "Passport with Photo"
    ...  Select From List  ${ISSUING_COUNTRY_SELECT}  ${PO_Dictionary.COUNTRY_OF_CITIZENSHIP}

    Input Text  ${PHOTO_ID_NUM_TEXT}  ${PO_Dictionary.PHOTO_ID_NUM}
    Input Text  ${ISSUE_DATE_TEXT}  ${PO_Dictionary.ISSUE_DATE}
    Input Text  ${EXPIRATION_DATE_TEXT}  ${PO_Dictionary.EXPIRATION_DATE}
    Select From List  ${ISSUE_STATE_SELECT}  ${PO_Dictionary.ISSUE_STATE}
    Input Text  ${MOTHERS_MAIDEN_NAME_TEXT}  ${PO_Dictionary.MOTHERS_MAIDEN_NAME}
    Input Text  ${SECURITY_WORD_TEXT}  ${PO_Dictionary.SECURITY_WORD}
    Run Keyword If  "${PO_Dictionary.IRS_NOTIFICATION}" == "Yes"
    ...  Click Element  ${IRS_NOTIFICATION_CHECKBOX}

Fill in Address Contact Info
    Input Text  ${PHYSICAL_ADDRESS_1_TEXT}  ${PO_Dictionary.PHYSICAL_ADDRESS_1}
    Input Text  ${HOME_PHONE_TEXT}  ${PO_Dictionary.HOME_PHONE}

    # If 'I Am Applying For a Loan' = Yes, then add & fill in the following fields:
    Run Keyword If  "${PO_Dictionary.APPLYING_FOR_LOAN}" == "Yes"
    ...  Run Keywords
    ...  Select From List  ${HOUSING_STATUS_SELECT}  ${PO_Dictionary.HOUSING_STATUS}
    ...  AND  Input Text  ${MORTGAGE_RENT_PAYMENT_TEXT}  ${PO_Dictionary.MORTGAGE_RENT_PAYMENT}

    # If 'At this address for 2 Years?' = NO, then there will a popup
    Run Keyword If  "${PO_Dictionary.ADDRESS_FOR_2_YEARS}" == "No"
    ...  Run Keywords
    ...  Click Element  ${ADDRESS_FOR_2_YEARS_NO_RADIO}
    ...  AND  Wait Until Element Is Visible  ${PREV_ADDRESS_SUBMIT_BUTTON}  timeout=120
    ...  AND  Input Text  ${PREV_ADDRESS_ZIP_CODE_POPUP_TEXT}  ${PO_Dictionary.PREV_ADDRESS_ZIP_CODE_POPUP}
    ...  AND  Click Element  ${PREV_ADDRESS_1_POPUP_TEXT}
    ...  AND  Input Text  ${PREV_ADDRESS_1_POPUP_TEXT}  ${PO_Dictionary.PREV_ADDRESS_1_POPUP}
    ...  AND  Click Element  ${PREV_ADDRESS_2_POPUP_TEXT}
    ...  AND  Wait Until Element Is Visible  ${PREV_ADDRESS_STATE_POPUP_SELECT}  timeout=120
    ...  AND  Click Button  ${PREV_ADDRESS_SUBMIT_BUTTON}
    ...  AND  Sleep  1s
    ...  ELSE
    ...  Click Element  ${ADDRESS_FOR_2_YEARS_YES_RADIO}

    # Get the focus on the main window!
    Select Window  ${BROWSER_TITLE}
    Wait Until Page Contains  ${PA_PageName}

    # If 'Mailing address same as physical address?' = NO, then there will a popup
    Run Keyword If  "${PO_Dictionary.MAILING_ADDRESS_SAME_AS_PHYSICAL}" == "No"
    ...  Run Keywords
    ...  Click Element  ${MAILING_ADDRESS_SAME_AS_PHYSICAL_NO_RADIO}
    ...  AND  Wait Until Element Is Visible  ${MAILING_ADDRESS_SAME_SUBMIT_BUTTON}  timeout=120
    ...  AND  Input Text  ${MAILING_ADDRESS_SAME_ZIP_CODE_POPUP_TEXT}  ${PO_Dictionary.MAILING_ADDRESS_SAME_ZIP_CODE_POPUP}
    ...  AND  Click Element  ${MAILING_ADDRESS_SAME_1_POPUP_TEXT}
    ...  AND  Input Text  ${MAILING_ADDRESS_SAME_1_POPUP_TEXT}  ${PO_Dictionary.MAILING_ADDRESS_SAME_1_POPUP}
    ...  AND  Click Element  ${MAILING_ADDRESS_SAME_2_POPUP_TEXT}
    ...  AND  Wait Until Element Is Visible  ${MAILING_ADDRESS_SAME_STATE_POPUP_SELECT}  timeout=120
    ...  AND  Click Button  ${MAILING_ADDRESS_SAME_SUBMIT_BUTTON}
    ...  AND  Sleep  1s
    ...  ELSE
    ...  Click Element  ${MAILING_ADDRESS_SAME_AS_PHYSICAL_YES_RADIO}

    # Get the focus on the main window!
    Select Window  ${BROWSER_TITLE}
    Wait Until Page Contains  ${PA_PageName}

Fill in Employment and Income Info
    Select From List  ${EMPLOYMENT_STATUS_SELECT}  ${PO_Dictionary.EMPLOYMENT_STATUS}
    Input Text  ${PREV_OCCUPATION_RETIRED_UNEMPLOYED_TEXT}  ${PO_Dictionary.PREV_OCCUPATION_RETIRED_UNEMPLOYED}

    Run Keyword If  "${PO_Dictionary.APPLYING_FOR_LOAN}" == "Yes"
    ...  Run Keywords
    ...  Select From List  ${OTHER_INCOME_SOURCE_SELECT}  ${PO_Dictionary.OTHER_INCOME_SOURCE}
    ...  AND  Input Text  ${OTHER_INCOME_TEXT}  ${PO_Dictionary.OTHER_INCOME}
    ...  AND  Input Text  ${OTHER_INCOME_DESCRIPTION_TEXT}  ${PO_Dictionary.OTHER_INCOME_DESCRIPTION}
    ...  AND  Select From List  ${PAYMENT_FREQUENCY_SELECT}  ${PO_Dictionary.PAYMENT_FREQUENCY}

Fill in Other Information
    Select From List  ${WHERE_DID_YOU_LEARN_SELECT}  ${PO_Dictionary.WHERE_DID_YOU_LEARN}

    Run Keyword If  "${PO_Dictionary.PROMO_CODE}" != ""
    ...  Input Text  ${PO_Dictionary.PROMO_CODE}

    Run Keyword If  "${PO_Dictionary.ADD_JOINT_APP}" == "Yes"
    ...  Run Keywords
    ...  Click Element  ${ADD_JOINT_APP_YES_RADIO}
    ...  ELSE
    ...  Click Element  ${ADD_JOINT_APP_NO_RADIO}

Select Continue button
    Click Element  ${PA_CONTINUE_BUTTON}