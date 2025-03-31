#Persistent  ; Keep the script running
SetTimer, CheckPlayniteWindow, 1000  ; Check every 1 second

focused := false  ; Variable to track whether we have already moved the window

CheckPlayniteWindow:
    ; Check if the Playnite window exists
    IfWinExist, ahk_exe playnite.fullscreenapp.exe
    {
        ; If the Playnite window is focused
        if (WinActive("ahk_exe playnite.fullscreenapp.exe")) {
            ; If the window hasn't been moved already, move it to the background
            if (!focused) {
                ; Move the window to the background, but not below the taskbar
                WinSet, Bottom,, ahk_exe playnite.fullscreenapp.exe
                focused := true  ; Mark that the window has been moved
            }
        } else {
            ; Reset the flag if the window is no longer focused
            focused := false
        }
    }
return
