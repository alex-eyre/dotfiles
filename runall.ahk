Loop, Files, ./ahk/*.ahk, FR
{
    If(!InStr(A_LoopFileName, "~") && !InStr(A_LoopFileName, "#")) {
	    Run, %A_AhkPath% "%A_ScriptDir%/ahk/%A_LoopFilePath%"   A; Run, %A_AhkPath% "%A_LoopFileFullPath%"
    }
}