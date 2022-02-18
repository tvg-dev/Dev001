chcp 65001
SET LOGOS_LEVEL=DEBUG
rem call vrunner xunit
call allure generate --clean .\out\smoke\allure -o .\out\allure\allure-report 
call allure open .\out\allure\allure-report
