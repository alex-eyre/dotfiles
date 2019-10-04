#SingleInstance, Force
load_all() {
          TrayTip, Alex's Ricing Addiction, Reloading all scripts...
	Loop, Files, ./ahk/*.ahk, FR
	{
		If(!InStr(A_LoopFileName, "~") && !InStr(A_LoopFileName, "#")) {
			Run, %A_AhkPath% "%A_ScriptDir%/ahk/%A_LoopFilePath%"   A; Run, %A_AhkPath% "%A_LoopFileFullPath%"
		}
	}
}
load_all()
#!^+r::load_all()
