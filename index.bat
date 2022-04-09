::Max's database software
::https://maxwellcrafter.com
::Source, documentation, and more can be found at https://github.com/Maxwell-Fisher/maxs-database-software
::Last updated 2022/04/08 @ 20:53 MT
::This code is held together with nothing but spite, hope, and a lot of caffeine
::a1cbdd7272ff08c2b23eadbd9b92fab96b13e3e6ab8238a47c63075afc9d6870


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                                ::
:: MIT License                                                                    ::
::                                                                                ::
:: Copyright (c) 2022 Maxwell Fisher (@Maxwellcrafter)                            ::
::                                                                                ::
:: Permission is hereby granted, free of charge, to any person obtaining a copy   ::
:: of this software and associated documentation files (the "Software"), to deal  ::
:: in the Software without restriction, including without limitation the rights   ::
:: to use, copy, modify, merge, publish, distribute, sublicense, and/or sell      ::
:: copies of the Software, and to permit persons to whom the Software is          ::
:: furnished to do so, subject to the following conditions:                       ::
::                                                                                ::
:: The above copyright notice and this permission notice shall be included in all ::
:: copies or substantial portions of the Software.                                ::  
::                                                                                ::
:: THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR     ::
:: IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,       ::
:: FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE    ::
:: AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER         ::
:: LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,  ::
:: OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE  ::
:: SOFTWARE.                                                                      ::
::                                                                                ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


@echo off
cls
setLocal enableDelayedExpansion
mode 120, 40
title Max's database software

set null=†
set endOfIndex=•
set tagTag=À
set tagTypeTag=Á
set typeTag=Â
set itemTag=Ã
set brandTag=Ä
set modelNumberTag=Å
set serialNumberTag=Æ
set locationTag=Ç
set oldTagTag=È
set dateAddedTag=É
set dateUpdatedTag=Ê
set preferredNameTag=Ë
set firstNameTag=Ì
set middleNameTag=Í
set lastNameTag=Î
set pronounTag=Ï
set usernameTag=Ð
set phoneNumberTag=Ñ
set emailTag=Ò
set twitterTag=Ó
set discordTag=Ô
set websiteTag=Õ
set birthYearTag=Ö
set birthMonthTag=à
set birthDayTag=á
set countryTag=â
set regionTag=ã
set localRegionTag=ä
set addressTag=å
set callsignTag=æ
::set Tag=ç
::set Tag=è
::set Tag=é
::set Tag=ê
::set Tag=ë
::set Tag=ì
::set Tag=í
::set Tag=î
::set Tag=ï
::set Tag=ð
::set Tag=ñ
::set Tag=ò
::set Tag=ó
::set Tag=ô
::set Tag=õ
::set Tag=ö

echo Available databases: 
for %%f in (*.mdf) do (
if "%%~xf"==".mdf" set file=%%f
echo !file:~0,-4!
)
echo.
set /p databaseName=Name of database to load: 
echo.
if not exist "!databaseName!" set "databaseName=!databaseName!.mdf"
if not exist "!databaseName!" goto create


cls

set /p databaseMode=Mode (read or write): 
if "!databaseMode!" == "read" goto read
if "!databaseMode!" == "write" goto write



:error
cls
echo Unknown option
pause
exit

:write
cls

set /p inputIndexType=Index type (contact or inventory): 

cls

if not "!inputIndexType!" == "inventory" if not "!inputIndexType!" == "contact" goto error

set inputTag=!null!
set inputTagType=!null!
set inputType=!null!
set inputItem=!null!
set inputBrand=!null!
set inputModelNumber=!null!
set inputSerialNumber=!null!
set inputLocation=!null!
set if "!inputIndexType!" == "inventory" inputOldTag=!null!
set inputDateAdded=!null!
set inputDateUpdated=%date% @ %time%
set inputPreferredName=!null!
set inputFirstName=!null!
set inputMiddleName=!null!
set inputLastName=!null!
set inputPronoun=!null!
set inputUsername=!null!
set inputPhoneNumber=!null!
set inputEmail=!null!
set inputTwitter=!null!
set inputDiscord=!null!
set inputWebsite=!null!
set inputBirthYear=!null!
set inputBirthMonth=!null!
set inputBirthDay=!null!
set inputBountry=!null!
set inputRegion=!null!
set inputLocalRegion=!null!
set inputAddress=!null!
set inputCallsign=!null!

