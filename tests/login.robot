*** Settings ***
Documentation        Cenarios de testes do Login SAC

Resource    ../resources/Base.resource

Test Setup       Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve logar como Gestor de Academia
    Go to login page
    Submit login form    sac@smartbit.com    pwd123

Não deve logar com senha incorreta
    Go to login page
    Submit login form    sac@smartbit.com    jbm123
    Toast should be      As credenciais de acesso fornecidas são inválidas. Tente novamente!

Não deve logar com senha incorreta
    Go to login page
    Submit login form    jo@smartbit.com    jbm123
    Toast should be      As credenciais de acesso fornecidas são inválidas. Tente novamente!

logi com dados incorretos
    Go to login page
    Submit login form    jo@smartbit.com    jbm123
    Toast should be      As credenciais de acesso fornecidas são inválidas. Tente novamente!
