#Requires AutoHotkey v2.0
#SingleInstance Force

; GUI erstellen
MyGui := Gui()
MyGui.Title := "GUI-Builder"
MyGui.Opt("+Resize +MinSize1200x800")

; Werkzeugleiste oben, zweireihig, mit Icons
iconPath := "icons/"

; Erste Reihe
MyGui.Add("Picture", "x10 y10 w24 h24", iconPath "process_12854.ico")
MyGui.Add("Button", "x40 y10 w80 h30", "Button").OnEvent("Click", SelectButton)
MyGui.Add("Picture", "x130 y10 w24 h24", iconPath "file_square_27339.ico")
MyGui.Add("Button", "x160 y10 w80 h30", "Edit").OnEvent("Click", SelectEdit)
MyGui.Add("Picture", "x250 y10 w24 h24", iconPath "creativity_icon_176908.ico")
MyGui.Add("Button", "x280 y10 w80 h30", "Text").OnEvent("Click", SelectText)
MyGui.Add("Picture", "x370 y10 w24 h24", iconPath "process_accepting_12853.ico")
MyGui.Add("Button", "x400 y10 w80 h30", "Checkbox").OnEvent("Click", SelectCheckbox)
MyGui.Add("Picture", "x490 y10 w24 h24", iconPath "innovation_creativity_breakthrough_inventiveness_icon_261215.ico")
MyGui.Add("Button", "x520 y10 w80 h30", "Radio").OnEvent("Click", SelectRadio)
MyGui.Add("Picture", "x610 y10 w24 h24", iconPath "folder_red_open_15159.ico")
MyGui.Add("Button", "x640 y10 w80 h30", "ListBox").OnEvent("Click", SelectListBox)
MyGui.Add("Picture", "x730 y10 w24 h24", iconPath "folder_home_15153.ico")
MyGui.Add("Button", "x760 y10 w80 h30", "DropDownList").OnEvent("Click", SelectDropDownList)
MyGui.Add("Picture", "x850 y10 w24 h24", iconPath "folder_home_15153.ico")
MyGui.Add("Button", "x880 y10 w80 h30", "ComboBox").OnEvent("Click", SelectComboBox)

; Zweite Reihe
MyGui.Add("Picture", "x10 y50 w24 h24", iconPath "tools_terminal_rabbit_12989.ico")
MyGui.Add("Button", "x40 y50 w80 h30", "Slider").OnEvent("Click", SelectSlider)
MyGui.Add("Picture", "x130 y50 w24 h24", iconPath "automation_icon_246054.ico")
MyGui.Add("Button", "x160 y50 w80 h30", "Progress").OnEvent("Click", SelectProgress)
MyGui.Add("Picture", "x250 y50 w24 h24", iconPath "program-group_25171.ico")
MyGui.Add("Button", "x280 y50 w80 h30", "GroupBox").OnEvent("Click", SelectGroupBox)
MyGui.Add("Picture", "x370 y50 w24 h24", iconPath "passwords_keys_6032.ico")
MyGui.Add("Button", "x400 y50 w80 h30", "Hotkey").OnEvent("Click", SelectHotkey)
MyGui.Add("Picture", "x490 y50 w24 h24", iconPath "device_ram_22649.ico")
MyGui.Add("Button", "x520 y50 w80 h30", "DateTime").OnEvent("Click", SelectDateTime)
MyGui.Add("Picture", "x610 y50 w24 h24", iconPath "device_ram_22649.ico")
MyGui.Add("Button", "x640 y50 w80 h30", "MonthCal").OnEvent("Click", SelectMonthCal)
MyGui.Add("Picture", "x730 y50 w24 h24", iconPath "ram-driver_25172.ico")
MyGui.Add("Button", "x760 y50 w80 h30", "UpDown").OnEvent("Click", SelectUpDown)
MyGui.Add("Picture", "x850 y50 w24 h24", iconPath "creativity_icon_176908.ico")
MyGui.Add("Button", "x880 y50 w80 h30", "Picture").OnEvent("Click", SelectPicture)

