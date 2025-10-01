*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${url}         https://demoqa.com/
${browser}     safari
${elements}    //h5[.='Elements']
${textBox}     //span[.='Text Box']
${fullName}    //input[@id='userName']
${email}       //input[@id='userEmail']
${currentAddress}    //textarea[@id='currentAddress']
${permanentAddress}  //textarea[@id='permanentAddress']
${submit}         //button[@id='submit']
${nameOutput}    //p[@id='name']
${emailOutput}    //p[@id='email']
${currentAddressOutput}    //p[@id='currentAddress']
${permanentAddressOutput}    //p[@id='permanentAddress']
${timeout}     20s


*** Test Cases ***
Demo Qa Text Box
    Open Browser     ${url}   ${browser}
    Capture Page Screenshot    demoFailed.png
    maximize Browser Window
    Set Selenium Timeout    ${timeout}
    Click Element    ${elements}
    Page Should Contain    Text Box
    Click Element    ${textBox}
    Input Text    ${fullName}    Elif ilayda Celik
    Input Text    ${email}    test@hotmail.com
    Input Text    ${currentAddress}    Istanbul Turkey
    Input Text    ${permanentAddress}  World
    Click Element    ${submit}
    Page Should Contain    Name:Elif ilayda Celik
    Page Should Contain    Email:test@hotmail.com
    Page Should Contain    Current Address :Istanbul Turkey
    Page Should Contain    Permanent Address :World
    Close Browser