if "!inputIndexType!" == "inventory" set /p inputTag=Tag: 
if "!inputIndexType!" == "inventory" set /p inputTagType=Tag type: 
if "!inputIndexType!" == "inventory" set /p inputType=Type: 
if "!inputIndexType!" == "inventory" set /p inputItem=Item: 
if "!inputIndexType!" == "inventory" set /p inputBrand=Brand: 
if "!inputIndexType!" == "inventory" set /p inputModelNumber=Model number: 
if "!inputIndexType!" == "inventory" set /p inputSerialNumber=Serial number: 
if "!inputIndexType!" == "inventory" set /p inputLocation=Location: 
if "!inputIndexType!" == "inventory" set /p inputOldTag=Old tag: 
::if "!inputIndexType!" == "inventory" set /p inputDateAdded=Date added: 
::if "!inputIndexType!" == "inventory" set /p inputDateUpdated=Date updated: 
if "!inputIndexType!" == "contact" set /p inputPreferredName=Preferred name: 
if "!inputIndexType!" == "contact" set /p inputFirstName=First name: 
if "!inputIndexType!" == "contact" set /p inputMiddleName=Middle name: 
if "!inputIndexType!" == "contact" set /p inputLastName=Last name: 
if "!inputIndexType!" == "contact" set /p inputPronoun=Pronouns: 
if "!inputIndexType!" == "contact" set /p inputUsername=Username: 
if "!inputIndexType!" == "contact" set /p inputPhoneNumber=Phone number: 
if "!inputIndexType!" == "contact" set /p inputEmail=Email: 
if "!inputIndexType!" == "contact" set /p inputTwitter=Twitter: 
if "!inputIndexType!" == "contact" set /p inputDiscord=Discord: 
if "!inputIndexType!" == "contact" set /p inputWebsite=Website: 
if "!inputIndexType!" == "contact" set /p inputBirthYear=Birth year: 
if "!inputIndexType!" == "contact" set /p inputBirthMonth=Birth month: 
if "!inputIndexType!" == "contact" set /p inputBirthDay=Birth day: 
if "!inputIndexType!" == "contact" set /p inputCountry=Country: 
if "!inputIndexType!" == "contact" set /p inputRegion=Region: 
if "!inputIndexType!" == "contact" set /p inputLocalRegion=Local region: 
if "!inputIndexType!" == "contact" set /p inputAddress=Address: 
if "!inputIndexType!" == "contact" set /p inputCallsign=Radio callsign: 

set /p saveConfirm=Does this information look correct? (yes or no): 
if not "!saveConfirm!" == "yes" echo Ok, that won't be saved&pause &exit

echo À!inputTag!•Á!inputTagType!•Â!inputType!•Ã!inputItem!•Ä!inputBrand!•Å!inputModelNumber!•Æ!inputSerialNumber!•Ç!inputLocation!•È!inputOldTag!•É!inputDateAdded!•Ê!inputDateUpdated!•Ë!inputPreferredName!•Ì!inputFirstName!•Í!inputMiddleName!•Î!inputLastName!•Ï!inputPronoun!•Ð!inputUsername!•Ñ!inputPhoneNumber!•Ò!inputEmail!•Ó!inputTwitter!•Ô!inputDiscord!•Õ!inputWebsite!•Ö!inputBirthYear!•à!inputBirthMonth!•á!inputBirthDay!•â!inputCountry!•ã!inputRegion!•ä!inputLocalRegion!•å!inputAddress!•æ!inputCallsign!• >> "!databaseName!"


