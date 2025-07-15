*** Settings ***
Documentation    Ações e elementos da página de boas vindas

Library    Browser

*** Keywords ***
Verify welcome message
    Wait For Elements State
    ...    text=Erro cadastrar usuário!
    ...    visible    5