; Dritte Reihe (entfernt - Tab-Control zu problematisch)
; MyGui.Add("Picture", "x10 y90 w24 h24", iconPath "folder_home_15153.ico")
; MyGui.Add("Button", "x40 y90 w80 h30", "Tab").OnEvent("Click", SelectTab)

;es gibt bis hierhin 16 buttons

; Speichern-Button mit Icon (rechts oben)
MyGui.Add("Picture", "x1100 y10 w24 h24", iconPath "Managerfiles_historyfiles_administradordearchivos_6225.ico")
MyGui.Add("Button", "x1130 y10 w100 h30", "Speichern").OnEvent("Click", SaveGui)

; Alle löschen-Button mit Icon (rechts oben daneben)
MyGui.Add("Picture", "x1240 y10 w24 h24", iconPath "folder_red_open_15159.ico")
MyGui.Add("Button", "x1270 y10 w100 h30", "Alle löschen").OnEvent("Click", DeleteAll)

;hier sind es 18 buttons

; Arbeitsfläche-Größe ComboBox
MyGui.Add("Text", "x10 y100 w120 h20", "GUI-Größe:")
sizeCombo := MyGui.Add("ComboBox", "x130 y100 w150 h200", ["800x600", "1024x768", "1280x720", "1366x768", "1440x900", "1600x900", "1920x1080", "2560x1440", "3840x2160", "Benutzerdefiniert"])
sizeCombo.Value := 1
sizeCombo.OnEvent("Change", OnSizeChange)

; Arbeitsfläche (Standard: 800x600)
workAreaX := 10
workAreaY := 130
workAreaW := 780
workAreaH := 570

; Arbeitsfläche-Rahmen (GroupBox ohne Titel)
workAreaBox := MyGui.Add("GroupBox", "x" workAreaX " y" workAreaY " w" workAreaW " h" workAreaH, "")

; Live-Daten Panel rechts (weit genug weg für alle Größen)
liveDataX := 1200
liveDataY := 130
liveDataW := 200
liveDataH := 20  ; Höhe der einzelnen Text-Controls
liveDataSpacing := 20  ; Abstand zwischen den Text-Controls

liveDataY1 := liveDataY
liveDataY2 := liveDataY + liveDataSpacing
liveDataY3 := liveDataY + 2*liveDataSpacing
liveDataY4 := liveDataY + 3*liveDataSpacing
liveDataY5 := liveDataY + 4*liveDataSpacing

liveWindow := MyGui.Add("Text", "x" liveDataX " y" liveDataY1 " w" liveDataW " h" liveDataH, "Fenster: -")
liveControl := MyGui.Add("Text", "x" liveDataX " y" liveDataY2 " w" liveDataW " h" liveDataH, "Control: -")
liveMouse := MyGui.Add("Text", "x" liveDataX " y" liveDataY3 " w" liveDataW " h" liveDataH, "Maus: -")
liveSize := MyGui.Add("Text", "x" liveDataX " y" liveDataY4 " w" liveDataW " h" liveDataH, "Größe: -")
liveMode := MyGui.Add("Text", "x" liveDataX " y" liveDataY5 " w" liveDataW " h" liveDataH, "Modus: Normal")

; Variablen zum Status
following := false
buttonCounter := 19  ; 16 Werkzeug-Buttons + 1 Speichern + 1 Alle löschen + 1 Arbeitsfläche-GroupBox
editCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
textCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
checkboxCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
radioCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
listboxCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
dropdownCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
comboboxCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
sliderCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
progressCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
groupboxCounter := 0  ; Start bei 0, damit die erste User-GroupBox "Group1" wird
hotkeyCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
datetimeCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
monthcalCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
updownCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
pictureCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
tabCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
sizing := false
sizingType := ""
startX := 0
startY := 0
dragging := false
currentControlName := ""  ; Name des aktuell erstellten Controls
moveButtonName := ""
moveBtnW := 0
moveBtnH := 0

; Array für Controls zum Speichern
controls := []

; Timer für Live-Daten starten
SetTimer(UpdateLiveData, 100)

; GUI anzeigen
MyGui.Show("w1400 h800")

