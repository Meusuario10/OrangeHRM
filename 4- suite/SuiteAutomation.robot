*** Settings ***

Documentation   Essa suite testa o site 
Resource        ../1- framework/FrameworkAutomation.robot
Resource        ../2- page/PageAutomation.robot
Resource        ../3- steps/StepsAutomation.robot 
Test Setup                Abrir navegador     ${URL} 
# Test Teardown             Fechar navegador   

*** Variables ***
${URL}            https://opensource-demo.orangehrmlive.com/web/index.php/auth/login



*** Test Cases ***
# robot -t "CT01-Login Com Sucesso" -d CT01 './4- suite\SuiteAutomation.robot'
CT01-Login Com Sucesso
    Dado que acesso o site OrangeHRM
    Quando preencho Username "Admin" e password "admin123"
    Então clico em login e valido a pagina

# robot -t "CT02-Login Com Credencial Invalida" -d CT02 './4- suite\SuiteAutomation.robot'
CT02-Login Com Credencial Invalida
    Dado que acesso o site OrangeHRM 
    Quando preencho Username "Larissa" E a senha "admin123" 
    Então clico em login e aparece a mensagem "Invalid credentials"

# robot -t "CT03-Login Sem Preenchimento" -d CT03 './4- suite\SuiteAutomation.robot'
CT03-Login Sem Preenchimento
    Dado que acesso o site OrangeHRM
    Quando eu clico no botão Login sem preencher UserName e Password recebo a mensagem que os campos são "Required"
    E preencho UserName "Admin" e clico Login recebo a mensagem "Required"
    Então preencho Password "admin123" e clico login para ser efetuado com sucesso 