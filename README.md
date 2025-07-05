# GUI-Builder v2.0

A visual GUI builder for AutoHotkey v2 that allows you to create GUIs using drag and drop.

## Features

### 🎨 **Visual Editor**
- Drag & Drop interface for all AHK v2 controls
- Live preview during dragging
- Real-time size display
- Work area with visible frame

### 📦 **Supported Controls**
- **Button** - Buttons
- **Edit** - Text input fields
- **Text** - Static text
- **Checkbox** - Checkboxes
- **Radio** - Radio buttons
- **ListBox** - List boxes
- **DropDownList** - Dropdown lists
- **ComboBox** - Combo boxes
- **Slider** - Sliders
- **Progress** - Progress bars
- **GroupBox** - Grouping frames
- **Hotkey** - Hotkey input fields
- **DateTime** - Date/Time picker
- **MonthCal** - Month calendar
- **UpDown** - Up/Down controls
- **Picture** - Image display

### 🎯 **GUI Sizes**
- Predefined sizes: 800x600, 1024x768, 1280x720, 1366x768, 1440x900, 1600x900, 1920x1080, 2560x1440, 3840x2160
- Custom sizes possible
- Automatic GUI adjustment

### 💾 **Export**
- Saves as complete AHK v2 files
- Uses template-based generation
- UTF-8 encoding for correct character display

## Installation

1. **Install AutoHotkey v2**
   - Download from [autohotkey.com](https://www.autohotkey.com/)
   - Version 2.0 or higher required

2. **Clone repository**
   ```bash
   git clone [repository-url]
   cd ahk2_projekte
   ```

3. **Start GUI Builder**
   ```bash
   gui_builder_v2.ahk
   ```

## Usage

### 1. **Add Control**
- Click on the desired control type in the toolbar
- Drag in the work area to determine size and position
- Release the mouse button to create the control

### 2. **Edit Control**
- Drag the edges to change the size
- All controls are still movable after creation

### 3. **Save GUI**
- Click "Speichern" (Save) in the toolbar
- The GUI will be saved as `cool.ahk`
- The file is immediately executable

### 4. **Delete All Controls**
- Click "Alle löschen" (Delete All) to start over

## File Structure

```
ahk2_projekte/
├── gui_builder_v2.ahk    # Main program
├── gui_template.ahk      # Template for saved GUIs
├── cool.ahk             # Output file (created)
├── icons/               # Icon folder (optional)
└── README.md            # This file
```

## Technical Details

### **Control Naming**
- Buttons: `Button20`, `Button21`, ...
- GroupBox: `Button20`, `Button21`, ... (internally named as Button)
- Edit: `Edit1`, `Edit2`, ...
- Text: `Text1`, `Text2`, ...
- etc.

### **Work Area**
- Standard: 780x570 pixels
- Adjustable via ComboBox
- Automatic GUI size adjustment

### **Hotkeys**
- `LButton`: Create/drag control
- Only active when control type is selected

## Troubleshooting

### **Control not created**
- Make sure you click in the work area
- Check if the desired control type is selected

### **Error when saving**
- Check write permissions in the directory
- Make sure `gui_template.ahk` exists

### **GroupBox artifacts**
- GroupBox titles are automatically set after dragging
- Empty titles during dragging prevent artifacts

## Development

### **Adding new controls**
1. Add button to toolbar
2. Create Select function
3. Add control creation in LButton handler
4. Extend save logic

### **Customizing template**
- `gui_template.ahk` contains the basic structure
- Controls are inserted at `; --- Hier werden die Controls eingefügt`

## License

This project is licensed under the MIT License.

## Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Create Pull Request

## Changelog

### v2.0
- Completely rewritten for AutoHotkey v2
- New control types added
- Improved drag & drop functionality
- Template-based saving
- Work area with visible frame
- Correct control naming without conflicts 