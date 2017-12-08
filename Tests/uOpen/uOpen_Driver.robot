*** Settings ***
Documentation  uOpen regression test script
Resource  ../../Resources/Common/CommonLib.robot  # for all helper functions
Resource  ../../Resources/uOpen/uOpenKeyword.robot  # for lower level keywords in test cases
Test Setup  CommonLib.Begin Web Test
Test Teardown  CommonLib.End Web Test

# Command: robot -d Results Tests\uOpen\uOpen_Driver.robot

*** Test Cases ***
Create A New Application
    [Documentation]  E2E Test Case which will create a new account
    [Tags]  Build Acceptance Test
    uOpenKeyword.Complete the Welcome Page
    uOpenKeyword.Complete the Primary Applicant page
    uOpenKeyword.Complete the Account Selection Page
    uOpenKeyword.Complete the Fund Account Page
    uOpenKeyword.Verify the Confirmation Page and Submit

# This is a test!