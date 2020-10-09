*** Settings ***
Library  SeleniumLibrary
Library  ./../Saucelabs.py

*** Variables ***


*** Keywords ***
Begin Local Web Test
    Open Browser  about:blank  ${BROWSER}
    Maximize Browser Window

Begin Remote Web Test
    Open Browser  about:blank  ${BROWSER}
                ...  remote_url=${REMOTE_URL}
                ...  desired_capabilities=${DESIRED_CAPABILITIES}

    Maximize Browser Window

End Web Test
    Run Keyword If  '${REMOTE_URL}' != ''
        ...  update_saucelabs_test_name
        ...  ${SUITE_NAME}: ${TEST_NAME}
        ...  ${TEST_STATUS}  ${TEST_TAGS}  ${REMOTE_URL}
    Close Browser