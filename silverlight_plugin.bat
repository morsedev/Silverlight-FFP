@echo %DBGI% off
:: Purpose:
::      install or remove silvberlight files from firefox portable plugin folder
::	
:: Usage:
::      silverlight_plugin [remover]
::
:: Args:
::      remove      remove files into a subfolder
::
:: Notes:
::  
::	Customize path before run 
::      change to silverlight folder (e.g.
::      "c:\Program Files\Microsoft Silverlight\5.1.20913.0") before running
::
::      sllauncher.EXE is not found in v4.0.60310.0, v5.1.20913.0
::      sllauncher.EXE is not found in v5.1.20913.0
::      NPCTRLUI.DLL is not found in v5.1.20913.0
::
:: Author: 
::	Copyright (C) 2014  Skipton Ryper
::	                    Perth, Australia
::	
::	This program is free software; you can redistribute it and/or
::	modify it under the terms of the GNU AFFERO GENERAL PUBLIC LICENSE
::	as published by the Free Software Foundation; either version 3
::	of the License, or (at your option) any later version.
::	
::	This program is distributed in the hope that it will be useful,
::	but WITHOUT ANY WARRANTY; without even the implied warranty of
::	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
::	GNU General Public License for more details. 
::	
::	Licence details can be found on the Internet at
::      http://www.gnu.org/licenses/agpl.html or in the directory containing 
::      this source see file called COPYING.TXT.
::	
::	Send bug reports to the author mailto:skip.ryper (at) @hotmail.com.MAPSON
::      (remove text ".MAPSON" for address)
::
:: Modifications:
::	
:: DATE       MOD  AUTHOR/DESCRIPTION
:: ---------- ---- ------------------
:: 19/11/2014 1.00 S. Ryper
::                 Original Version
::
:: 20/11/2014 1.01 S. Ryper
::                 First release
::
    @echo %dbgi% off
    if "%1"=="remove" goto remove1

    if not exist agcore.DLL goto err1
    :: two file not found in ver 5.1
    @echo on
    set plugdest=c:\app\FFP\Data\plugins\
    copy agcore.DLL %plugdest%
    copy coreclr.DLL %plugdest%
    copy microsoft.visualbasic.DLL %plugdest%
    copy mscorlib.DLL %plugdest%
    copy mscorrc.DLL %plugdest%
    copy npctrl.DLL %plugdest%
    copy NPCTRLUI.DLL %plugdest%
    copy silverlight.configuration.EXE %plugdest%
    copy silverlight.configurationui.DLL %plugdest%
    copy sllauncher.EXE %plugdest%
    copy slr.dll.managed_manifest %plugdest%
    copy system.core.DLL %plugdest%
    copy system.DLL %plugdest%
    copy system.net.DLL %plugdest%
    copy system.runtime.serialization.DLL %plugdest%
    copy system.servicemodel.DLL %plugdest%
    copy system.servicemodel.web.DLL %plugdest%
    copy system.windows.browser.DLL %plugdest%
    copy System.Windows.DLL %plugdest%
    copy system.xml.DLL %plugdest%
    @echo %dbgi% off
    goto fin

:remove1
    if not exist oldplugin\*.* ( 
        mkdir oldplugin
        if errorlevel 1 (
            echo can not make oldplugin folder
            goto fin
        )
    )

    if not exist agcore.DLL goto err2
    set plugdest=.\oldplugin
    move agcore.DLL %plugdest%
    move coreclr.DLL %plugdest%
    move microsoft.visualbasic.DLL %plugdest%
    move mscorlib.DLL %plugdest%
    move mscorrc.DLL %plugdest%
    move npctrl.DLL %plugdest%
    move NPCTRLUI.DLL %plugdest%
    move silverlight.configuration.EXE %plugdest%
    move silverlight.configurationui.DLL %plugdest%
    move sllauncher.EXE %plugdest%
    move slr.dll.managed_manifest %plugdest%
    move system.core.DLL %plugdest%
    move system.DLL %plugdest%
    move system.net.DLL %plugdest%
    move system.runtime.serialization.DLL %plugdest%
    move system.servicemodel.DLL %plugdest%
    move system.servicemodel.web.DLL %plugdest%
    move system.windows.browser.DLL %plugdest%
    move System.Windows.DLL %plugdest%
    move system.xml.DLL %plugdest%
    goto fin

:err1
    @echo off
    echo agcore.DLL not found in current dir - cannot clone setup
    goto fin

:err2
    echo agcore.DLL not found in current dir - cannot remove plugin
    goto fin

:fin
