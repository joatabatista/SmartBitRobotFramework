*** Settings ***
Documentation        Teste para verificar o Slogan da Smartbit na webApp
Library        Browser

*** Test Cases ***
Deve exibir o Slogn na Landing Page
    New Browser    browser=chromium    headless=False
    New Page    http://localhost:3000
    Get Text    css=.headline h2    equal    Sua Jornada Fitness Começa aqui!

    Sleep    5    