@echo off
chcp 1252 > nul
set tests_passed=0
set tests_failed=0

call build.bat

echo.
call :test "Positive test" "1 2" 0
call :test "Negative test" "a b" 2

echo Tests passed: %tests_passed%
echo Tests failed: %tests_failed%
exit /b %errorlevel%

:test
REM echo -----------------------
echo %~1:
echo app.exe %~2
echo Program output:
app.exe %~2 < nul
echo -----------------------
echo Expected return code: %~3
echo Actual return code: %errorlevel%
if %errorlevel%==%~3 (
	set /a tests_passed=%tests_passed%+1
	echo Test PASSED
) else (
	set /a tests_failed=%tests_failed%+1
	echo Test FAILED
)
echo.
echo.
exit /b 0
