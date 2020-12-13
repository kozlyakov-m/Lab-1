@echo off
chcp 1252 > nul
del log.txt
set tests_passed=0
set tests_failed=0

call build.bat

call :test "Positive test" "1 2" 0
call :test "Negative test" "a b" 2

echo Tests passed: %tests_passed%
echo Tests failed: %tests_failed%
exit /b %errorlevel%

:test
echo %~1 >> log.txt
app.exe %~2 < nul >> log.txt
echo expected: %~3 >> log.txt
echo actual: %errorlevel% >> log.txt
echo. >> log.txt
if %errorlevel%==%~3 (
	set /a tests_passed=%tests_passed%+1
	echo %~1 passed
) else (
	set /a tests_failed=%tests_failed%+1
	echo %~1 failed
)
exit /b 0
