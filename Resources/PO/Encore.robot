*** Settings ***
Library  SeleniumLibrary

## In this test some browser cannot pass some steps because
## Some elements need to be in focus and viewed in browser
## But some browsers (Firefox, Safari) do not scroll to active
## Element automatically and explicit scroll doesn't work well

*** Variables ***
${ENCORE_HEADER_TEXT} =  2020 ENCORE
${ENCORE_MAIN_HEADER} =  css=body > div:nth-child(4) > div > div.q-margin-base.q-headline > div > div > h1
${ENCORE_COOKIES_CLOSE_BUTTON} =  xpath=/html/body/div[31]/div[2]/div/div/div/div[3]
${ENCORE_VIDEO_IFRAME_DIV_CLASS} =  js-visibility none-margin
${ENCORE_VIDEO_COLORS_IFRAME} =  xpath=/html/body/div[9]/div/div[3]/div/iframe
${ENCORE_VIDEO_DIV_SELECTOR} =  xpath=//*[@id="colorizerTop"]/video
${ENCORE_VIEW_ALL_SPECS} =  xpath=/html/body/div[30]/div[2]/a

${ENCORE_FIRST_COLOR_SELECTOR} =  xpath=/html/body/row/column/row[1]/column/div[2]/div[1]
${ENCORE_SECOND_COLOR_SELECTOR} =  xpath=/html/body/row/column/row[1]/column/div[2]/div[2]
${ENCORE_THIRD_COLOR_SELECTOR} =  xpath=/html/body/row/column/row[1]/column/div[2]/div[3]
${ENCORE_FORTH_COLOR_SELECTOR} =  xpath=/html/body/row/column/row[1]/column/div[2]/div[4]

${ENCORE_FIRST_COLOR_VIDEO_SRC} =  https://video2.marketing.gm.com/media/v1/pmp4/static/clear/1274068600/d6dad574-d910-463b-8e3c-bcc8457b07b7/0d32a5d2-34aa-42da-949e-7884f69e329c/main.mp4
${ENCORE_SECOND_COLOR_VIDEO_SRC} =  https://video2.marketing.gm.com/media/v1/pmp4/static/clear/1274068600/edf48c1f-ed42-4c67-af09-7b546b0925ef/14a4ff7d-680f-478c-bc7d-4123270267db/main.mp4
${ENCORE_THIRD_COLOR_VIDEO_SRC} =  https://video2.marketing.gm.com/media/v1/pmp4/static/clear/1274068600/b49c1c2a-e2fa-412b-8fd6-ae63751a123c/845d60e6-dbaa-48e0-afae-c65b7ec910e1/main.mp4
${ENCORE_FORTH_COLOR_VIDEO_SRC} =  https://video2.marketing.gm.com/media/v1/pmp4/static/clear/1274068600/78f0170a-8371-43c8-a491-5add3dd572c0/52999588-a4a6-45ea-ad7d-9163a6c03010/main.mp4

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains Element    ${ENCORE_MAIN_HEADER}
    Wait Until Element Is Visible       ${ENCORE_MAIN_HEADER}
    ${current_header_text} =  get text  ${ENCORE_MAIN_HEADER}
    should be equal as strings  ${current_header_text.strip()}  ${ENCORE_HEADER_TEXT.strip()}  ignore_case=true
    Sleep  1s
    ${contains_cookies_message} =  Run Keyword And Return Status  Wait Until Element Is Visible  ${ENCORE_COOKIES_CLOSE_BUTTON}
    Run Keyword If  ${contains_cookies_message}  Encore.Close Cookies Message

Close Cookies Message
    Mouse Over  ${ENCORE_COOKIES_CLOSE_BUTTON}
    Sleep  0.5s
    Click Element  ${ENCORE_COOKIES_CLOSE_BUTTON}

Verify Colours Loaded
    Page Should Contain Element      ${ENCORE_VIDEO_COLORS_IFRAME}
    #    TODO: SCROLL TO BUTTON (For Some Browsers)
    Wait Until Element is visible    ${ENCORE_VIDEO_COLORS_IFRAME}     timeout=5s
    Set Focus To Element             ${ENCORE_VIDEO_COLORS_IFRAME}
    Select Frame                     ${ENCORE_VIDEO_COLORS_IFRAME}

Check First Color
    Encore.Verify Color Selected   ${ENCORE_FIRST_COLOR_SELECTOR}
    Encore.Verify Color Loaded     ${ENCORE_FIRST_COLOR_VIDEO_SRC}

Check Second Color
    Encore.Switch To Color         ${ENCORE_SECOND_COLOR_SELECTOR}
    Encore.Verify Color Selected   ${ENCORE_SECOND_COLOR_SELECTOR}
    Encore.Verify Color Loaded     ${ENCORE_SECOND_COLOR_VIDEO_SRC}

Check Third Color
    Encore.Switch To Color         ${ENCORE_THIRD_COLOR_SELECTOR}
    Encore.Verify Color Selected   ${ENCORE_THIRD_COLOR_SELECTOR}
    Encore.Verify Color Loaded     ${ENCORE_THIRD_COLOR_VIDEO_SRC}

Check Fourth Color
    Encore.Switch To Color         ${ENCORE_FORTH_COLOR_SELECTOR}
    Encore.Verify Color Selected   ${ENCORE_FORTH_COLOR_SELECTOR}
    Encore.Verify Color Loaded     ${ENCORE_FORTH_COLOR_VIDEO_SRC}

Go To "Specs" Page
    Page Should Contain Element         ${ENCORE_VIEW_ALL_SPECS}
#    TODO: SCROLL TO BUTTON (For Some Browsers)
    Click Element                       ${ENCORE_VIEW_ALL_SPECS}

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
    ${current_color_video} =  Get Element Attribute  ${ENCORE_VIDEO_DIV_SELECTOR}  src
    Should Be Equal As Strings  ${current_color_video}  ${color_video}  ignore_case=true