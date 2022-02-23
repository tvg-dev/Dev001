chcp 65001
SET LOGOS_LEVEL=DEBUG
del /Q .\out\syntax-check\allure\*.*
call vrunner syntax-check
rem call allure generate --clean .\out\syntax-check\allure -o .\out\allure\allure-report 
rem call allure open .\out\allure\allure-report
