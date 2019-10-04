#SingleInstance, force

I_Icon = %A_ScriptDir%/binds.ico
IfExist, %I_Icon%
  Menu, Tray, Icon, %I_Icon%
SetCapsLockState, AlwaysOff

; #Return::Run, "alacritty.exe"
#Return::Run, "C:\Users\ase\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\winterm"
#+e::Run, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Chromium"
#+.::Run, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Visual Studio Code\Visual Studio Code"
#+,::Run, "runemacs.exe", "-mm"
#+a::Run, "C:\Program Files\qutebrowser\qutebrowser.exe"
#+o::Run, "C:\Windows\explorer.exe"

close_function() {
	WinGetTitle, Title, A
	if (Title = "Todoist: To-Do List and Task Manager") {
                  WinMinimize, A
	  } else {
                  WinClose, A
            }
}

#+c::close_function()

CapsLock & m::
V++
M:=mod(V,2)
if M=0
   SetDefaultKeyboard(0x19360409) ; Programmer Dvorak
else
   SetDefaultKeyboard(0x0409) ; english-US
return

setDefaultKeyboard(LocaleID){
	Static SPI_SETDEFAULTINPUTLANG := 0x005A, SPIF_SENDWININICHANGE := 2
	
	Lan := DllCall("LoadKeyboardLayout", "Str", Format("{:08x}", LocaleID), "Int", 0)
	VarSetCapacity(binaryLocaleID, 4, 0)
	NumPut(LocaleID, binaryLocaleID)
	DllCall("SystemParametersInfo", "UInt", SPI_SETDEFAULTINPUTLANG, "UInt", 0, "UPtr", &binaryLocaleID, "UInt", SPIF_SENDWININICHANGE)
	
	WinGet, windows, List
	Loop % windows {
		PostMessage 0x50, 0, % Lan, , % "ahk_id " windows%A_Index%
	}
}
