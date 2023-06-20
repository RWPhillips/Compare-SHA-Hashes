@echo off

:: Ask for SHA type
SET /P hashType=What SHA hash would you like to test (input 256 or 512)? 
:: Get hash from user
SET /P pasteHash=Please paste the hash so it can be compared:

:: Grab program hash value
Set "hash=" 
For /F Delims^= %%G In ('CertUtil -HashFile %1 SHA%hashType%^|FindStr /VRC:"[^a-f 0-9]"')Do Set "hash=%%G"

:: Print the hashes next to one another for extra verification
echo:
echo %pasteHash% - Hash Given
echo %hash% - Hash from Program
echo:

:: Let user know if they match
if "%pasteHash%" == "%hash%" (echo The SHA%hashType% hashes match!) else (echo The SHA%hashType% hashes do not match, I would not use this file.)

:: Pause and wait, instead of closing
pause
exit