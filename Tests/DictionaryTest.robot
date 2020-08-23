*** Settings ***

*** Variables ***
${ENV}  qa
&{URL}  dev=I am DEV  qa=I am QA  stage=I am STAGE

*** Test Cases ***
01_TEST_FIRST
    log    ${TEST_NAME}
    log    ${URL.${ENV}}


02_TEST_MULTIPLE_VALUES
    [Template]    MULTIPLE VALUES
    one    two    three
    four    five    Six
    seven    eight    nine

*** Keywords ***
MULTIPLE VALUES
    [Arguments]    ${first}    ${second}    ${three}
    log    first
    log    second
    log    three