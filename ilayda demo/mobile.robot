*** Settings ***
Library  AppiumLibrary
Library    Process
Library    Telnet

*** Variables ***

${REMOTE_URL}               http://localhost:4723/wd/hub
${appium:platformName}       Android
${appium:platformVersion}   13
${appium:deviceName}        emulator-5554
${appium:automationName}    UIAutomator2
${appium:appPackage}        com.android.chrome
${appium:appActivity}       com.google.android.apps.chrome.Main
${appium:appPackageIlayda}    com.ilayda.qa

${Timeout}   10


# Test Scenario: Interruption During File Upload (Negative Test)
# Scenario Description:
# First, launch the Chrome application,
# Navigate to the Ilayda app installation page, and install the Ilayda application.
# Once installed and launched, click the SIGN IN button.
# After ensuring the application is open, navigate to a pre-created survey.
# Click the ADD COMMENT button, enter an internal comment, and save it.
# Click the ADD FILES button to initiate the file upload process.
# Disconnect the internet connection (Wi-Fi or mobile data).
# Verify that an appropriate error message is displayed indicating the failure to upload the file due to the lack of internet connection.


*** Test Cases ***
Open Test Application
    Open Application    ${REMOTE_URL}  appium:platformName=${appium:platformName}  appium:platformVersion=${appium:platformVersion}  appium:deviceName=${appium:deviceName} automationName=${appium:automationName}   appPackage=${appium:appPackage}  	appium:appActivity=${appium:appActivity}
    Set Appium Timeout    ${Timeout}
    Capture Page Screenshot   mobile_error
    Click Text   Accept & continue
    Wait Until Page Contains  No thanks
    Click Text   No thanks
    Wait Until Page Contains  Chrome notifications make things easier
    Click Text   No thanks
    Go To Url    https://ilayda.com/ui/#
    Wait Until Page Contains  Welcome
    Input Text Into Current Element    USERNAME
    Click Text  Next
    Wait Until Page Contains  Log on
    Input Text Into Current Element   PASSW0RD
    Click Text  Log on
    Wait Until Page Contains  Standards
    Click Text  ELIF ILAYDA CELIK
    Wait Until Page Contains  Administrator
    Click Text  Android
    Click Text  Android
    Click Text  Android
    Wait Until Page Contains  Cancel
    Clear Text  Download anyway
    Click Text  Open
    Open Application    ${REMOTE_URL}  appium:platformName=${appium:platformName}  appium:platformVersion=${appium:platformVersion}  appium:deviceName=${appium:deviceName} automationName=${appium:automationName}   appPackage=${appium:appPackageIlayda}  	appium:appActivity=com.ilayda.qa.MainActivity
    Click Text  SIGN IN
    Ensure Application Is Open
    Wait Until Page Contains  Open
    Click Text  Yes
    Click Text  ADD COMMENT
    Click Text  INTERNAL COMMENT
    Input Text Into Current Element    this is a internal comment.
    Click Text  SAVE
    Click Text  ADD FILES
    Set Network Connection Status    0
    Click Text  Open
    Wait Until Page Contains  turn on wi-fi
    Set Network Connection Status    1
    Check Text  Could not upload file
    ${appium:appPackageIlayda}  Close Application



