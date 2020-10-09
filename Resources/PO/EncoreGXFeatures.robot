*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${ENCOREGX_FEATURES_HEADER_TEXT} =  FEATURES
${ENCOREGX_FEATURES_HEADER} =  xpath=/html/body/div[6]/div/div/div/div/h1

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains Element  ${ENCOREGX_FEATURES_HEADER}
    ${current_header_text} =  get text  ${ENCOREGX_FEATURES_HEADER}
    should be equal as strings  ${current_header_text.strip()}  ${ENCOREGX_FEATURES_HEADER_TEXT.strip()}  ignore_case=true
