# Flutter Material Components & Navigation

[![Flutter Version](https://img.shields.io/badge/Flutter-3.38.6+-blue.svg)](https://flutter.dev/)
[![Dart Version](https://img.shields.io/badge/Dart-3.0+-blue.svg)](https://dart.dev/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

---

**ชื่อนักศึกษา**: ธนภัทร นุกูล  
**รหัสนักศึกษา**: 67543210031-0

## คำอธิบายโปรเจค

โปรเจคนี้จัดทำขึ้นเพื่อศึกษาและสาธิต:

1. **Material Components Widgets** - ครบทั้ง 6 หมวดหมู่
2. **Navigation and Routing** - ทั้ง 3 วิธีการ

ตามที่กำหนดในการบ้าน **Mobile Devices Application Design and Development**

---

## วัตถุประสงค์

### ข้อ 1: Material Component Widgets

ศึกษาและใช้งาน Material widgets ใน 6 หมวดหมู่:

- ✅ **Actions** - ปุ่มและการกระทำต่างๆ
- ✅ **Communication** - การสื่อสารกับผู้ใช้
- ✅ **Containment** - การจัดกลุ่มและแสดงเนื้อหา
- ✅ **Navigation** - การนำทางภายใน app
- ✅ **Selection** - การเลือกตัวเลือก
- ✅ **Text Inputs** - การรับข้อมูลจากผู้ใช้

### ข้อ 2: Navigation and Routing

ศึกษาและใช้งาน Navigation ทั้ง 3 วิธี:

- ✅ **Using the Navigator** - Navigator.push() / pop()
- ✅ **Using Named Routes** - Navigator.pushNamed()
- ✅ **Using the Router** - Router API และ go_router

---

## โครงสร้าง App

| หน้าจอ | ชื่อ          | Material Components                | Navigation Method       |
| ------ | ------------- | ---------------------------------- | ----------------------- |
| **1**  | Home Screen   | Navigation, Card, Icon             | Starting Point          |
| **2**  | Actions       | Buttons, FAB, IconButton           | `Navigator.push()`      |
| **3**  | Communication | SnackBar, Dialog, BottomSheet      | `Navigator.pushNamed()` |
| **4**  | Containment   | Card, Container, ListTile, Divider | `Navigator.push()`      |
| **5**  | Selection     | Checkbox, Radio, Switch, Chip      | `Navigator.pushNamed()` |
| **6**  | Text Inputs   | TextField, Form, Validation        | `Navigator.push()`      |

---

## วิธีการติดตั้งและรัน

### ข้อกำหนดเบื้องต้น

- Flutter SDK 3.38.6 หรือสูงกว่า
- Dart SDK 3.0 หรือสูงกว่า
- Android Studio / VS Code
- Android Emulator / iOS Simulator / Physical Device

### ขั้นตอนการติดตั้ง

1. **Clone โปรเจค**

```bash
git clone
cd flutter-material-navigation
```

2. **ติดตั้ง Dependencies**

```bash
flutter pub get
```

3. **ตรวจสอบ Flutter**

```bash
flutter doctor
```

4. **รัน App**

```bash
# รันบน Chrome (Web)
flutter run -d chrome

# รันบน Android
flutter run -d android

# รันบน iOS
flutter run -d ios

# รันแบบ debug mode
flutter run

# รันแบบ release mode
flutter run --release
```

---

## โครงสร้างโปรเจค

```
flutter_material_navigation_demo/
│
├── lib/
│   └── main.dart                      # ไฟล์หลักของ app
│
├── android/                           # Android platform files
├── ios/                               # iOS platform files
├── web/                               # Web platform files
│
├── .gitignore                         # Git ignore file
├── pubspec.yaml                       # Dependencies configuration
├── README.md                          # ไฟล์นี้
└── LICENSE                            # License file
```

---

## Features หลัก

### 1. Material Components

|                    Preview                    | Component Details                                                                                                                                  |
| :-------------------------------------------: | :------------------------------------------------------------------------------------------------------------------------------------------------- |
|  <img src="img/navigation.png" width="180">   | **1. Navigation (หน้า 1)**<br>• AppBar<br>• Card<br>• Icon<br>• Navigation Menu                                                                    |
|    <img src="img/actions.png" width="180">    | **2. Actions (หน้า 2)**<br>• ElevatedButton<br>• OutlinedButton<br>• TextButton<br>• IconButton<br>• FAB                                           |
| <img src="img/communication.png" width="180"> | **3. Communication (หน้า 3)**<br>• SnackBar<br>• AlertDialog<br>• SimpleDialog<br>• ModalBottomSheet                                               |
|   <img src="img/container.png" width="180">   | **4. Containment (หน้า 4)**<br>• Card (พร้อม elevation)<br>• Container (พร้อม gradient & shadow)<br>• ListTile<br>• CircleAvatar                   |
|   <img src="img/selection.png" width="180">   | **5. Selection (หน้า 5)**<br>• Checkbox / CheckboxListTile<br>• Switch / SwitchListTile<br>• Radio / RadioListTile<br>• FilterChip<br>• Chip       |
|   <img src="img/inputtext.png" width="180">   | **6. Text Inputs (หน้า 6)**<br>• TextField<br>• TextFormField<br>• Form Validation<br>• Password Field (พร้อม show/hide) <br>• Multiline TextField |

### 2. Navigation & Routing

#### Using the Navigator

```dart
// Push
Navigator.of(context).push(
  MaterialPageRoute(builder: (context) => SecondScreen()),
);

// Pop
Navigator.of(context).pop();
```

#### Using Named Routes

```dart
// กำหนด routes
routes: {
  '/screen': (context) => Screen(),
}

// Navigate
Navigator.pushNamed(context, '/screen');
```

#### Using the Router

- รองรับ Deep Linking
- Browser History API
- Declarative Routing
- go_router package (อธิบายไว้ใน app)

---