; Event-Handler
UpdateLiveData() {
    global liveWindow, liveControl, liveMouse, liveSize, liveMode, workAreaX, workAreaY, dragging, sizing, sizingType, following, startX, startY
    
    CoordMode("Mouse", "Screen")
    MouseGetPos(&screenX, &screenY, &winId, &controlName)
    winTitle := WinGetTitle("ahk_id " winId)
    
    ; Maus-Position relativ zum Arbeitsbereich
    WinGetPos(&guiX, &guiY, &guiW, &guiH, "GUI-Builder")
    mouseX := screenX - guiX - 8
    mouseY := screenY - guiY - 31
    
    ; Relative Position zur Arbeitsfläche
    relX := mouseX - workAreaX
    relY := mouseY - workAreaY
    
    ; Größe-Info während des Ziehens
    sizeInfo := "Größe: -"
    if (dragging && sizing) {
        ctrlW := mouseX - workAreaX - startX
        ctrlH := mouseY - workAreaY - startY
        if (ctrlW < 10)
            ctrlW := 10
        if (ctrlH < 10)
            ctrlH := 10
        sizeInfo := "Größe: " ctrlW " x " ctrlH
    }
    
    ; Modus-Info
    modeInfo := "Modus: Normal"
    if (sizing)
        modeInfo := "Modus: " sizingType " ziehen"
    else if (following)
        modeInfo := "Modus: Verschieben"
    
    ; Live-Daten aktualisieren
    liveWindow.Value := "Fenster: " winTitle
    liveControl.Value := "Control: " controlName
    liveMouse.Value := "Maus: " relX " x " relY
    liveSize.Value := sizeInfo
    liveMode.Value := modeInfo
}

OnSizeChange(ctrl, *) {
    global workAreaW, workAreaH, workAreaBox, workAreaX, workAreaY, MyGui
    
    selectedSize := ctrl.Text
    workAreaLabel := "Arbeitsfläche (800x600)"  ; Standard-Wert
    
    if (selectedSize = "Benutzerdefiniert") {
        customSize := InputBox("Geben Sie die Größe ein (z.B. 1200x800):", "Benutzerdefinierte Größe", "w300 h150")
        if (customSize.Result) {
            sizeParts := StrSplit(customSize.Value, "x")
            if (sizeParts.Length = 2 && IsNumber(sizeParts[1]) && IsNumber(sizeParts[2])) {
                workAreaW := Integer(sizeParts[1])
                workAreaH := Integer(sizeParts[2])
                if (workAreaW < 100)
                    workAreaW := 100
                if (workAreaH < 100)
                    workAreaH := 100
                workAreaLabel := "Arbeitsfläche (" customSize.Value ")"
            } else {
                workAreaW := 800
                workAreaH := 600
                workAreaLabel := "Arbeitsfläche (800x600)"
            }
        }
    } else if (selectedSize = "800x600") {
        workAreaW := 780
        workAreaH := 570
        workAreaLabel := "Arbeitsfläche (800x600)"
    } else if (selectedSize = "1024x768") {
        workAreaW := 1004
        workAreaH := 738
        workAreaLabel := "Arbeitsfläche (1024x768)"
    } else if (selectedSize = "1280x720") {
        workAreaW := 1260
        workAreaH := 690
        workAreaLabel := "Arbeitsfläche (1280x720)"
    } else if (selectedSize = "1366x768") {
        workAreaW := 1346
        workAreaH := 738
        workAreaLabel := "Arbeitsfläche (1366x768)"
    } else if (selectedSize = "1440x900") {
        workAreaW := 1420
        workAreaH := 870
        workAreaLabel := "Arbeitsfläche (1440x900)"
    } else if (selectedSize = "1600x900") {
        workAreaW := 1580
        workAreaH := 870
        workAreaLabel := "Arbeitsfläche (1600x900)"
    } else if (selectedSize = "1920x1080") {
        workAreaW := 1900
        workAreaH := 1050
        workAreaLabel := "Arbeitsfläche (1920x1080)"
    } else if (selectedSize = "2560x1440") {
        workAreaW := 2540
        workAreaH := 1410
        workAreaLabel := "Arbeitsfläche (2560x1440)"
    } else if (selectedSize = "3840x2160") {
        workAreaW := 3820
        workAreaH := 2130
        workAreaLabel := "Arbeitsfläche (3840x2160)"
    }
    
    ; Arbeitsfläche-Rahmen anpassen
    workAreaBox.Move(workAreaX, workAreaY, workAreaW, workAreaH)
    
    ; Debug-Ausgabe
    ToolTip("Größe geändert: " selectedSize " -> " workAreaW "x" workAreaH)
    
    ; GUI-Größe anpassen falls nötig
    newGuiWidth := workAreaX + workAreaW + 20
    newGuiHeight := workAreaY + workAreaH + 50
    if (newGuiWidth > 1400 || newGuiHeight > 800) {
        MyGui.Move(, , newGuiWidth, newGuiHeight)
    }
}

