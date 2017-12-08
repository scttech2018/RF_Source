Library  Selenium2Library

*** Variables ***
${EXCEL_FILE_PATH} =    C:\\Development\\robot-scripts\\uOpen\\Data\\
${EXCEL_DATA_FILE} =    uOpenData.xls
${BROWSER} =            chrome
${UOPEN_START_URL} =    https://10.149.228.72/uopen/welcome.do?auth=057ba5657490c2cd
#${UOPEN_START_URL} =         https://10.149.228.72/uopen/welcome.do?auth=cbc4d5b2df17044f

${UMC_START_URL} =      https://10.149.228.72/uopen/umc/login.do?auth=89bb74f6030d5dc6

# ${BROWSER_TITLE} is a global variable and can be used throughout the script for Select Window
#  The Select Window command is used for when there is a popup and the main window needs to come into the forefront.
${BROWSER_TITLE}

# This here's a test