echo.
echo Saved!
pause
exit

:create
cls
echo That database file not be found in the current directory. Would you like to create it now?
echo This will create the file "!databaseName!"
set /p confirmCreate=(yes or no): 
if "!confirmCreate!" == "yes" echo. > "!databaseName!"& echo Successfully created the database& pause& exit
echo Alright, the file was not created
pause
exit

:read
cls

set lineCount=0


for /f "tokens=*" %%a in (!databaseName!) do (
	set /a lineCount=lineCount+1
	title Max's database software - reading into memory [!databaseName!, !lineCount!]
	set line_!lineCount!=%%a
)
title Max's database software - loaded into memory [!databaseName!, !lineCount!]

set /p searchTerm=Search: 
echo.
set currentIndex=null

for /l %%x in (1, 1, !lineCount!) do (
	echo !line_%%x!|find /i "!searchTerm!" >nul && set currentIndex=%%x&title Max's database software - reading database [!databaseName!, line %%x of !lineCount!]
)

title Max's database software - data loaded [!databaseName!, line !currentIndex! of !lineCount!]

set currentIndex=!line_%currentIndex%!

if "!currentIndex!" == "null" echo No results found& pause& exit


call set currentTag=%%currentIndex:*%tagTag%=%%
set currentTag=%currentTag:•=&rem.%

call set currentTagType=%%currentIndex:*%tagTypeTag%=%%
set currentTagType=%currentTagType:•=&rem.%

call set currentType=%%currentIndex:*%typeTag%=%%
set currentType=%currentType:•=&rem.%

call set currentItem=%%currentIndex:*%itemTag%=%%
set currentItem=%currentItem:•=&rem.%

call set currentBrand=%%currentIndex:*%brandTag%=%%
set currentBrand=%currentBrand:•=&rem.%

call set currentModelNumber=%%currentIndex:*%modelNumberTag%=%%
set currentModelNumber=%currentModelNumber:•=&rem.%

call set currentSerialNumber=%%currentIndex:*%serialNumberTag%=%%
set currentSerialNumber=%currentSerialNumber:•=&rem.%

call set currentLocation=%%currentIndex:*%locationTag%=%%
set currentLocation=%currentLocation:•=&rem.%

call set currentOldTag=%%currentIndex:*%oldTagTag%=%%
set currentOldTag=%currentOldTag:•=&rem.%

call set currentDateAdded=%%currentIndex:*%dateAddedTag%=%%
set currentDateAdded=%currentDateAdded:•=&rem.%

call set currentDateUpdated=%%currentIndex:*%dateUpdatedTag%=%%
set currentDateUpdated=%currentDateUpdated:•=&rem.%

call set currentPreferredName=%%currentIndex:*%preferredNameTag%=%%
set currentPreferredName=%currentPreferredName:•=&rem.%

call set currentLegalFirstName=%%currentIndex:*%firstNameTag%=%%
set currentLegalFirstName=%currentLegalFirstName:•=&rem.%

call set currentLegalMiddleName=%%currentIndex:*%middleNameTag%=%%
set currentLegalMiddleName=%currentLegalMiddleName:•=&rem.%

call set currentLegalLastName=%%currentIndex:*%lastNameTag%=%%
set currentLegalLastName=%currentLegalLastName:•=&rem.%

call set currentPronouns=%%currentIndex:*%pronounTag%=%%
set currentPronouns=%currentPronouns:•=&rem.%

call set currentUsername=%%currentIndex:*%usernameTag%=%%
set currentUsername=%currentUsername:•=&rem.%

call set currentPhoneNumber=%%currentIndex:*%phoneNumberTag%=%%
set currentPhoneNumber=%currentPhoneNumber:•=&rem.%

call set currentEmail=%%currentIndex:*%emailTag%=%%
set currentEmail=%currentEmail:•=&rem.%

