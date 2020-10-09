*** Settings ***
Documentation  This is a sample work project that test some functianality of Buick website
Resource  ../Resources/BuickApp.robot
Resource  ../Resources/Common.robot

Test Setup  Begin Web Test
Test Teardown  End Web Test

# robot -d Results Tests/Buick.robot            -- To run all Test Cases
# robot -d Results -i Colors Tests/Buick.robot   -- To run only Test Cases related to switchong colors
# robot -d Results -i CTA Tests/Buick.robot      -- To run only Test Cases related to CTA buttons


*** Variables ***
${BROWSER} =  chrome
${URL} =  https://www.buick.ca/en/

*** Test Cases ***
# Set of Test Cases related to the change of color when switching between them
Colors should successfully change for "Encore" in the 360 view
    [Documentation]  Colors successfully changed and appropriate video file is loaded in 360 view
    [Tags]  Medium Severity  Colors
    BuickApp.Go To Main Page
    BuickApp.Go To "Encore" Page
    BuickApp.Switch "Encore" Colors And Ensure Changes

Colors should successfully change for "Encore GX" in the 360 view
    [Documentation]  Colors successfully changed and appropriate video file is loaded in 360 view
    [Tags]  Medium Severity  Colors
    BuickApp.Go To Main Page
    BuickApp.Go To "Encore GX" Page
    BuickApp.Switch "Encore GX" Colors And Ensure Changes

Colors should successfully change for "Envision" in the 360 view
    [Documentation]  Colors successfully changed and appropriate video file is loaded in 360 view
    [Tags]  Medium Severity  Colors
    BuickApp.Go To Main Page
    BuickApp.Go To "Envision" Page
    BuickApp.Switch "Envision" Colors And Ensure Changes

Colors should successfully change for "Enclave" in the 360 view
    [Documentation]  Colors successfully changed and appropriate video file is loaded in 360 view
    [Tags]  Medium Severity  Colors
    BuickApp.Go To Main Page
    BuickApp.Go To "Enclave" Page
    BuickApp.Switch "Enclave" Colors And Ensure Changes

# Set of Test Cases related to ensuring that crucial CTA Buttons are clickable
# And appropriate page is loaded when clicking on any.
"Features" page is opened from "Encore" page and visible
    [Documentation]  When user navigates to Main > "Encore" > 'View All Specs', the Specs page is opened and visible
    [Tags]  Medium Severity  CTA
    BuickApp.Go To Main Page
    BuickApp.Go To "Encore" Page
    BuickApp.Go To "Encore" 'Specs' Page And Verify Loaded

"Specs" page is opened from "EncoreGX" page and visible
    [Documentation]  When user navigates to Main > "EncoreGX" > 'View All Features', the Features page is opened and visible
    [Tags]  Medium Severity  CTA
    BuickApp.Go To Main Page
    BuickApp.Go To "EncoreGX" Page
    BuickApp.Go To "Encore GX" 'Features' Page And Verify Loaded

"Features" page is opened from "Envision" page and visible
    [Documentation]  When user navigates to Main > "Envision" > 'View All Features', the Features page is opened and visible
    [Tags]  Medium Severity  CTA
    BuickApp.Go To Main Page
    BuickApp.Go To "Envision" Page
    BuickApp.Go To "Envision" 'Features' Page And Verify Loaded

"Features" page is opened from "Enclave" page and visible
    [Documentation]  When user navigates to Main > "Enclave" > 'View All Features', the Features page is opened and visible
    [Tags]  Medium Severity  CTA
    BuickApp.Go To Main Page
    BuickApp.Go To "Enclave" Page
    BuickApp.Go To "Enclave" 'Features' Page And Verify Loaded