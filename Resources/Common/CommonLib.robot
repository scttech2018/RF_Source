# TODO Need to create a keyword/method to determine what page the script is on. This is important for the following:
#       º TODO Privacy Error page (Test for Window Title = Privacy error; )
#       º TODO Saved App sign *** Settings (test for )
#           - TODO Regarding Saved App: Set a flag so that the "SAVE_AND_RETURN_BUTTON" button can be optionally selected

*** Settings ***
Resource  ../../Data/GlobalVars.robot
Library  Selenium2Library
Library  ExcelLibrary
Library  Collections

*** Variables ***
&{PO_Dictionary}

*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}
    Maximize Browser Window
    Go To  ${UOPEN_START_URL}

End Web Test
    Close Browser

Get Values from Spreadsheet
    [Arguments]  ${PageSheetName}
    # Open the file
	Open Excel  ${EXCEL_FILE_PATH}${EXCEL_DATA_FILE}
	# Get the number of rows
	${iTotalRows} =  Get Row Count  ${PageSheetName}
	# Loop through each row showing the value if each.
	: FOR  ${iRowNum}  IN RANGE  1  ${iTotalRows}+1
	\  ${KeyVal} =  Read Cell Data By Name  ${PageSheetName}  A${iRowNum}
    \  ${Value} =  Read Cell Data By Name  ${PageSheetName}  B${iRowNum}
    \  Set To Dictionary  ${PO_Dictionary}  ${KeyVal}  ${Value}
    [return]  ${PO_Dictionary}

Print out the Dictionary
    [Arguments]  ${PO_Dictionary}
    ${items} =  Get Dictionary Items    ${PO_Dictionary}
    :FOR    ${key}    ${value}    IN    @{items}
    \    log to console  ${key} : ${value}
