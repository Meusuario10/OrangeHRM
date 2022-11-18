*** Settings ***
Resource        ../1- framework/FrameworkAutomation.robot
Resource        ../2- page/PageAutomation.robot

*** Keywords ***
Dado que acesso o site OrangeHRM
    Aguarda   
    Print Tela         
    Valida Elemento       ${LogoHome} 

Quando preencho Username "${user}" e password "${senha}"
     Preencher Text        ${InputUser}     ${user} 
     Preencher Text        ${InputSenha}    ${senha}
     Print Tela 
    
Então clico em login e valido a pagina 
     Click no Item        ${BtnLogin}
     Aguarda
     Print Tela
     Valida Elemento     ${ValidLogin}

Quando preencho Username "${name}" E a senha "${senha}"
    Preencher Text    ${InputUser}      ${name}
    Preencher Text    ${InputSenha}     ${senha}
    Print Tela

Então clico em login e aparece a mensagem "${msg}"
    Click no Item    ${BtnLogin}
    Aguarda
    Print Tela
    Verifica Se Contem o Texto    ${InvalidLogin}    ${msg}

Quando eu clico no botão Login sem preencher UserName e Password recebo a mensagem que os campos são "${required}"
    Click no Item    ${BtnLogin}
    Aguarda
    Print Tela
    Verifica Se Contem o Texto    ${RequiredUser}     ${required}
    Verifica Se Contem o Texto    ${RequiredPsw}      ${required}

E preencho UserName "${user}" e clico Login recebo a mensagem "${required}"
    Preencher Text       ${InputUser}    ${user}
    Click no Item        ${BtnLogin}
    Print Tela
    Valida que não esta na tela    ${RequiredUser}
    Verifica Se Contem o Texto     ${RequiredPsw}     ${required}

Então preencho Password "${senha}" e clico login para ser efetuado com sucesso 
    Preencher Text    ${InputSenha}    ${senha}
    Click no Item     ${BtnLogin}
    Print Tela
    Valida Elemento    ${ValidLogin}