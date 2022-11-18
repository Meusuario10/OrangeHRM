*** Variables ***

${LogoHome}               xpath=//img[@alt='company-branding']
${InputUser}              xpath=//input[@name='username']
${InputSenha}             xpath=//input[@name='password']                  
${BtnLogin}               xpath=//button[@type='submit'][contains(.,'Login')]
${ValidLogin}             xpath=//span[@class='oxd-text oxd-text--span oxd-main-menu-item--name'][contains(.,'PIM')]
${InvalidLogin}           xpath=//div[@class='oxd-alert-content oxd-alert-content--error'][contains(.,'Invalid credentials')]
${RequiredUser}           xpath=//input[@name="username"]/../../span
${RequiredPsw}            xpath=//input[@name="password"]/../../span