SaveGui(*) {
    global controls, workAreaW, workAreaH, MyGui
    
    try {
        ; Template laden (UTF-8)
        template := FileRead(A_ScriptDir "\gui_template.ahk", "UTF-8")
        controlsCode := ""
        
        ; GUI-Größe im Template ersetzen
        template := RegExReplace(template, "MyGui\.Show\(`"w\d+\s*h\d+`"\)", "MyGui.Show(`"w" workAreaW " h" workAreaH "`")")
        
        ; Controls hinzufügen
        for ctrl in controls {
            ; Text/Titel für Controls ermitteln
            controlText := ""
            try {
                if (ctrl.type = "Button" || ctrl.type = "Text" || ctrl.type = "Checkbox" || ctrl.type = "Radio" || ctrl.type = "GroupBox") {
                    controlText := MyGui[ctrl.name].Text
                } else if (ctrl.type = "Edit") {
                    controlText := MyGui[ctrl.name].Value
                } else if (ctrl.type = "ListBox" || ctrl.type = "DropDownList" || ctrl.type = "ComboBox") {
                    ; Für List-Controls den aktuellen Wert verwenden
                    controlText := "`"Eintrag1`", `"Eintrag2`", `"Eintrag3`""
                } else if (ctrl.type = "Picture") {
                    controlText := "`"icons/automation_icon_246054.ico`""
                } else if (ctrl.type = "Tab") {
                    ; Für Tab-Controls den Standard-Tab-Text verwenden
                    controlText := "`"Tab1`", `"Tab2`", `"Tab3`""
                }
            } catch {
                ; Fallback-Werte falls Control nicht gefunden wird
                if (ctrl.type = "Button") {
                    controlText := "Button"
                } else if (ctrl.type = "Text") {
                    controlText := "Text"
                } else if (ctrl.type = "Checkbox") {
                    controlText := "Checkbox"
                } else if (ctrl.type = "Radio") {
                    controlText := "Radio"
                } else if (ctrl.type = "GroupBox") {
                    controlText := "Group"
                } else if (ctrl.type = "Edit") {
                    controlText := "Edit"
                } else if (ctrl.type = "Tab") {
                    controlText := "`"Tab1`", `"Tab2`", `"Tab3`""
                }
            }
            
            ; AHK v2 Syntax für Controls
            if (ctrl.type = "Button") {
                controlsCode .= "MyGui.Add(`"Button`", `"x" ctrl.x " y" ctrl.y " w" ctrl.w " h" ctrl.h " v" ctrl.name "`", `"" controlText "`")`n"
            } else if (ctrl.type = "Edit") {
                controlsCode .= "MyGui.Add(`"Edit`", `"x" ctrl.x " y" ctrl.y " w" ctrl.w " h" ctrl.h " v" ctrl.name "`", `"" controlText "`")`n"
            } else if (ctrl.type = "Text") {
                controlsCode .= "MyGui.Add(`"Text`", `"x" ctrl.x " y" ctrl.y " w" ctrl.w " h" ctrl.h " v" ctrl.name "`", `"" controlText "`")`n"
            } else if (ctrl.type = "Checkbox") {
                controlsCode .= "MyGui.Add(`"Checkbox`", `"x" ctrl.x " y" ctrl.y " w" ctrl.w " h" ctrl.h " v" ctrl.name "`", `"" controlText "`")`n"
            } else if (ctrl.type = "Radio") {
                controlsCode .= "MyGui.Add(`"Radio`", `"x" ctrl.x " y" ctrl.y " w" ctrl.w " h" ctrl.h " v" ctrl.name "`", `"" controlText "`")`n"
            } else if (ctrl.type = "ListBox") {
                controlsCode .= "MyGui.Add(`"ListBox`", `"x" ctrl.x " y" ctrl.y " w" ctrl.w " h" ctrl.h " v" ctrl.name "`", [" controlText "])`n"
            } else if (ctrl.type = "DropDownList") {
                controlsCode .= "MyGui.Add(`"DropDownList`", `"x" ctrl.x " y" ctrl.y " w" ctrl.w " h" ctrl.h " v" ctrl.name "`", [" controlText "])`n"
            } else if (ctrl.type = "ComboBox") {
                controlsCode .= "MyGui.Add(`"ComboBox`", `"x" ctrl.x " y" ctrl.y " w" ctrl.w " h" ctrl.h " v" ctrl.name "`", [" controlText "])`n"
            } else if (ctrl.type = "Slider") {
                controlsCode .= "MyGui.Add(`"Slider`", `"x" ctrl.x " y" ctrl.y " w" ctrl.w " h" ctrl.h " v" ctrl.name "`")`n"
            } else if (ctrl.type = "Progress") {
                controlsCode .= "MyGui.Add(`"Progress`", `"x" ctrl.x " y" ctrl.y " w" ctrl.w " h" ctrl.h " v" ctrl.name "`")`n"
            } else if (ctrl.type = "GroupBox") {
                controlsCode .= "MyGui.Add(`"GroupBox`", `"x" ctrl.x " y" ctrl.y " w" ctrl.w " h" ctrl.h " v" ctrl.name "`", `"" controlText "`")`n"
            } else if (ctrl.type = "Hotkey") {
                controlsCode .= "MyGui.Add(`"Hotkey`", `"x" ctrl.x " y" ctrl.y " w" ctrl.w " h" ctrl.h " v" ctrl.name "`")`n"
            } else if (ctrl.type = "DateTime") {
                controlsCode .= "MyGui.Add(`"DateTime`", `"x" ctrl.x " y" ctrl.y " w" ctrl.w " h" ctrl.h " v" ctrl.name "`")`n"
            } else if (ctrl.type = "MonthCal") {
                controlsCode .= "MyGui.Add(`"MonthCal`", `"x" ctrl.x " y" ctrl.y " w" ctrl.w " h" ctrl.h " v" ctrl.name "`")`n"
            } else if (ctrl.type = "UpDown") {
                controlsCode .= "MyGui.Add(`"UpDown`", `"x" ctrl.x " y" ctrl.y " w" ctrl.w " h" ctrl.h " v" ctrl.name "`")`n"
            } else if (ctrl.type = "Picture") {
                controlsCode .= "MyGui.Add(`"Picture`", `"x" ctrl.x " y" ctrl.y " w" ctrl.w " h" ctrl.h " v" ctrl.name "`", " controlText ")`n"
            } else if (ctrl.type = "Tab") {
                controlsCode .= "MyGui.Add(`"Tab3`", `"x" ctrl.x " y" ctrl.y " w" ctrl.w " h" ctrl.h " v" ctrl.name "`", [`"Tab1`", `"Tab2`", `"Tab3`"])`n"
            }
        }
        
        ; Controls in Template einsetzen
        template := RegExReplace(template, "; --- Hier werden die Controls eingefügt", controlsCode)
        
        ; Datei speichern
        try {
            ; Datei komplett neu erstellen
            FileDelete(A_ScriptDir "\cool.ahk")
            FileAppend(template, A_ScriptDir "\cool.ahk", "UTF-8")
            MsgBox("GUI erfolgreich gespeichert als cool.ahk")
        } catch Error as e2 {
            MsgBox("Fehler beim Schreiben der Datei: " e2.Message "`nPfad: " A_ScriptDir "\cool.ahk")
        }
    } catch Error as e {
        MsgBox("Fehler beim Speichern: " e.Message)
    }
}