call set currentTwitter=%%currentIndex:*%twitterTag%=%%
set currentTwitter=%currentTwitter:•=&rem.%

call set currentDiscord=%%currentIndex:*%discordTag%=%%
set currentDiscord=%currentDiscord:•=&rem.%

call set currentWebsite=%%currentIndex:*%websiteTag%=%%
set currentWebsite=%currentWebsite:•=&rem.%

call set currentBirthYear=%%currentIndex:*%BirthYearTag%=%%
set currentBirthYear=%currentBirthYear:•=&rem.%

call set currentBirthMonth=%%currentIndex:*%BirthMonthTag%=%%
set currentBirthMonth=%currentBirthMonth:•=&rem.%

call set currentBirthDay=%%currentIndex:*%BirthDayTag%=%%
set currentBirthDay=%currentBirthDay:•=&rem.%

call set currentCountry=%%currentIndex:*%countryTag%=%%
set currentCountry=%currentCountry:•=&rem.%

call set currentRegion=%%currentIndex:*%regionTag%=%%
set currentRegion=%currentRegion:•=&rem.%

call set currentLocalRegion=%%currentIndex:*%localRegionTag%=%%
set currentLocalRegion=%currentLocalRegion:•=&rem.%

call set currentAddress=%%currentIndex:*%addressTag%=%%
set currentAddress=%currentAddress:•=&rem.%

call set currentCallsign=%%currentIndex:*%callsignTag%=%%
set currentCallsign=%currentCallsign:•=&rem.%



if not "!currentTag!" == "†" echo Tag: !currentTag!
if not "!currentTagType!" == "†" echo Tag type: !currentTagType!
if not "!currentType!" == "†" echo Type: !currentType!
if not "!currentItem!" == "†" echo Item: !currentItem!
if not "!currentBrand!" == "†" echo Brand: !currentBrand!
if not "!currentModelNumber!" == "†" echo Model number: !currentModelNumber!
if not "!currentSerialNumber!" == "†" echo Serial number: !currentSerialNumber!
if not "!currentLocation!" == "†" echo Location: !currentLocation!
::if not "!currentOldTag!" == "†" echo Old tag: !currentOldTag!
if not "!currentDateAdded!" == "†" echo Date added: !currentDateAdded!
if not "!currentDateUpdated!" == "†" echo Date updated: !currentDateUpdated!
if not "!currentPreferredName!" == "†" echo Preferred name: !currentPreferredName!
if not "!currentLegalFirstName!" == "†" echo Legal first name: !currentLegalFirstName!
if not "!currentLegalMiddleName!" == "†" echo Legal middle name: !currentLegalMiddleName!
if not "!currentLegalLastName!" == "†" echo Legal last name: !currentLegalLastName!
if not "!currentPronouns!" == "†" echo Pronouns: !currentPronouns!
if not "!currentUsername!" == "†" echo Username: !currentUsername!
if not "!currentPhoneNumber!" == "†" echo Phone number: !currentPhoneNumber!
if not "!currentEmail!" == "†" echo Email: !currentEmail!
if not "!currentTwitter!" == "†" echo Twitter: !currentTwitter!
if not "!currentDiscord!" == "†" echo Discord: !currentDiscord!
if not "!currentWebsite!" == "†" echo Website: !currentWebsite!
if not "!currentBirthYear!" == "†" echo Birth year: !currentBirthYear!
if not "!currentBirthMonth!" == "†" echo Birth month: !currentBirthMonth!
if not "!currentBirthDay!" == "†" echo Birth day: !currentBirthDay!
if not "!currentCountry!" == "†" echo Country: !currentCountry!
if not "!currentRegion!" == "†" echo Region: !currentRegion!
if not "!currentLocalRegion!" == "†" echo Local region: !currentLocalRegion!
if not "!currentAddress!" == "†" echo Address: !currentAddress!
if not "!currentCallsign!" == "†" echo Radio callsign: !currentCallsign!




echo.
pause