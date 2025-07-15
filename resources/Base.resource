*** Settings ***

Documentation        Arquivo Principal do Projeto Robot

Library        Browser
Library        libs/Account.py

Resource       pages/Landing.resource
Resource       pages/Welcome.resource
Resource       pages/Login.resource
Resource       pages/components/Toast.resource


*** Keywords ***
Start session

    New Browser    browser=chromium    headless=False
    New Page    http://localhost:3000
