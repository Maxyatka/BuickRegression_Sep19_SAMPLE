*** Settings ***
Library  SeleniumLibrary

## In this test some browser cannot pass some steps because
## Some elements need to be in focus and viewed in browser
## But some browsers (Firefox, Safari) do not scroll to active
## Element automatically and explicit scroll doesn't work well

*** Variables ***
${ENCOREGX_HEADER_TEXT} =  2020 ENCORE GX
${ENCOREGX_MAIN_HEADER} =  css=body > div:nth-child(4) > div > div.q-margin-base.q-headline > div > div > h1
${ENCOREGX_COOKIES_CLOSE_BUTTON} =  xpath=/html/body/div[31]/div[2]/div/div/div/div[3]
${ENCOREGX_VIDEO_IFRAME_DIV_CLASS} =  js-visibility none-margin
${ENCOREGX_VIDEO_COLORS_IFRAME} =  xpath=/html/body/div[10]/div/div/div/iframe
${ENCOREGX_VIDEO_DIV_SELECTOR} =  xpath=//*[@id="colorizerTop"]/video
${ENCOREGX_VIEW_ALL_FEATURES} =  xpath=/html/body/div[21]/div[2]/a

${ENCOREGX_FIRST_COLOR_SELECTOR} =  xpath=/html/body/row/column/row[1]/column/div[2]/div[1]
${ENCOREGX_SECOND_COLOR_SELECTOR} =  xpath=/html/body/row/column/row[1]/column/div[2]/div[2]
${ENCOREGX_THIRD_COLOR_SELECTOR} =  xpath=/html/body/row/column/row[1]/column/div[2]/div[3]
${ENCOREGX_FORTH_COLOR_SELECTOR} =  xpath=/html/body/row/column/row[1]/column/div[2]/div[4]
${ENCOREGX_FIFTH_COLOR_SELECTOR} =  xpath=/html/body/row/column/row[1]/column/div[2]/div[5]
${ENCOREGX_SIXTH_COLOR_SELECTOR} =  xpath=/html/body/row/column/row[1]/column/div[2]/div[6]
${ENCOREGX_SEVENTH_COLOR_SELECTOR} =  xpath=/html/body/row/column/row[1]/column/div[2]/div[7]
${ENCOREGX_EIGHTH_COLOR_SELECTOR} =  xpath=/html/body/row/column/row[1]/column/div[2]/div[8]
${ENCOREGX_NINTH_COLOR_SELECTOR} =  xpath=/html/body/row/column/row[1]/column/div[2]/div[9]

${ENCOREGX_FIRST_COLOR_VIDEO_SRC} =  https://video2.marketing.gm.com/media/v1/pmp4/static/clear/1274068600/4a06c792-1a0a-4761-befa-50e650417f2f/15f4dad7-d3d3-4a16-ae34-95be97467da0/main.mp4
${ENCOREGX_SECOND_COLOR_VIDEO_SRC} =  https://video2.marketing.gm.com/media/v1/pmp4/static/clear/1274068600/d0bc1105-9837-42c7-b7fd-dbacf3f4f6af/08b6d25e-8d97-4be3-83f9-34838daf1656/main.mp4
${ENCOREGX_THIRD_COLOR_VIDEO_SRC} =  https://video2.marketing.gm.com/media/v1/pmp4/static/clear/1274068600/44a077af-6f3a-41f5-bc0f-80aa8499d018/1ab0c3ef-7f1b-40f8-95c8-afa3af96253e/main.mp4
${ENCOREGX_FORTH_COLOR_VIDEO_SRC} =  https://video2.marketing.gm.com/media/v1/pmp4/static/clear/1274068600/e72b58f8-6918-4456-9606-0a0f826a7d28/bdc46c3c-0c51-4f9d-9a27-af3b03bcdcf0/main.mp4
${ENCOREGX_FIFTH_COLOR_VIDEO_SRC} =  https://video2.marketing.gm.com/media/v1/pmp4/static/clear/1274068600/43c8414a-15bd-423b-b3a6-dd00790509a5/df56e813-dbff-4e18-ba3e-76a037dfc34b/main.mp4
${ENCOREGX_SIXTH_COLOR_VIDEO_SRC} =  https://video2.marketing.gm.com/media/v1/pmp4/static/clear/1274068600/be5dc254-4774-4c40-bc34-0f82a4886dc2/43fe4fe3-d193-4d94-b9e8-62b29911a640/main.mp4
${ENCOREGX_SEVENTH_COLOR_VIDEO_SRC} =  https://video2.marketing.gm.com/media/v1/pmp4/static/clear/1274068600/94f6ea8d-44f3-4ba3-b567-148c25de85b5/728eafa1-f7e3-4a45-9d46-0897e898c370/main.mp4
${ENCOREGX_EIGHTH_COLOR_VIDEO_SRC} =  https://video2.marketing.gm.com/media/v1/pmp4/static/clear/1274068600/5552e2c3-e605-42b3-881c-80d63669ce67/c9c0a2c9-6b43-4ecc-8cc4-e96e298cbcbc/main.mp4
${ENCOREGX_NINTH_COLOR_VIDEO_SRC} =  https://video2.marketing.gm.com/media/v1/pmp4/static/clear/1274068600/b49c6cc7-30f4-4c6e-9d2e-8be3ac6ccb51/9699c7cd-38c5-4e68-9829-85c05aa05bed/main.mp4

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains Element    ${ENCOREGX_MAIN_HEADER}
    Wait Until Element Is Visible       ${ENCOREGX_MAIN_HEADER}
    ${current_header_text} =  get text  ${ENCOREGX_MAIN_HEADER}
    should be equal as strings  ${current_header_text.strip()}  ${ENCOREGX_HEADER_TEXT.strip()}  ignore_case=true
    Sleep  1s
    ${contains_cookies_message} =  Run Keyword And Return Status  Wait Until Element Is Visible  ${ENCOREGX_COOKIES_CLOSE_BUTTON}
    Run Keyword If  ${contains_cookies_message}  EncoreGX.Close Cookies Message

