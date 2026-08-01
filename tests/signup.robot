*** Settings ***
Documentation      Cenários de testes de pré-cadastro de clientes

Library        Browser

Resource        ../resources/base.resource

*** Test Cases ***

Deve iniciar o cadastro do cliente

    ${account}    Get Fake Account
    New Browser    browser=chromium    headless=false
    New Page     http://localhost:3000
    Get Text     
    ...    css=#signup h2    
    ...    equal    Faça seu cadastro e venha para a Smartbit!
    Fill Text    id=name     ${account}[name] 
    Fill Text    id=email     ${account}[email]
    Fill Text    id=document     ${account}[document]

    Click        css=button >> text=Cadastrar

    Wait For Elements State    
    ...    text=Falta pouco para fazer parte da família Smartbit!    
    ...    visible    5


Campo nome deve ser obrigatório
    [Tags]    required

    ${account}    Get Fake Account
    New Browser    browser=chromium    headless=false
    New Page     http://localhost:3000
    Get Text     
    ...    css=#signup h2    
    ...    equal    Faça seu cadastro e venha para a Smartbit!
    
    Fill Text    id=email     ${account}[email]
    Fill Text    id=document     ${account}[document]

    Click        css=button >> text=Cadastrar

    Wait For Elements State    
    ...    css=form .notice   
    ...    visible    5

    Get Text    css=form .notice    equal    Por favor informe o seu nome completo

Campo email deve ser obrigatório
    [Tags]    required

    ${account}    Get Fake Account
    New Browser    browser=chromium    headless=false
    New Page     http://localhost:3000
    Get Text     
    ...    css=#signup h2    
    ...    equal    Faça seu cadastro e venha para a Smartbit!
    
    Fill Text    id=name     ${account}[name]
    Fill Text    id=document     ${account}[document]

    Click        css=button >> text=Cadastrar

    Wait For Elements State    
    ...    css=form .notice   
    ...    visible    5

    Get Text    css=form .notice    equal    Por favor, informe o seu melhor e-mail


Campo cpf deve ser obrigatório
    [Tags]    required

    ${account}    Get Fake Account
    New Browser    browser=chromium    headless=false
    New Page     http://localhost:3000
    Get Text     
    ...    css=#signup h2    
    ...    equal    Faça seu cadastro e venha para a Smartbit!
    
    Fill Text    id=name     ${account}[name]
    Fill Text    id=email     ${account}[email]

    Click        css=button >> text=Cadastrar

    Wait For Elements State    
    ...    css=form .notice   
    ...    visible    5

    Get Text    css=form .notice    equal    Por favor, informe o seu CPF


Email no formato inválido
    [Tags]    inv

    ${account}    Get Fake Account
    New Browser    browser=chromium    headless=false
    New Page     http://localhost:3000
    Get Text     
    ...    css=#signup h2    
    ...    equal    Faça seu cadastro e venha para a Smartbit!
    
    Fill Text    id=name     ${account}[name]
    Fill Text    id=email     email.email.com
    Fill Text    id=document     ${account}[document]

    Click        css=button >> text=Cadastrar

    Wait For Elements State    
    ...    css=form .notice   
    ...    visible    5

    Get Text    css=form .notice    equal    Oops! O email informado é inválido


CPF no formato inválido
    [Tags]    inv

    ${account}    Get Fake Account
    New Browser    browser=chromium    headless=false
    New Page     http://localhost:3000
    Get Text     
    ...    css=#signup h2    
    ...    equal    Faça seu cadastro e venha para a Smartbit!
    
    Fill Text    id=name     ${account}[name]
    Fill Text    id=email     ${account}[email]
    Fill Text    id=document   0000  

    Click        css=button >> text=Cadastrar

    Wait For Elements State    
    ...    css=form .notice   
    ...    visible    5

    Get Text    css=form .notice    equal    Oops! O CPF informado é inválido