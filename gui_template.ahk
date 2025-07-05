#Requires AutoHotkey v2.0
#SingleInstance Force

; GUI erstellen
MyGui := Gui()
MyGui.Title := "Gespeicherte GUI"
MyGui.Opt("+Resize +MinSize800x600")

; --- Hier werden die Controls eingefügt

; GUI anzeigen
MyGui.Show("w800 h600")

; GUI-Close Event
MyGui.OnEvent("Close", (*) => ExitApp()) 