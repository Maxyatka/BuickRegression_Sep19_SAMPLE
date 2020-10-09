*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${MAIN_HOME_LINK} =  xpath=/html/body/div[2]/div[2]/nav/section/a
${MAIN_COOKIES_CLOSE_BUTTON} =  xpath=/html/body/div[18]/div[2]/div/div/div/div[3]
${VEHICLES_DROPDOWN} =  xpath=/html/body/div[2]/div[2]/nav/section/div/ul[1]/li[1]/a
${ENCORE_LINK} =  xpath=/html/body/div[2]/div[3]/div/div/div[2]/div/div/div/div[2]/div[1]
${ENCOREGX_LINK} =  xpath=/html/body/div[2]/div[3]/div/div/div[2]/div/div/div/div[2]/div[2]
${ENVISION_LINK} =  xpath=/html/body/div[2]/div[3]/div/div/div[2]/div/div/div/div[2]/div[7]
${ENCLAVE_LINK} =  xpath=/html/body/div[2]/div[3]/div/div/div[2]/div/div/div/div[2]/div[13]

*** Keywords ***
Open Main Page
    go to  ${URL}

Verify Page Loaded
    Wait Until Page Contains Element  ${MAIN_HOME_LINK}
    Sleep  1s
    ${contains_cookies_message} =  Run Keyword And Return Status  Wait Until Element Is Visible  ${MAIN_COOKIES_CLOSE_BUTTON}
    Run Keyword If  ${contains_cookies_message}  Main.Close Cookies Message

Close Cookies Message
    Mouse Over  ${MAIN_COOKIES_CLOSE_BUTTON}
    Sleep  0.5s
    Click Element  ${MAIN_COOKIES_CLOSE_BUTTON}

Click "Vehicles" Dropdown
    Click Element  ${VEHICLES_DROPDOWN}
    Wait Until Element Is Visible  ${ENCLAVE_LINK}

Go To "Encore" Page
    Click Element  ${ENCORE_LINK}

Go To "Encore GX" Page
    Click Element  ${ENCOREGX_LINK}

Go To "Envision" Page
    Click Element  ${ENVISION_LINK}

Go To "Enclave" Page
    Click Element  ${ENCLAVE_LINK}