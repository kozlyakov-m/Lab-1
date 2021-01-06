@echo off
chcp 1251 > nul
set tests_passed=0
set tests_failed=0

call build.bat

echo.
call :test "T1.1 ����� ������ ����� �������" "0 1" 1
call :test "T1.2 ����� �� ������� ����������" "1 0" 1
call :test "T1.3 ����� �� ��������� ����������" "-2 0" 1
call :test "T2.1 ����� ������ ��������� ����������" "-1 0.5" 0
call :test "T2.2 ����� ������� ������� ����������" "2 2" 0
call :test "T3.1 ������������ ����������" "3" 2
call :test "T3.2 ������������ ����������" "1 2 3" 2
call :test "T3.3 ��������� � �� �����" "a b" 2

echo Tests passed: %tests_passed%
echo Tests failed: %tests_failed%
exit /b %errorlevel%

:test
echo %~1:
echo app.exe %~2
echo Program output:
echo -----------------------
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
