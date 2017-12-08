# PAGE ERROR WHEN FIELDS ARE MISSED:
# Please correct and resubmit the highlighted errors.Please move mouse over the field for error description.

*** Settings ***
Resource  ../../../Resources/Common/CommonLib.robot
Library  Selenium2Library
Library  String
Library  Dialogs

*** Variables ***
${BA_PageName} =  Before applying

# Order of objects is top down
${DISCLOSURE_LINK} =            xpath=//*[@id="esignaturelbl"]/a
${I_HAVE_READ_CHECKBOX} =       xpath=//*[@id="disclosure1"]
${EXISTING_MEMBER_YES_RADIO} =  xpath=//*[@id="applicantTypeYes"]
# If NO is selected for EXISTING MEMBER, then the ZIP CODE is required
${EXISTING_MEMBER_NO_RADIO} =   xpath=//*[@id="applicantTypeNo"]
${ZIP_CODE_TEXT} =              xpath=//*[@id="address.zipcode1"]

${FIRST_NAME_TEXT} =            xpath=//*[@id="firstNameId"]
${MIDDLE_NAME_TEXT} =           xpath=//*[@id="mIid"]
${LAST_NAME_TEXT} =             xpath=//*[@id="lastNameId"]
${DOB_TEXT} =                   xpath=//*[@id="dobId"]
${SSN_TEXT} =                   xpath=//*[@id="ssnId"]

# we need to have unique buttons for Save & Continue (BA = Before Applying)
${BA_CONTINUE_BUTTON} =         xpath=//*[@id="sub1"]

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains  ${BA_PageName}  timeout=120

Get the Main Page Title
    ${myTitle} =  Get Title
    Set Global Variable  ${BROWSER_TITLE}  title=${myTitle}

Load the Page Data
    ${PO_Dictionary}  CommonLib.Get Values from Spreadsheet  ${BA_PageName}

Complete Disclose and Consent
    Click Link  ${DISCLOSURE_LINK}
    Click Element  ${I_HAVE_READ_CHECKBOX}

Fill in Membership and Personal Info
    Select Window  ${BROWSER_TITLE}
    ${randSSN} =  Generate Random String  4  [NUMBERS]
    ${randLASTNAME} =  Generate Random String  4  [LETTERS]

    # Check the radio button...If 'No' then fill in the zip code
    Run keyword If  '${PO_Dictionary.EXISTING_MEMBER}' == 'No'  run keywords  Click Element  ${EXISTING_MEMBER_NO_RADIO}
    ...  AND  Input Text  ${ZIP_CODE_TEXT}  ${PO_Dictionary.ZIP_CODE}
    Run keyword If  '${PO_Dictionary.EXISTING_MEMBER}' == 'Yes'  Click Element  ${EXISTING_MEMBER_YES_RADIO}

    Input Text  ${FIRST_NAME_TEXT}  ${PO_Dictionary.FIRST_NAME}
    Input Text  ${LAST_NAME_TEXT}  ${PO_Dictionary.LAST_NAME}${randLASTNAME}
    Input Text  ${DOB_TEXT}  ${PO_Dictionary.DOB}
    Input Text  ${SSN_TEXT}  ${PO_Dictionary.SSN}${randSSN}

Select Continue button
    Click Button  ${BA_CONTINUE_BUTTON}
