*** Settings ***
Resource   ${CURDIR}/../resources/common.robot

Suite Setup    Open Browser to    ${SERVER}

Suite Teardown    Close Browser

*** Test Cases ***
Page Has Hello
  Page Should Contain    Hello
