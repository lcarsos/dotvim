rem Yes, I'm a bad person.
rem This script needs to be run as administrator in cmd.exe for mklink.
rem Powershell does not support mklink, and I don't feel like learning how to
rem make NTFS Junctions in Powershell.
rem This script doesn't work with nvim

cd %USERPROFILE%

mkdir .vimlocal\swap
mkdir .vimlocal\undo
mklink _vimrc vimfiles\vimrc
