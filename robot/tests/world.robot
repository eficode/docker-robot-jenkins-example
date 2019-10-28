*** Settings ***
Resource   ${CURDIR}/../resources/common.robot

Suite Setup    Open Browser to    ${SERVER}

Suite Teardown    Close Browser

*** Test Cases ***
Page Has World
  Page Should Contain    world

# # Failing test to test rerun mechanics
# Page Has Offworld Content
#   Page Should Contain    asteroids
