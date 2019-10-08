#SingleInstance, Force

Run, powershell.exe C:/Users/ase/.local/share/bin/focus_follows_mouse.ps1

load_all() {
          TrayTip, Alex's Ricing Addiction, Reloading all scripts...
	Loop, Files, ./ahk/*.ahk, FR
	{
		If(!InStr(A_LoopFileName, "~") && !InStr(A_LoopFileName, "#")) {
			Run, %A_AhkPath% "%A_ScriptDir%/%A_LoopFilePath%"   A; Run, %A_AhkPath% "%A_LoopFileFullPath%"
		}
	}
}
load_all()
#!^+r::load_all()
