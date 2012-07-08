@echo off

setlocal enableextensions enabledelayedexpansion

set "BASE=%~dp0"
set "WEBROOT=%CD%"
rem Process command line args
set COLLIDE_PASSWORD=""
set PREVIOUS=
for %%i in (%*) do (
  set ARG=%%i
  if "!PREVIOUS!"=="-password" set COLLIDE_PASSWORD=!ARG!
  set PREVIOUS=%%i
)

set CONFIG={ "webRoot": "%WEBROOT:\=\\%", "staticFiles": "%BASE:\=\\%static", "password": %COLLIDE_PASSWORD% }

rem Make a temporary file and stash the config JSON
set TMP_FILE=%TEMP%\collide-%RANDOM%.tmp
echo %CONFIG% > %TMP_FILE%

rem TODO: Make the ant build generate this string.
set COLLIDE_CLASSPATH=%BASE%;%BASE%lib\gwt-user.jar;%BASE%lib\collide-server.jar;%BASE%lib\guava-12.0.jar;%BASE%lib\gson-2.2.1.jar;%BASE%lib\jsr305.jar;%BASE%lib\org.eclipse.jgit-1.3.0.201202151440-r.jar;%BASE%lib\waveinabox-import-0.3.jar

rem Launch the server, setting up the appropriate classpath and config files.
call %BASE%lib\vertx\bin\vertx.bat run bootstrap.js -conf "%TMP_FILE%" -cp "%COLLIDE_CLASSPATH%" %*

rm %TMP_FILE%
