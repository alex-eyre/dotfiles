#SingleInstance, force
I_Icon = %A_ScriptDir%/vim.ico
IfExist, %I_Icon%
  Menu, Tray, Icon, %I_Icon%

global key_mode := 0
; 0 == normal
; 1 == vim mouse

setup_vim_mouse_mode()
>^Tab::cycle_mode()
Launch_App2::cycle_mode()
AppsKey::cycle_mode()


SetSystemCursor( Cursor = "", cx = 0, cy = 0 )
{
    BlankCursor := 0, SystemCursor := 0, FileCursor := 0 ; init
    
    SystemCursors = 32512IDC_ARROW,32513IDC_IBEAM,32514IDC_WAIT,32515IDC_CROSS
    ,32516IDC_UPARROW,32640IDC_SIZE,32641IDC_ICON,32642IDC_SIZENWSE
    ,32643IDC_SIZENESW,32644IDC_SIZEWE,32645IDC_SIZENS,32646IDC_SIZEALL
    ,32648IDC_NO,32649IDC_HAND,32650IDC_APPSTARTING,32651IDC_HELP
    
    If Cursor = ; empty, so create blank cursor 
    {
        VarSetCapacity( AndMask, 32*4, 0xFF ), VarSetCapacity( XorMask, 32*4, 0 )
        BlankCursor = 1 ; flag for later
    }
    Else If SubStr( Cursor,1,4 ) = "IDC_" ; load system cursor
    {
        Loop, Parse, SystemCursors, `,
        {
            CursorName := SubStr( A_Loopfield, 6, 15 ) ; get the cursor name, no trailing space with substr
            CursorID := SubStr( A_Loopfield, 1, 5 ) ; get the cursor id
            SystemCursor = 1
            If ( CursorName = Cursor )
            {
                CursorHandle := DllCall( "LoadCursor", Uint,0, Int,CursorID )   
                Break                   
            }
        }   
        If CursorHandle = ; invalid cursor name given
        {
            Msgbox,, SetCursor, Error: Invalid cursor name
            CursorHandle = Error
        }
    }   
    Else If FileExist( Cursor )
    {
        SplitPath, Cursor,,, Ext ; auto-detect type
        If Ext = ico 
            uType := 0x1    
        Else If Ext in cur,ani
            uType := 0x2        
        Else ; invalid file ext
        {
            Msgbox,, SetCursor, Error: Invalid file type
            CursorHandle = Error
        }       
        FileCursor = 1
    }
    Else
    {   
        Msgbox,, SetCursor, Error: Invalid file path or cursor name
        CursorHandle = Error ; raise for later
    }
    If CursorHandle != Error 
    {
        Loop, Parse, SystemCursors, `,
        {
            If BlankCursor = 1 
            {
                Type = BlankCursor
                %Type%%A_Index% := DllCall( "CreateCursor"
                , Uint,0, Int,0, Int,0, Int,32, Int,32, Uint,&AndMask, Uint,&XorMask )
                CursorHandle := DllCall( "CopyImage", Uint,%Type%%A_Index%, Uint,0x2, Int,0, Int,0, Int,0 )
                DllCall( "SetSystemCursor", Uint,CursorHandle, Int,SubStr( A_Loopfield, 1, 5 ) )
            }           
            Else If SystemCursor = 1
            {
                Type = SystemCursor
                CursorHandle := DllCall( "LoadCursor", Uint,0, Int,CursorID )   
                %Type%%A_Index% := DllCall( "CopyImage"
                , Uint,CursorHandle, Uint,0x2, Int,cx, Int,cy, Uint,0 )     
                CursorHandle := DllCall( "CopyImage", Uint,%Type%%A_Index%, Uint,0x2, Int,0, Int,0, Int,0 )
                DllCall( "SetSystemCursor", Uint,CursorHandle, Int,SubStr( A_Loopfield, 1, 5 ) )
            }
            Else If FileCursor = 1
            {
                Type = FileCursor
                %Type%%A_Index% := DllCall( "LoadImageW"
                , UInt,0, Str,Cursor, UInt,uType, Int,cx, Int,cy, UInt,0x10 ) 
                DllCall( "SetSystemCursor", Uint,%Type%%A_Index%, Int,SubStr( A_Loopfield, 1, 5 ) )         
            }          
        }
    }   
}
UpdateCursor()
{
    global Cursor
    CursorHandle := DllCall( "LoadCursor", Uint,0, Int,IDC_SIZEALL )
    CursorHandle := DllCall( "LoadCursorFromFile", Str,Cursor )
    SetSystemCursor(Cursor)
}



