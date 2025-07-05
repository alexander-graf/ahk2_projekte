# GUI-Builder v2.0

Ein visueller GUI-Builder für AutoHotkey v2, mit dem Sie GUIs per Drag & Drop erstellen können.

## Features

### 🎨 **Visueller Editor**
- Drag & Drop Interface für alle AHK v2 Controls
- Live-Vorschau während des Ziehens
- Echtzeit-Größenanzeige
- Arbeitsfläche mit sichtbarem Rahmen

### 📦 **Unterstützte Controls**
- **Button** - Schaltflächen
- **Edit** - Texteingabefelder
- **Text** - Statische Texte
- **Checkbox** - Kontrollkästchen
- **Radio** - Optionsfelder
- **ListBox** - Listenfelder
- **DropDownList** - Dropdown-Listen
- **ComboBox** - Kombinationsfelder
- **Slider** - Schieberegler
- **Progress** - Fortschrittsbalken
- **GroupBox** - Gruppierungsrahmen
- **Hotkey** - Hotkey-Eingabefelder
- **DateTime** - Datum/Zeit-Picker
- **MonthCal** - Monatskalender
- **UpDown** - Auf/Ab-Regler
- **Picture** - Bildanzeige

### 🎯 **GUI-Größen**
- Vordefinierte Größen: 800x600, 1024x768, 1280x720, 1366x768, 1440x900, 1600x900, 1920x1080, 2560x1440, 3840x2160
- Benutzerdefinierte Größen möglich
- Automatische GUI-Anpassung

### 💾 **Export**
- Speichert als vollständige AHK v2 Dateien
- Verwendet Template-basierte Generierung
- UTF-8 Encoding für korrekte Zeichendarstellung

## Installation

1. **AutoHotkey v2 installieren**
   - Download von [autohotkey.com](https://www.autohotkey.com/)
   - Mindestens Version 2.0 erforderlich

2. **Repository klonen**
   ```bash
   git clone [repository-url]
   cd gui-builder-ahk-v2
   ```

3. **GUI-Builder starten**
   ```bash
   gui_builder_v2.ahk
   ```

## Verwendung

### 1. **Control hinzufügen**
- Klicken Sie auf den gewünschten Control-Typ in der Werkzeugleiste
- Ziehen Sie in der Arbeitsfläche, um Größe und Position zu bestimmen
- Lassen Sie die Maustaste los, um das Control zu erstellen

### 2. **Control bearbeiten**
- Ziehen Sie an den Rändern, um die Größe zu ändern
- Alle Controls sind nach dem Erstellen noch verschiebbar

### 3. **GUI speichern**
- Klicken Sie auf "Speichern" in der Werkzeugleiste
- Die GUI wird als `cool.ahk` gespeichert
- Die Datei ist sofort lauffähig

### 4. **Alle Controls löschen**
- Klicken Sie auf "Alle löschen" um neu zu beginnen

## Dateistruktur

```
gui-builder-ahk-v2/
├── gui_builder_v2.ahk    # Hauptprogramm
├── gui_template.ahk      # Template für gespeicherte GUIs
├── cool.ahk             # Ausgabe-Datei (wird erstellt)
├── icons/               # Icon-Ordner (optional)
└── README.md            # Diese Datei
```

## Technische Details

### **Control-Namensgebung**
- Buttons: `Button20`, `Button21`, ...
- GroupBox: `Button20`, `Button21`, ... (intern als Button benannt)
- Edit: `Edit1`, `Edit2`, ...
- Text: `Text1`, `Text2`, ...
- etc.

### **Arbeitsfläche**
- Standard: 780x570 Pixel
- Anpassbar über ComboBox
- Automatische GUI-Größenanpassung

### **Hotkeys**
- `LButton`: Control erstellen/ziehen
- Nur aktiv wenn Control-Typ ausgewählt ist

## Troubleshooting

### **Control wird nicht erstellt**
- Stellen Sie sicher, dass Sie in der Arbeitsfläche klicken
- Prüfen Sie, ob der gewünschte Control-Typ ausgewählt ist

### **Fehler beim Speichern**
- Prüfen Sie Schreibrechte im Verzeichnis
- Stellen Sie sicher, dass `gui_template.ahk` vorhanden ist

### **GroupBox-Artefakte**
- GroupBox-Titel werden automatisch nach dem Drag gesetzt
- Leere Titel während des Ziehens verhindern Artefakte

## Entwicklung

### **Hinzufügen neuer Controls**
1. Button in der Werkzeugleiste hinzufügen
2. Select-Funktion erstellen
3. Control-Erstellung im LButton-Handler hinzufügen
4. Speicher-Logik erweitern

### **Template anpassen**
- `gui_template.ahk` enthält das Grundgerüst
- Controls werden an `; --- Hier werden die Controls eingefügt` eingefügt

## Lizenz

Dieses Projekt steht unter der MIT-Lizenz.

## Beitragen

1. Fork erstellen
2. Feature-Branch erstellen (`git checkout -b feature/AmazingFeature`)
3. Änderungen committen (`git commit -m 'Add some AmazingFeature'`)
4. Branch pushen (`git push origin feature/AmazingFeature`)
5. Pull Request erstellen

## Changelog

### v2.0
- Komplett für AutoHotkey v2 umgeschrieben
- Neue Control-Typen hinzugefügt
- Verbesserte Drag & Drop Funktionalität
- Template-basiertes Speichern
- Arbeitsfläche mit sichtbarem Rahmen
- Korrekte Control-Namensgebung ohne Konflikte 