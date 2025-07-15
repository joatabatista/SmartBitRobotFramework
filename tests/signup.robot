*** Settings ***
Documentation        Cenarios de testes de pré-cadastro de clientes

Resource    ../resources/Base.resource

Test Setup        Start session
Test Teardown     Take Screenshot

*** Test Cases ***
Deve iniciar o cadastro do cliente

    ${account}    Get Fake Account
    
    Submit signup form    ${account}

    Verify welcome message

Campo nome deve ser obrigatorio
    [Tags]    required

    ${account}    Create Dictionary
    ...    name=${EMPTY}
    ...    email=joatamagalhaes@teste.com
    ...    cpf=35996024845

    Submit signup form    ${account}

    Notice should be    Por favor informe o seu nome completo

Campo email deve ser obrigatorio
    [Tags]    required

    ${account}    Create Dictionary
    ...    name=Joata Batista
    ...    email=${EMPTY}
    ...    cpf=35996024845

    Submit signup form    ${account}

    Notice should be    Por favor, informe o seu melhor e-mail

Campo cpf deve ser obrigatorio
    [Tags]    required

    ${account}    Create Dictionary
    ...    name=Joata Batista
    ...    email=joatabatista@gmail.com
    ...    cpf=${EMPTY}

    Submit signup form    ${account}

     Notice should be    Por favor, informe o seu CPF

Email no formato invãlido
    [Tags]    inv

    ${account}    Create Dictionary
    ...    name=Joata Batista
    ...    email=joatabatista*gmail.com
    ...    cpf=35996024845

    Submit signup form    ${account}

    Notice should be    Oops! O email informado é inválido

CPF no formato inválido
    [Tags]    inv

    ${account}    Create Dictionary
    ...    name=Joata Batista
    ...    email=joatabatista@gmail.com
    ...    cpf=35996024000

    Submit signup form    ${account}

    Notice should be    Oops! O CPF informado é inválido

# Tentativa de pré-cadastro    DESSA FORMA ELE EXECUTA TODOS OS TESTESCOMO ESQUEMA DE CENARIO
#     [Template]    Attempt signup
#     ${EMPTY}          joata.magalhaes@icloud  39831866029    Por favor informe o seu nome completo
#     Joana Batista     ${EMPTY}                39831866029    Por favor, informe o seu melhor e-mail
#     Tamila Silva      tamilasilva@gmail.com   ${EMPTY}       Por favor, informe o seu CPF
#     Jose Jesus        jose@@Gmail.com         39831866029    Oops! O email informado é inválido
#     Ednalva Jesus     ednalva@gmail.com       35996024800    Oops! O CPF informado é inválido

# *** Keywords ***
# Attempt signup
#     [Arguments]    ${name}    ${email}    ${cpf}    ${output_message}

#     ${account}    Create Dictionary
#     ...    name=${name}
#     ...    email=${email}
#     ...    cpf=${cpf}

#     Submit signup form  ${account}

#     Notice should be    ${output_message}
