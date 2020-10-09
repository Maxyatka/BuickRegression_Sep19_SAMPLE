*** Settings ***
Library  SeleniumLibrary

## In this test some browser cannot pass some steps because
## Some elements need to be in focus and viewed in browser
## But some browsers (Firefox, Safari) do not scroll to active
## Element automatically and explicit scroll doesn't work well

*** Variables ***
${ENVISION_HEADER_TEXT} =  2020 BUICK ENVISION
${ENVISION_MAIN_HEADER} =  css=body > div:nth-child(4) > div > div.q-margin-base.q-headline > div > div > h1
${COOKIES_CLOSE_BUTTON} =  xpath=/html/body/div[31]/div[2]/div/div/div/div[3]
${VIDEO_IFRAME_DIV_CLASS} =  js-visibility none-margin
${VIDEO_COLORS_IFRAME} =  xpath=/html/body/div[10]/div/div[3]/div/iframe
${VIDEO_DIV_SELECTOR} =  xpath=//*[@id="colorizerTop"]/video
${VIEW_ALL_FEATURES} =  xpath=/html/body/div[18]/div[2]/a

${FIRST_COLOR_SELECTOR} =  xpath=/html/body/row/column/row[1]/column/div[2]/div[1]
${SECOND_COLOR_SELECTOR} =  xpath=/html/body/row/column/row[1]/column/div[2]/div[2]
${THIRD_COLOR_SELECTOR} =  xpath=/html/body/row/column/row[1]/column/div[2]/div[3]
${FORTH_COLOR_SELECTOR} =  xpath=/html/body/row/column/row[1]/column/div[2]/div[4]
${FIFTH_COLOR_SELECTOR} =  xpath=/html/body/row/column/row[1]/column/div[2]/div[5]
${SIXTH_COLOR_SELECTOR} =  xpath=/html/body/row/column/row[1]/column/div[2]/div[6]

${FIRST_COLOR_VIDEO_SRC} =  https://video2.marketing.gm.com/media/v1/pmp4/static/clear/1274068600/3b2b9d79-d11d-48ca-ae9c-1803c7f3f251/65af911f-e523-46f5-b3a1-ec625ffb512b/main.mp4
${SECOND_COLOR_VIDEO_SRC} =  https://video2.marketing.gm.com/media/v1/pmp4/static/clear/1274068600/4e49fd15-f79a-4db7-bcc3-110a6541624d/3333ca09-6f12-4e9c-9766-5adf1b631513/main.mp4
${THIRD_COLOR_VIDEO_SRC} =  https://video2.marketing.gm.com/media/v1/pmp4/static/clear/1274068600/27a1eb20-616d-4a38-9962-c7db44b12adb/9db5fde7-dba2-40cc-b411-386b20a1a6e3/main.mp4
${FORTH_COLOR_VIDEO_SRC} =  https://video2.marketing.gm.com/media/v1/pmp4/static/clear/1274068600/0968991a-e6ed-4dea-94f8-196f581200c6/2181bbae-74cd-413b-bf6a-f77d01e105d8/main.mp4
${FIFTH_COLOR_VIDEO_SRC} =  https://video2.marketing.gm.com/media/v1/pmp4/static/clear/1274068600/bc9ff5ad-633e-4e8a-a99a-d923e5e21a92/c77be580-8407-4fb3-ab38-9d582fa9b91a/main.mp4
${SIXTH_COLOR_VIDEO_SRC} =  https://video2.marketing.gm.com/media/v1/pmp4/static/clear/1274068600/e26212fb-da62-4221-84ab-c44512e5e511/bad89498-ad27-44be-a0fc-ad27b909ae8f/main.mp4

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains Element    ${ENVISION_MAIN_HEADER}
    Wait Until Element Is Visible       ${ENVISION_MAIN_HEADER}
    ${current_header_text} =  get text  ${ENVISION_MAIN_HEADER}
    should be equal as strings  ${current_header_text.strip()}  ${ENVISION_HEADER_TEXT.strip()}  ignore_case=true
    Sleep  1s
    ${contains_cookies_message} =  Run Keyword And Return Status  Wait Until Element Is Visible  ${COOKIES_CLOSE_BUTTON}
    Run Keyword If  ${contains_cookies_message}  Envision.Close Cookies Message

Close Cookies Message
    Mouse Over  ${COOKIES_CLOSE_BUTTON}
    Sleep  0.5s
    Click Element  ${COOKIES_CLOSE_BUTTON}

Verify Colours Loaded
    Page Should Contain Element      ${VIDEO_COLORS_IFRAME}
    #    TODO: SCROLL TO BUTTON (For Some Browsers)
    Wait Until Element is visible    ${VIDEO_COLORS_IFRAME}     timeout=5s
    Set Focus To Element             ${VIDEO_COLORS_IFRAME}
    Select Frame                     ${VIDEO_COLORS_IFRAME}

Check First Color
    Envision.Verify Color Selected   ${FIRST_COLOR_SELECTOR}
    Envision.Verify Color Loaded     ${FIRST_COLOR_VIDEO_SRC}

Check Second Color
    Envision.Switch To Color         ${SECOND_COLOR_SELECTOR}
    Envision.Verify Color Selected   ${SECOND_COLOR_SELECTOR}
    Envision.Verify Color Loaded     ${SECOND_COLOR_VIDEO_SRC}

Check Third Color
    Envision.Switch To Color         ${THIRD_COLOR_SELECTOR}
    Envision.Verify Color Selected   ${THIRD_COLOR_SELECTOR}
    Envision.Verify Color Loaded     ${THIRD_COLOR_VIDEO_SRC}

Check Fourth Color
    Envision.Switch To Color         ${FORTH_COLOR_SELECTOR}
    Envision.Verify Color Selected   ${FORTH_COLOR_SELECTOR}
    Envision.Verify Color Loaded     ${FORTH_COLOR_VIDEO_SRC}

Check Fifth Color
    Envision.Switch To Color         ${FIFTH_COLOR_SELECTOR}
    Envision.Verify Color Selected   ${FIFTH_COLOR_SELECTOR}
    Envision.Verify Color Loaded     ${FIFTH_COLOR_VIDEO_SRC}

Check Sixth Color
    Envision.Switch To Color         ${SIXTH_COLOR_SELECTOR}
    Envision.Verify Color Selected   ${SIXTH_COLOR_SELECTOR}
    Envision.Verify Color Loaded     ${SIXTH_COLOR_VIDEO_SRC}

Go To "Features" Page
    Page Should Contain Element         ${VIEW_ALL_FEATURES}
#    TODO: SCROLL TO BUTTON (For Some Browsers)
    Click Element                       ${VIEW_ALL_FEATURES}

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
    ${current_color_video} =  Get Element Attribute  ${VIDEO_DIV_SELECTOR}  src
    Should Be Equal As Strings  ${current_color_video}  ${color_video}  ignore_case=true