NormalCursor := "%A_ScriptDir%/normal.cur"
VimCursor := "%A_ScriptDir%/vim.cur"

NormalCursorHandle := DllCall("LoadCursorFromFile",  Str, NormalCursor)
VimCursorHandle := DllCall("LoadCursorFromFile", Str, VimCursor)

replace_cursor(cursor_handle) {

	Cursors = 32512,32513,32514,32515,32516,32640,32641,32642,32643,32644,32645,32646,32648,32649,32650,32651
        DllCall("SetCursor", "UInt", cursor_handle)
}



move_up(amount) {
	MouseMove, 0, -amount, 0, R
}
move_down(amount) {
	MouseMove, 0, amount, 0, R
}
move_left(amount) {
	MouseMove, -amount, 0, 0, R
} 
move_right(amount) {
	MouseMove, amount, 0, 0, R
} 
MoveUpNormal:
	move_up(60)
Return
MoveDownNormal:
	move_down(60)
Return
MoveLeftNormal:
	move_left(60)
Return
MoveRightNormal:
	move_right(60)
Return

MoveUpSuper:
	move_up(120)
Return
MoveDownSuper:
	move_down(120)
Return
MoveLeftSuper:
	move_left(120)
Return
MoveRightSuper:
	move_right(120)
Return

MoveUpMicro:
	move_up(15)
Return
MoveDownMicro:
	move_down(15)
Return
MoveLeftMicro:
	move_left(15)
Return
MoveRightMicro:
	move_right(15)
Return

DoClick:
	Click
Return

DoEnter:
	SendInput, {Enter}
Return

DoRightClick:
	Click, Right
Return


setup_vim_mouse_mode() {
	Hotkey, k, MoveUpNormal
	Hotkey, j, MoveDownNormal
	Hotkey, h, MoveLeftNormal
	Hotkey, l, MoveRightNormal

	Hotkey, +k, MoveUpSuper
	Hotkey, +j, MoveDownSuper
	Hotkey, +h, MoveLeftSuper
	Hotkey, +l, MoveRightSuper

	Hotkey, ^k, MoveUpMicro
	Hotkey, ^j, MoveDownMicro
	Hotkey, ^h, MoveLeftMicro
	Hotkey, ^l, MoveRightMicro

	Hotkey, Enter, DoClick
	Hotkey, ^Enter, DoRightClick
	Hotkey, Enter & @, DoEnter
	Hotkey, @ & Enter, DoEnter

}

enable_vim_mouse_mode() {
	Hotkey, k, On
	Hotkey, j, On
	Hotkey, h, On
	Hotkey, l, On

	Hotkey, +k, On
	Hotkey, +j, On
	Hotkey, +h, On
	Hotkey, +l, On

	Hotkey, ^k, On
	Hotkey, ^j, On
	Hotkey, ^h, On
	Hotkey, ^l, On

	Hotkey, Enter, On
	Hotkey, ^Enter, On
	Hotkey, Enter & @, On
	Hotkey, @ & Enter, On

	global Cursor := A_ScriptDir . ".\vim.cur"
	UpdateCursor()
}
disable_vim_mouse_mode() {
	Hotkey, k, Off
	Hotkey, j, Off
	Hotkey, h, Off
	Hotkey, l, Off

	Hotkey, +k, Off
	Hotkey, +j, Off
	Hotkey, +h, Off
	Hotkey, +l, Off

	Hotkey, ^k, Off
	Hotkey, ^j, Off
	Hotkey, ^h, Off
	Hotkey, ^l, Off

	Hotkey, Enter, Off
	Hotkey, ^Enter, Off
	Hotkey, Enter & @, Off
	Hotkey, @ & Enter, Off


	global Cursor := A_ScriptDir . ".\normal.cur"
	UpdateCursor()
}

cycle_mode() {
	global key_mode
	key_mode := 1 - key_mode
	if(key_mode = 1) {
		enable_vim_mouse_mode()
	} else {
		disable_vim_mouse_mode()
	}
}