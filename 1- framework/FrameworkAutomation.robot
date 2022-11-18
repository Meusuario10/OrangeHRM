##########################################################################################
[Documentation] Autor: Larissa Luana
...             Descrição: Configurações e Funções para Automação
...             Criação: 04/11/2022
##########################################################################################

*** Settings ***
Library        SeleniumLibrary
Library        AutoRecorder
Library        FakerLibrary      locale=pt_BR 

Resource        ../2- page/PageAutomation.robot



*** Keywords ***
Print Tela
   SeleniumLibrary.Capture Page Screenshot 

Abrir navegador 
    [Arguments]       ${tela}
    Open Browser     ${tela}      chrome  
    Maximize Browser Window
    Print Tela

Fechar navegador
    Print Tela
    Close browser 

Aguarda Mais 
    Sleep                     2 

Aguarda
    Sleep                     1

Esta Visivel 
    [Arguments]                          ${element}
    Wait Until Element Is Visible        ${element}     30

Não está Visivel 
    [Arguments]                       ${element}   
    Wait Until Element Is Visible     ${element}     3

Valida Elemento 
    [Arguments]                       ${element}
    ${Status}    Run Keyword And Return Status        Esta Visivel      ${element}
    Aguarda
    Run Keyword If    '${status}' == 'False'     Fatal Error   msg=O Elemento '${element}' não encontrado na tela 

Valida que não esta na tela 
    [Arguments]                     ${element} 
    ${status}    Run Keyword And Return Status    Não está Visivel   ${element}
    Run Keyword If    '${status}' == 'True'         Fatal Error   msg=O Elemento '${element}' não deveria aparecer na tela 

Verifica Se Contem o Texto
    [Arguments]                    ${element}          ${text}
    Valida Elemento                ${element}
    Element Should Contain         ${element}          ${text}

Click no Item 
    [Arguments]                    ${item}
    Aguarda
    Valida Elemento                ${item} 
    SeleniumLibrary.Click Element  ${item}

Preencher Text
    [Arguments]                    ${input}          ${item}
    Valida Elemento                ${input}
    SeleniumLibrary.Input Text     ${input}          ${item} 

Ir até 
    [Arguments]                    ${element}
    Valida Elemento                ${element}
    Scroll Element Into View       ${element}