; Select-Funktionen für alle Control-Typen
SelectButton(*) {
    global sizing, sizingType
    sizing := true
    sizingType := "Button"
    ToolTip("Button-Modus aktiviert")
}

SelectEdit(*) {
    global sizing, sizingType
    sizing := true
    sizingType := "Edit"
}

SelectText(*) {
    global sizing, sizingType
    sizing := true
    sizingType := "Text"
}

SelectCheckbox(*) {
    global sizing, sizingType
    sizing := true
    sizingType := "Checkbox"
}

SelectRadio(*) {
    global sizing, sizingType
    sizing := true
    sizingType := "Radio"
}

SelectListBox(*) {
    global sizing, sizingType
    sizing := true
    sizingType := "ListBox"
}

SelectDropDownList(*) {
    global sizing, sizingType
    sizing := true
    sizingType := "DropDownList"
}

SelectComboBox(*) {
    global sizing, sizingType
    sizing := true
    sizingType := "ComboBox"
}

SelectSlider(*) {
    global sizing, sizingType
    sizing := true
    sizingType := "Slider"
}

SelectProgress(*) {
    global sizing, sizingType
    sizing := true
    sizingType := "Progress"
}

SelectGroupBox(*) {
    global sizing, sizingType
    sizing := true
    sizingType := "GroupBox"
}

