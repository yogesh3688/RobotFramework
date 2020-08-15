*** Settings ***
Documentation    This is first testcase
Library    SeleniumLibrary
Suite Setup    MY SUITE SETUP
Suite Teardown    MY SUITE TEARDOWN
Test Setup    MY TEST SETUP
Test Teardown    CLOSE BROWSERS


*** Test Cases ***
TC_01_ICICI_HOME_PAGE
    [Documentation]    This is ICICI home page
    [Tags]    Sanity
    OPEN BROWSER AND NAVIGATE    https://www.icicibank.com    chrome


TC_02_HDFC_HOME_PAGE
    [Documentation]    This is HDFC Bank home page
    [Tags]    Smoke
    OPEN BROWSER AND NAVIGATE    https://www.hdfcbank.com    chrome



*** Keywords ***
OPEN BROWSER AND NAVIGATE
    [Arguments]    ${url}  ${browser}
    open browser   ${url}    ${browser}
    maximize browser window
    log    get title


CLOSE BROWSERS
    close all browsers

MY TEST SETUP
    log    ${TEST_NAME}

MY SUITE SETUP
    log    My suite setup


MY SUITE TEARDOWN
    log    My Suite Teardown

