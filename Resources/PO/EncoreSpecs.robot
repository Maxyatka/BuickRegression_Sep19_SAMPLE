*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${ENCORE_FEATURES_HEADER_TEXT} =  FEATURES
${ENCORE_FEATURES_HEADER} =  //*[@id="byo-web-ui"]/div/div/div[1]/div/div[2]/a[1]

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains Element  ${ENCORE_FEATURES_HEADER}
    ${current_header_text} =  get text  ${ENCORE_FEATURES_HEADER}
    should be equal as strings  ${current_header_text.strip()}  ${ENCORE_FEATURES_HEADER_TEXT.strip()}  ignore_case=true