Close Cookies Message
    Mouse Over  ${ENCOREGX_COOKIES_CLOSE_BUTTON}
    Sleep  0.5s
    Click Element  ${ENCOREGX_COOKIES_CLOSE_BUTTON}

Verify Colours Loaded
    Page Should Contain Element      ${ENCOREGX_VIDEO_COLORS_IFRAME}
    #    TODO: SCROLL TO BUTTON (For Some Browsers)
    Wait Until Element is visible    ${ENCOREGX_VIDEO_COLORS_IFRAME}     timeout=5s
    Set Focus To Element             ${ENCOREGX_VIDEO_COLORS_IFRAME}
    Select Frame                     ${ENCOREGX_VIDEO_COLORS_IFRAME}

Check First Color
    EncoreGX.Verify Color Selected   ${ENCOREGX_FIRST_COLOR_SELECTOR}
    EncoreGX.Verify Color Loaded     ${ENCOREGX_FIRST_COLOR_VIDEO_SRC}

Check Second Color
    EncoreGX.Switch To Color         ${ENCOREGX_SECOND_COLOR_SELECTOR}
    EncoreGX.Verify Color Selected   ${ENCOREGX_SECOND_COLOR_SELECTOR}
    EncoreGX.Verify Color Loaded     ${ENCOREGX_SECOND_COLOR_VIDEO_SRC}

Check Third Color
    EncoreGX.Switch To Color         ${ENCOREGX_THIRD_COLOR_SELECTOR}
    EncoreGX.Verify Color Selected   ${ENCOREGX_THIRD_COLOR_SELECTOR}
    EncoreGX.Verify Color Loaded     ${ENCOREGX_THIRD_COLOR_VIDEO_SRC}

Check Fourth Color
    EncoreGX.Switch To Color         ${ENCOREGX_FORTH_COLOR_SELECTOR}
    EncoreGX.Verify Color Selected   ${ENCOREGX_FORTH_COLOR_SELECTOR}
    EncoreGX.Verify Color Loaded     ${ENCOREGX_FORTH_COLOR_VIDEO_SRC}

Check Fifth Color
    EncoreGX.Switch To Color         ${ENCOREGX_FIFTH_COLOR_SELECTOR}
    EncoreGX.Verify Color Selected   ${ENCOREGX_FIFTH_COLOR_SELECTOR}
    EncoreGX.Verify Color Loaded     ${ENCOREGX_FIFTH_COLOR_VIDEO_SRC}

Check Sixth Color
    EncoreGX.Switch To Color         ${ENCOREGX_SIXTH_COLOR_SELECTOR}
    EncoreGX.Verify Color Selected   ${ENCOREGX_SIXTH_COLOR_SELECTOR}
    EncoreGX.Verify Color Loaded     ${ENCOREGX_SIXTH_COLOR_VIDEO_SRC}

Check Seventh Color
    EncoreGX.Switch To Color         ${ENCOREGX_SEVENTH_COLOR_SELECTOR}
    EncoreGX.Verify Color Selected   ${ENCOREGX_SEVENTH_COLOR_SELECTOR}
    EncoreGX.Verify Color Loaded     ${ENCOREGX_SEVENTH_COLOR_VIDEO_SRC}

Check Eighth Color
    EncoreGX.Switch To Color         ${ENCOREGX_EIGHTH_COLOR_SELECTOR}
    EncoreGX.Verify Color Selected   ${ENCOREGX_EIGHTH_COLOR_SELECTOR}
    EncoreGX.Verify Color Loaded     ${ENCOREGX_EIGHTH_COLOR_VIDEO_SRC}

Check Ninth Color
    EncoreGX.Switch To Color         ${ENCOREGX_NINTH_COLOR_SELECTOR}
    EncoreGX.Verify Color Selected   ${ENCOREGX_NINTH_COLOR_SELECTOR}
    EncoreGX.Verify Color Loaded     ${ENCOREGX_NINTH_COLOR_VIDEO_SRC}

Go To "Features" Page
    Page Should Contain Element         ${ENCOREGX_VIEW_ALL_FEATURES}
#    TODO: SCROLL TO BUTTON (For Some Browsers)
    Click Element                       ${ENCOREGX_VIEW_ALL_FEATURES}

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
    ${current_color_video} =  Get Element Attribute  ${ENCOREGX_VIDEO_DIV_SELECTOR}  src
    Should Be Equal As Strings  ${current_color_video}  ${color_video}  ignore_case=true