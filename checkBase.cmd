chcp 65001
rem SET LOGOS_LEVEL=DEBUG
del /Q .\out\syntax-check\allure\*.*
call vrunner syntax-check
call allure generate --clean .\out\syntax-check\allure -o .\out\allure\allure-report 
call allure open .\out\allure\allure-report
