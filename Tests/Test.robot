*** Settings ***
Documentation    This is first testcase
Library    SeleniumLibrary
Library    ../Library/TestLibrary.py
Suite Setup    MY SUITE SETUP
Suite Teardown    MY SUITE TEARDOWN
Test Setup    MY TEST SETUP
Test Teardown    CLOSE BROWSERS


*** Test Cases ***
TC_01_ICICI_HOME_PAGE
    [Documentation]    This is ICICI home page
    [Tags]    Sanity
    comment    set log level    Debug
    OPEN BROWSER AND NAVIGATE    https://www.icicibank.com    chrome
    comment    set log level    Info
    GET CURRENT TIME

TC_02_HDFC_HOME_PAGE
    [Documentation]    This is HDFC Bank home page
    [Tags]    Smoke
    OPEN BROWSER AND NAVIGATE    https://www.hdfcbank.com    chrome

TC_03_GOOGLE_HOME_PAGE
    [Documentation]    This is HDFC Bank home page
    [Tags]    Smoke
    OPEN BROWSER AND NAVIGATE    https://www.google.com    chrome


*** Keywords ***
OPEN BROWSER AND NAVIGATE
    [Arguments]    ${url}  ${browser}
    open browser   ${url}    ${browser}
    maximize browser window
    log    get title
    @{links}=    get webelements    xpath=//a
    #FOR    ${link}    IN    @{links}
        #log    get element attribute    ${link}    name
        #log    ${link.name}
        #log    ${link}
        #log    get text    ${link}
    #    ${v}=    Get Element Attribute    ${link}    text
    #    log    ${v}
    #END
    ${index}    set variable    1
    click element    @{links}[${index}]
    sleep    5s



CLOSE BROWSERS
    close all browsers
    log    ${TEST STATUS}
    log    ${TEST MESSAGE}

MY TEST SETUP
    log    ${TEST_NAME}

MY SUITE SETUP
    log    My suite setup


MY SUITE TEARDOWN
    log    My Suite Teardown

GET CURRENT TIME
    Get Current

GET LINKS
    @{links}=    GET ALL LINKS
    FOR    ${link}    IN    @{links}
        log    get element attribute    ${link}    href
    END
