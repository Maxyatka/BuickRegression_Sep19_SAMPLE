*** Settings ***
Library  SeleniumLibrary

## In this test some browser cannot pass some steps because
## Some elements need to be in focus and viewed in browser
## But some browsers (Firefox, Safari) do not scroll to active
## Element automatically and explicit scroll doesn't work well

*** Variables ***
${ENCLAVE_HEADER_TEXT} =  2020 ENCLAVE
${ENCLAVE_MAIN_HEADER} =  css=body > div:nth-child(4) > div > div.q-margin-base.q-headline > div > div > h1
${ENCLAVE_COOKIES_CLOSE_BUTTON} =  xpath=/html/body/div[31]/div[2]/div/div/div/div[3]
${ENCLAVE_VIDEO_IFRAME_DIV_CLASS} =  js-visibility none-margin
${ENCLAVE_VIDEO_COLORS_IFRAME} =  xpath=/html/body/div[11]/div/div/div/iframe
${ENCLAVE_VIDEO_DIV_SELECTOR} =  xpath=//*[@id="colorizerTop"]/video
${ENCLAVE_VIEW_ALL_FEATURES} =  xpath=/html/body/div[21]/div[2]/a

${ENCLAVE_FIRST_COLOR_SELECTOR} =  xpath=/html/body/row/column/row/column/div/div[2]/div[1]
${ENCLAVE_SECOND_COLOR_SELECTOR} =  xpath=/html/body/row/column/row/column/div/div[2]/div[2]
${ENCLAVE_THIRD_COLOR_SELECTOR} =  xpath=/html/body/row/column/row/column/div/div[2]/div[3]
${ENCLAVE_FORTH_COLOR_SELECTOR} =  xpath=/html/body/row/column/row/column/div/div[2]/div[4]
${ENCLAVE_FIFTH_COLOR_SELECTOR} =  xpath=/html/body/row/column/row/column/div/div[2]/div[5]
${ENCLAVE_SIXTH_COLOR_SELECTOR} =  xpath=/html/body/row/column/row/column/div/div[2]/div[6]
${ENCLAVE_SEVENTH_COLOR_SELECTOR} =  xpath=/html/body/row/column/row/column/div/div[2]/div[7]
${ENCLAVE_EIGHTH_COLOR_SELECTOR} =  xpath=/html/body/row/column/row/column/div/div[2]/div[8]
${ENCLAVE_NINTH_COLOR_SELECTOR} =  xpath=/html/body/row/column/row/column/div/div[2]/div[9]
${ENCLAVE_TENTH_COLOR_SELECTOR} =  xpath=/html/body/row/column/row/column/div/div[2]/div[10]

${ENCLAVE_FIRST_COLOR_VIDEO_SRC} =  https://video.marketing.gm.com/1274068600/201908/1125/1274068600_6068378857001_6068375429001.mp4
${ENCLAVE_SECOND_COLOR_VIDEO_SRC} =  https://video.marketing.gm.com/1274068600/201908/2819/1274068600_6068379568001_6068363468001.mp4
${ENCLAVE_THIRD_COLOR_VIDEO_SRC} =  https://video.marketing.gm.com/1274068600/201908/3813/1274068600_6068379027001_6068369997001.mp4
${ENCLAVE_FORTH_COLOR_VIDEO_SRC} =  https://video.marketing.gm.com/1274068600/201908/2331/1274068600_6068377073001_6068371141001.mp4
${ENCLAVE_FIFTH_COLOR_VIDEO_SRC} =  https://video.marketing.gm.com/1274068600/201908/3323/1274068600_6068376677001_6068374229001.mp4
${ENCLAVE_SIXTH_COLOR_VIDEO_SRC} =  https://video.marketing.gm.com/1274068600/201908/2323/1274068600_6068379468001_6068374230001.mp4
${ENCLAVE_SEVENTH_COLOR_VIDEO_SRC} =  https://video.marketing.gm.com/1274068600/201908/2813/1274068600_6068377068001_6068369996001.mp4
${ENCLAVE_EIGHTH_COLOR_VIDEO_SRC} =  https://video2.marketing.gm.com/media/v1/pmp4/static/clear/1274068600/35d79ee3-0f2c-402c-8cf1-8a47c6f39ef0/9dc400a6-293e-4ec3-a586-b53de473632c/main.mp4
${ENCLAVE_NINTH_COLOR_VIDEO_SRC} =  https://video.marketing.gm.com/1274068600/201908/3747/1274068600_6068378738001_6068366632001.mp4
${ENCLAVE_TENTH_COLOR_VIDEO_SRC} =  https://video.marketing.gm.com/1274068600/201908/1628/1274068600_6069106806001_6069101968001.mp4

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains Element    ${ENCLAVE_MAIN_HEADER}
    Wait Until Element Is Visible       ${ENCLAVE_MAIN_HEADER}
    ${current_header_text} =  get text  ${ENCLAVE_MAIN_HEADER}
    should be equal as strings  ${current_header_text.strip()}  ${ENCLAVE_HEADER_TEXT.strip()}  ignore_case=true
    Sleep  1s
    ${contains_cookies_message} =  Run Keyword And Return Status  Wait Until Element Is Visible  ${ENCLAVE_COOKIES_CLOSE_BUTTON}
    Run Keyword If  ${contains_cookies_message}  Enclave.Close Cookies Message

