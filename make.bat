@ECHO OFF
COLOR 07

ECHO ************* Install grunt and bower
CALL npm install -g grunt-cli
IF errorlevel 1 GOTO ERROR
CALL npm install -g bower
IF errorlevel 1 GOTO ERROR

ECHO ************* Build and copy jQuery
CD submodules\jquery
CALL npm install
IF errorlevel 1 GOTO ERROR
CALL grunt
IF errorlevel 1 GOTO ERROR
CD ..\..


ECHO ************* Build and copy jQuery-UI
CD submodules\jquery-ui
CALL npm install
IF errorlevel 1 GOTO ERROR
CALL grunt build
IF errorlevel 1 GOTO ERROR
CD ..\..


COLOR 02
ECHO Make successfull. Good luck.
EXIT /B

:ERROR
COLOR 04
ECHO Make faild. See log for details.
