*** Settings ***
Documentation       teste para verificxar o Slogan da Smartbit na WebApp

Library        Browser

*** Test Cases ***

Deve exibir o slogan na landing page
    New Browser    browser=chromium    headless=false
    New Page     http://localhost:3000
    Get Text    css=.jXMnyf h2    equal    Sua Jornada Fitness Começa aqui!

    Sleep    5
    