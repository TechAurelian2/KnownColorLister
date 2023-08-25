; KnownColorLister Setup Program

;--------------------------------------

!include MUI.nsh ;Include Modern UI

;--------------------------------------

;General

  RequestExecutionLevel admin

  ;The name of the installer
  Name "KnownColorLister"

  ;The setup executable file to create
  OutFile "output\KnownColorListerInstaller.exe"

  ;The default installation directory
  InstallDir "$PROGRAMFILES64\TechAurelian\KnownColorLister"

;--------------------------------------

;Interface Settings

  !define MUI_ABORTWARNING

;--------------------------------------

;Pages

  !insertmacro MUI_PAGE_WELCOME
  !insertmacro MUI_PAGE_LICENSE "Files\LICENSE"
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES

  !define MUI_FINISHPAGE_RUN KnownColorLister.exe
  !define MUI_FINISHPAGE_RUN_TEXT "Start KnownColorLister"
  !insertmacro MUI_PAGE_FINISH

  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES

;--------------------------------------

;Languages

  !insertmacro MUI_LANGUAGE "English"

;--------------------------------------

;Version Information

  VIProductVersion "1.0.0.11"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "KnownColorLister"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "Comments" "Lists all known Windows system colors"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "CompanyName" "TechAurelian"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalTrademarks" ""
  VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "Copyright (c) 2016-2023 TechAurelian (https://techaurelian.com)"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "KnownColorLister Installer"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "1.0.0.11"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductVersion" "1.0.0.11"

;--------------------------------------

Section
  ; Copy files to installation directory
  SetOutPath $INSTDIR
  File Files\KnownColorLister.exe
  File Files\KnownColorLister.exe.config
  File Files\LICENSE
  File Files\HomePageLink.html

  ; Create Start Menu shortcuts
  CreateShortCut "$SMPROGRAMS\KnownColorLister.lnk" "$INSTDIR\KnownColorLister.exe" "" "" "" SW_SHOWNORMAL "" "Lists all known Windows system colors"

  ;Create uninstaller
  WriteUninstaller "$INSTDIR\uninstall.exe"
  SetRegView 64
  WriteRegStr   HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\KnownColorLister" "DisplayName" "KnownColorLister"
  WriteRegStr   HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\KnownColorLister" "UninstallString" "$\"$INSTDIR\uninstall.exe$\""
  WriteRegStr   HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\KnownColorLister" "QuietUninstallString" "$\"$INSTDIR\uninstall.exe$\" /S" 
  WriteRegStr   HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\KnownColorLister" "DisplayVersion" "1.0.0.11"
  WriteRegStr   HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\KnownColorLister" "DisplayIcon" "$\"$INSTDIR\KnownColorLister.exe$\""
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\KnownColorLister" "EstimatedSize" "71"
  WriteRegStr   HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\KnownColorLister" "HelpLink" "https://techaurelian.com/knowncolorlister/"
  WriteRegStr   HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\KnownColorLister" "InstallLocation" "$INSTDIR"
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\KnownColorLister" "NoModify" "1"
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\KnownColorLister" "NoRepair" "1"
  WriteRegStr   HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\KnownColorLister" "Publisher" "TechAurelian"
  WriteRegStr   HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\KnownColorLister" "URLInfoAbout" "https://techaurelian.com/knowncolorlister/"
  WriteRegStr   HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\KnownColorLister" "URLUpdateInfo" "https://techaurelian.com/knowncolorlister/"
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\KnownColorLister" "VersionMajor" "1"
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\KnownColorLister" "VersionMinor" "0"
SectionEnd

;--------------------------------------

;Uninstaller Section

Section "Uninstall"

  ; Delete files from installation directory
  Delete "$INSTDIR\uninstall.exe"
  Delete "$INSTDIR\KnownColorLister.exe"
  Delete "$INSTDIR\KnownColorLister.exe.config"
  Delete "$INSTDIR\LICENSE"
  Delete "$INSTDIR\HomePageLink.html"
  RMDir "$INSTDIR"
  ; RMDir "$PROGRAMFILES64\TechAurelian"

  ; Delete Start Menu shortcut
  Delete "$SMPROGRAMS\KnownColorLister.lnk"

  ; Delete Uninstall registry key
  SetRegView 64
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\KnownColorLister"

SectionEnd