; -- Inno Setup Script for Library Management App --

[Setup]
AppName=Library Management System
AppVersion=1.0
DefaultDirName={pf}\LibraryManagement
OutputDir=.
OutputBaseFilename=LibraryManagementInstaller
Compression=lzma
SolidCompression=yes

[Files]
; Application executable
Source: "C:\Users\PC\InstallerFiles\App\LibraryManagement.exe"; DestDir: "{app}"; Flags: ignoreversion

; Required DLLs
Source: "C:\Users\PC\InstallerFiles\App\LibraryManagement.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\PC\InstallerFiles\App\MySql.Data.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\PC\InstallerFiles\App\Google.Protobuf.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\PC\InstallerFiles\App\System.Text.Json.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\PC\InstallerFiles\App\System.Text.Encodings.Web.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\PC\InstallerFiles\App\System.IO.Pipelines.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\PC\InstallerFiles\App\System.IO.Packaging.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\PC\InstallerFiles\App\DocumentFormat.OpenXml.Framework.dll"; DestDir: "{app}"; Flags: ignoreversion

; SQL Script and Batch File
Source: "C:\Users\PC\InstallerFiles\Scripts\init.sql"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\PC\InstallerFiles\Scripts\setup.bat"; DestDir: "{app}"; Flags: ignoreversion

; MySQL Installer
Source: "C:\Users\PC\InstallerFiles\MySQL\mysql-installer-community-8.0.41.0.msi"; DestDir: "{tmp}"; Flags: ignoreversion

[Run]
; Install MySQL silently
Filename: "msiexec.exe"; Parameters: "/i '{tmp}\mysql-installer-community-8.0.41.0.msi' /qn /norestart"; Flags: runhidden waituntilterminated

; Run batch file to set up database
Filename: "msiexec.exe"; Parameters: "/i ""{tmp}\mysql-installer-community-8.0.41.0.msi"" /qn /norestart"; Flags: runhidden waituntilterminated

; Launch the main application
Filename: "{app}\LibraryManagement.exe"; Description: "Launch Library Management System"; Flags: nowait postinstall skipifsilent

[Icons]
Name: "{group}\Library Management"; Filename: "{app}\LibraryManagement.exe"