SelectHotkey(*) {
    global sizing, sizingType
    sizing := true
    sizingType := "Hotkey"
}

SelectDateTime(*) {
    global sizing, sizingType
    sizing := true
    sizingType := "DateTime"
}

SelectMonthCal(*) {
    global sizing, sizingType
    sizing := true
    sizingType := "MonthCal"
}

SelectUpDown(*) {
    global sizing, sizingType
    sizing := true
    sizingType := "UpDown"
}

SelectPicture(*) {
    global sizing, sizingType
    sizing := true
    sizingType := "Picture"
}

SelectTab(*) {
    global sizing, sizingType
    sizing := true
    sizingType := "Tab"
}



DeleteAll(*) {
    global controls, MyGui, buttonCounter, editCounter, textCounter, checkboxCounter, radioCounter, listboxCounter, dropdownCounter, comboboxCounter, sliderCounter, progressCounter, groupboxCounter, hotkeyCounter, datetimeCounter, monthcalCounter, updownCounter, pictureCounter, tabCounter
    
    ; Alle dynamisch hinzugefügten Controls entfernen
    for ctrl in controls {
        try {
            MyGui[ctrl.name].Destroy()
        }
    }
    
    ; Counter zurücksetzen (da alle Controls gelöscht wurden)
    buttonCounter := 19  ; 16 Werkzeug-Buttons + 1 Speichern + 1 Alle löschen + 1 Arbeitsfläche-GroupBox
    editCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
    textCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
    checkboxCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
    radioCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
    listboxCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
    dropdownCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
    comboboxCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
    sliderCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
    progressCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
    groupboxCounter := 0  ; Start bei 0, damit die erste User-GroupBox "Group1" wird
    hotkeyCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
    datetimeCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
    monthcalCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
    updownCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
    pictureCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
    tabCounter := 1  ; Start bei 1, da es bereits Controls in der GUI gibt
    
    controls := []
}



UpdateControlSize() {
    global dragging, sizingType, startX, startY, workAreaX, workAreaY, controls, buttonCounter, editCounter, textCounter, checkboxCounter, radioCounter, listboxCounter, dropdownCounter, comboboxCounter, sliderCounter, progressCounter, groupboxCounter, hotkeyCounter, datetimeCounter, monthcalCounter, updownCounter, pictureCounter, tabCounter, MyGui, currentControlName
    
    if (dragging) {
        CoordMode("Mouse", "Screen")
        MouseGetPos(&screenX, &screenY)
        WinGetPos(&guiX, &guiY, &guiW, &guiH, "GUI-Builder")
        mouseX := screenX - guiX - 8
        mouseY := screenY - guiY - 31
        
        ; Größe relativ zur Arbeitsfläche berechnen
        ; startX und startY sind bereits relativ zur Arbeitsfläche
        ctrlW := mouseX - workAreaX - startX
        ctrlH := mouseY - workAreaY - startY
        if (ctrlW < 10)
            ctrlW := 10
        if (ctrlH < 10)
            ctrlH := 10
        
        ; Control-Namen verwenden (wurde bereits im LButton Handler gesetzt)
        currentName := currentControlName
        
        ; Control auf absolute Position setzen (für Anzeige)
        absX := startX + workAreaX
        absY := startY + workAreaY
        
        try {
            ; Für Edit-Controls die Höhe explizit setzen
            if (sizingType = "Edit") {
                MyGui[currentName].Move(absX, absY, ctrlW, ctrlH)
            } else {
                MyGui[currentName].Move(absX, absY, ctrlW, ctrlH)
            }
        }
        
        ; Update die Werte im controls-Array
        for i, ctrl in controls {
            if (ctrl.name = currentName) {
                ctrl.x := startX
                ctrl.y := startY
                ctrl.w := ctrlW
                ctrl.h := ctrlH
                controls[i] := ctrl
                break
            }
        }
    }
}

