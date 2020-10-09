*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${ENVISION_FEATURES_HEADER_TEXT} =  FEATURES
${ENVISION_FEATURES_HEADER} =  xpath=/html/body/div[5]/div/div[3]/div/div/h1

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains Element  ${ENVISION_FEATURES_HEADER}
    ${current_header_text} =  get text  ${ENVISION_FEATURES_HEADER}
    should be equal as strings  ${current_header_text.strip()}  ${ENVISION_FEATURES_HEADER_TEXT.strip()}  ignore_case=true