Close Cookies Message
    Mouse Over  ${ENCLAVE_COOKIES_CLOSE_BUTTON}
    Sleep  0.5s
    Click Element  ${ENCLAVE_COOKIES_CLOSE_BUTTON}

Verify Colours Loaded
    Page Should Contain Element      ${ENCLAVE_VIDEO_COLORS_IFRAME}
    #    TODO: SCROLL TO BUTTON (For Some Browsers)
    Wait Until Element is visible    ${ENCLAVE_VIDEO_COLORS_IFRAME}     timeout=5s
    Set Focus To Element             ${ENCLAVE_VIDEO_COLORS_IFRAME}
    Select Frame                     ${ENCLAVE_VIDEO_COLORS_IFRAME}

Check First Color
    Enclave.Verify Color Selected   ${ENCLAVE_FIRST_COLOR_SELECTOR}
    Enclave.Verify Color Loaded     ${ENCLAVE_FIRST_COLOR_VIDEO_SRC}

Check Second Color
    Enclave.Switch To Color         ${ENCLAVE_SECOND_COLOR_SELECTOR}
    Enclave.Verify Color Selected   ${ENCLAVE_SECOND_COLOR_SELECTOR}
    Enclave.Verify Color Loaded     ${ENCLAVE_SECOND_COLOR_VIDEO_SRC}

Check Third Color
    Enclave.Switch To Color         ${ENCLAVE_THIRD_COLOR_SELECTOR}
    Enclave.Verify Color Selected   ${ENCLAVE_THIRD_COLOR_SELECTOR}
    Enclave.Verify Color Loaded     ${ENCLAVE_THIRD_COLOR_VIDEO_SRC}

Check Fourth Color
    Enclave.Switch To Color         ${ENCLAVE_FORTH_COLOR_SELECTOR}
    Enclave.Verify Color Selected   ${ENCLAVE_FORTH_COLOR_SELECTOR}
    Enclave.Verify Color Loaded     ${ENCLAVE_FORTH_COLOR_VIDEO_SRC}

Check Fifth Color
    Enclave.Switch To Color         ${ENCLAVE_FIFTH_COLOR_SELECTOR}
    Enclave.Verify Color Selected   ${ENCLAVE_FIFTH_COLOR_SELECTOR}
    Enclave.Verify Color Loaded     ${ENCLAVE_FIFTH_COLOR_VIDEO_SRC}

Check Sixth Color
    Enclave.Switch To Color         ${ENCLAVE_SIXTH_COLOR_SELECTOR}
    Enclave.Verify Color Selected   ${ENCLAVE_SIXTH_COLOR_SELECTOR}
    Enclave.Verify Color Loaded     ${ENCLAVE_SIXTH_COLOR_VIDEO_SRC}

Check Seventh Color
    Enclave.Switch To Color         ${ENCLAVE_SEVENTH_COLOR_SELECTOR}
    Enclave.Verify Color Selected   ${ENCLAVE_SEVENTH_COLOR_SELECTOR}
    Enclave.Verify Color Loaded     ${ENCLAVE_SEVENTH_COLOR_VIDEO_SRC}

Check Eighth Color
    Enclave.Switch To Color         ${ENCLAVE_EIGHTH_COLOR_SELECTOR}
    Enclave.Verify Color Selected   ${ENCLAVE_EIGHTH_COLOR_SELECTOR}
    Enclave.Verify Color Loaded     ${ENCLAVE_EIGHTH_COLOR_VIDEO_SRC}

Check Ninth Color
    Enclave.Switch To Color         ${ENCLAVE_NINTH_COLOR_SELECTOR}
    Enclave.Verify Color Selected   ${ENCLAVE_NINTH_COLOR_SELECTOR}
    Enclave.Verify Color Loaded     ${ENCLAVE_NINTH_COLOR_VIDEO_SRC}

Check Tenth Color
    Enclave.Switch To Color         ${ENCLAVE_TENTH_COLOR_SELECTOR}
    Enclave.Verify Color Selected   ${ENCLAVE_TENTH_COLOR_SELECTOR}
    Enclave.Verify Color Loaded     ${ENCLAVE_TENTH_COLOR_VIDEO_SRC}

Go To "Features" Page
    Page Should Contain Element         ${ENCLAVE_VIEW_ALL_FEATURES}
#    TODO: SCROLL TO BUTTON (For Some Browsers)
    Click Element                       ${ENCLAVE_VIEW_ALL_FEATURES}

# Utility Parameterized Keywords
Switch To Color
    [Arguments]  ${color_to_switch}
    Sleep  2s
    Click Element  ${color_to_switch}

Verify Color Selected
    [Arguments]  ${selected_color}
    ${active_class} =  Get Element Attribute  ${selected_color}  class
    Should Contain  ${active_class}  active  ignore_case=true

Verify Color Loaded
    [Arguments]  ${color_video}
    ${current_color_video} =  Get Element Attribute  ${ENCLAVE_VIDEO_DIV_SELECTOR}  src
    Should Be Equal As Strings  ${current_color_video}  ${color_video}  ignore_case=true