#HotIf WinActive("GUI-Builder")

; Hotkey-Handler für Maus-Events
~LButton:: {
    global sizing, sizingType, startX, startY, dragging, workAreaX, workAreaY, workAreaW, workAreaH, controls, buttonCounter, editCounter, textCounter, checkboxCounter, radioCounter, listboxCounter, dropdownCounter, comboboxCounter, sliderCounter, progressCounter, groupboxCounter, hotkeyCounter, datetimeCounter, monthcalCounter, updownCounter, pictureCounter, tabCounter, MyGui, currentControlName
    
    ; Nur reagieren wenn wir im sizing-Modus sind
    if (sizing) {
        ; Mausposition berechnen
        CoordMode("Mouse", "Screen")
        MouseGetPos(&screenX, &screenY)
        WinGetPos(&guiX, &guiY, &guiW, &guiH, "GUI-Builder")
        mouseX := screenX - guiX - 8
        mouseY := screenY - guiY - 31
        
        ; Nur reagieren wenn der Klick in der Arbeitsfläche ist
        if (mouseX >= workAreaX && mouseX <= workAreaX + workAreaW && mouseY >= workAreaY && mouseY <= workAreaY + workAreaH) {
            ; Koordinaten relativ zur Arbeitsfläche (0,0 = linke obere Ecke der GroupBox)
            startX := mouseX - workAreaX
            startY := mouseY - workAreaY
            dragging := true
            
            ; Debug-Ausgabe
            ToolTip("Erstelle Control: " sizingType " - Counter: " groupboxCounter)
            
            ; Control erstellen basierend auf Typ
            if (sizingType = "Button") {
                buttonCounter++
                currentControlName := "Button" buttonCounter
                MyGui.Add("Button", "x" startX " y" startY " w1 h1", "Button")
                ToolTip("Button erstellt: " currentControlName)
            } else if (sizingType = "Edit") {
                editCounter++
                currentControlName := "Edit" editCounter
                MyGui.Add("Edit", "x" startX " y" startY " w1 h20", "Edit")
            } else if (sizingType = "Text") {
                textCounter++
                currentControlName := "Text" textCounter
                MyGui.Add("Text", "v" currentControlName " x" startX " y" startY " w1 h1", "Text" (textCounter-1))
            } else if (sizingType = "Checkbox") {
                buttonCounter++  ; Checkbox verwendet den gleichen Counter wie Buttons
                currentControlName := "Button" buttonCounter  ; Checkbox wird als Button benannt
                MyGui.Add("Checkbox", "v" currentControlName " x" startX " y" startY " w1 h1", "Checkbox")
            } else if (sizingType = "Radio") {
                buttonCounter++  ; Radio verwendet den gleichen Counter wie Buttons
                currentControlName := "Button" buttonCounter  ; Radio wird als Button benannt
                MyGui.Add("Radio", "v" currentControlName " x" startX " y" startY " w1 h1", "Radio")
            } else if (sizingType = "ListBox") {
                listboxCounter++
                currentControlName := "ListBox" listboxCounter
                MyGui.Add("ListBox", "v" currentControlName " x" startX " y" startY " w1 h1", ["Eintrag1", "Eintrag2", "Eintrag3"])
            } else if (sizingType = "DropDownList") {
                dropdownCounter++
                currentControlName := "DropDownList" dropdownCounter
                MyGui.Add("DropDownList", "v" currentControlName " x" startX " y" startY " w1 h1", ["Auswahl1", "Auswahl2", "Auswahl3"])
            } else if (sizingType = "ComboBox") {
                comboboxCounter++
                currentControlName := "ComboBox" comboboxCounter
                MyGui.Add("ComboBox", "v" currentControlName " x" startX " y" startY " w1 h1", ["Auswahl1", "Auswahl2", "Auswahl3"])
            } else if (sizingType = "Slider") {
                sliderCounter++
                currentControlName := "Slider" sliderCounter
                MyGui.Add("Slider", "v" currentControlName " x" startX " y" startY " w1 h1")
            } else if (sizingType = "Progress") {
                progressCounter++
                currentControlName := "Progress" progressCounter
                MyGui.Add("Progress", "v" currentControlName " x" startX " y" startY " w1 h1")
            } else if (sizingType = "GroupBox") {
                buttonCounter++  ; GroupBox verwendet den gleichen Counter wie Buttons
                currentControlName := "Button" buttonCounter  ; GroupBox wird als Button benannt
                MyGui.Add("GroupBox", "v" currentControlName " x" startX " y" startY " w1 h1", "")
                ToolTip("GroupBox erstellt: " currentControlName)
            } else if (sizingType = "Hotkey") {
                hotkeyCounter++
                currentControlName := "Hotkey" hotkeyCounter
                MyGui.Add("Hotkey", "v" currentControlName " x" startX " y" startY " w1 h1")
            } else if (sizingType = "DateTime") {
                datetimeCounter++
                currentControlName := "DateTime" datetimeCounter
                MyGui.Add("DateTime", "v" currentControlName " x" startX " y" startY " w1 h1")
            } else if (sizingType = "MonthCal") {
                monthcalCounter++
                currentControlName := "MonthCal" monthcalCounter
                MyGui.Add("MonthCal", "v" currentControlName " x" startX " y" startY " w1 h1")
            } else if (sizingType = "UpDown") {
                updownCounter++
                currentControlName := "UpDown" updownCounter
                MyGui.Add("UpDown", "v" currentControlName " x" startX " y" startY " w1 h1")
            } else if (sizingType = "Picture") {
                pictureCounter++
                currentControlName := "Picture" pictureCounter
                MyGui.Add("Picture", "v" currentControlName " x" startX " y" startY " w32 h32", "icons/automation_icon_246054.ico")
            } else if (sizingType = "Tab") {
                tabCounter++
                currentControlName := "Tab" tabCounter
                ; Tab-Controls brauchen absolute Positionen
                absX := startX + workAreaX
                absY := startY + workAreaY
                MyGui.Add("Tab3", "v" currentControlName " x" absX " y" absY " w100 h80", ["Tab1", "Tab2", "Tab3"])
                ToolTip("Tab erstellt: " currentControlName)
            }
            
            ; Control für späteres Speichern hinzufügen
            controls.Push({type: sizingType, name: currentControlName, x: startX, y: startY, w: 1, h: 1})
            ToolTip("Control gespeichert: " sizingType " - " currentControlName " - Array-Größe: " controls.Length)
            
            ; Timer für Live-Update starten
            SetTimer(UpdateControlSize, 16)
        }
    }
}

~LButton Up:: {
    global dragging, sizing, sizingType, startX, startY, currentControlName, MyGui, groupboxCounter
    if (dragging) {
        ; Titel für GroupBox nach dem Drag setzen
        if (sizingType = "GroupBox" && currentControlName) {
            ; GroupBox-Titel basierend auf der Anzahl der GroupBox-Controls
            groupboxCount := 0
            for ctrl in controls {
                if (ctrl.type = "GroupBox") {
                    groupboxCount++
                }
            }
            MyGui[currentControlName].Text := "Group " groupboxCount
        }
        
        dragging := false
        SetTimer(UpdateControlSize, 0)
        sizing := false
        sizingType := ""
        startX := 0
        startY := 0
        currentControlName := ""
    }
}

; GUI-Close Event
MyGui.OnEvent("Close", (*) => ExitApp()) 