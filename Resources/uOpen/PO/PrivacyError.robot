# This code is not currently functioning! It is an attempt to address the Privacy Error page that appears
#  the first time you go to a uOpen site. It's not possible to view the source on this page since it's
#  disabled. You will need to access link text using the sample code below (not sure if this works :(
#  DATE: 11.27.17

*** Settings ***
Library  Selenium2Library
Library  Dialogs

*** Keywords ***
Check for Page and Proceed to App
    ${logout present}=    Get Matching Xpath Count    //a[.='logout']
    Run Keyword If    ${logout present}
    ...  Run Keywords
    ...  Log To Console    True: ${logout present}    
    ...  ELSE
    ...  Log To Console    False: ${logout present}

    Pause Execution    

# window_title =  Privacy error
# Page contains static text: Your connection is not private
# Page contains link: ADVANCED
# Clicking on ADVANCED results in another link: Proceed to 10.149.228.72 (unsafe)
#
