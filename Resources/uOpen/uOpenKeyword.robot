*** Settings ***
Resource  ../../Resources/uOpen/PO/1BeforeApplying.robot
Resource  ../../Resources/uOpen/PO/2PrimaryApplicant.robot
Resource  ../../Resources/uOpen/PO/3AccountSelection.robot
Resource  ../../Resources/uOpen/PO/4FundAccount.robot
Resource  ../../Resources/uOpen/PO/5Confirmation.robot
#Resource  ../../Resources/uOpen/PO/PrivacyError.robot
#Resource  ../../Resources/uOpen/PO/SavedAppSignIn.robot

*** Keywords ***
#Privacy Error Page
    #preLanding.Check for Page and Proceed to App

Complete the Welcome Page
    1BeforeApplying.Verify Page Loaded
    1BeforeApplying.Get the Main Page Title
    1BeforeApplying.Load the Page Data
    1BeforeApplying.Complete Disclose and Consent
    1BeforeApplying.Fill in Membership and Personal Info
    1BeforeApplying.Select Continue button

Complete the Primary Applicant page
    2PrimaryApplicant.Verify Page Loaded
    2PrimaryApplicant.Load the Page Data
    2PrimaryApplicant.Fill in Personal Identify Info
    2PrimaryApplicant.Fill in Address Contact Info
    2PrimaryApplicant.Fill in Employment and Income Info
    2PrimaryApplicant.Fill in Other Information
    2PrimaryApplicant.Select Continue button

Complete the Account Selection Page
    3AccountSelection.Verify Page Loaded
    #3AccountSelection.Load the Page Data
    3AccountSelection.Select the Account
    3AccountSelection.Fill in Additional Products and Services
    3AccountSelection.Select Continue button

Complete the Fund Account Page
    4FundAccount.Verify Page Loaded
    4FundAccount.Load the Page Data
    4FundAccount.Fill in the Disclosures Info
    4FundAccount.Input New Account Value
    4FundAccount.Select the Funding Source
    4FundAccount.Select Continue button

Verify the Confirmation Page and Submit
    5Confirmation.Verify Page Loaded
    5Confirmation.Check for Application Confirmation Number
    5Confirmation.Check for Products Selected
    5Confirmation.Check for Amount Value
    5Confirmation.Check for Account Status
    5Confirmation.Check for Additional Services
    5Confirmation.Finish the Application
