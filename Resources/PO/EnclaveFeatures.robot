*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${ENCLAVE_FEATURES_HEADER_TEXT} =  FEATURES
${ENCLAVE_FEATURES_HEADER} =  xpath=/html/body/div[6]/div/div/div/div/h1

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains Element  ${ENCLAVE_FEATURES_HEADER}
    ${current_header_text} =  get text  ${ENCLAVE_FEATURES_HEADER}
    should be equal as strings  ${current_header_text.strip()}  ${ENCLAVE_FEATURES_HEADER_TEXT.strip()}  ignore_case=true
