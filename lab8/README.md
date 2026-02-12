# Flutter Material Components & Navigation

[![Flutter Version](https://img.shields.io/badge/Flutter-3.38.6+-blue.svg)](https://flutter.dev/)
[![Dart Version](https://img.shields.io/badge/Dart-3.0+-blue.svg)](https://dart.dev/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

---

**ชื่อนักศึกษา**: ธนกร ผดุงศิลป์  
**รหัสนักศึกษา**: 67543210030-2

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


## Features หลัก

### 1. Material Components

|                    Preview                    | Component Details                                                                                                                                  |
| :-------------------------------------------: | :------------------------------------------------------------------------------------------------------------------------------------------------- |
|<img alt="1" src="https://github.com/user-attachments/assets/86b870ab-22fa-42ec-a689-27a6ff32b474" width="100">   | **1. Navigation (หน้า 1)**<br>• AppBar<br>• Card<br>• Icon<br>• Navigation Menu |
|<img alt="2" src="https://github.com/user-attachments/assets/e30ad462-4d88-44de-a06d-c9543dd71cf9" width="100">   | **2. Actions (หน้า 2)**<br>• ElevatedButton<br>• OutlinedButton<br>• TextButton<br>• IconButton<br>• FAB |
|<img alt="3" src="https://github.com/user-attachments/assets/8d3c3f3f-a2f5-4c35-8797-48305d2675ed" width="100">   | **3. Communication (หน้า 3)**<br>• SnackBar<br>• AlertDialog<br>• SimpleDialog<br>• ModalBottomSheet |
|<img alt="4" src="https://github.com/user-attachments/assets/d3fedec3-288a-4351-9d43-e8bd6a30ed0a" width="100">   | **4. Containment (หน้า 4)**<br>• Card (พร้อม elevation)<br>• Container (พร้อม gradient & shadow)<br>• ListTile<br>• CircleAvatar |
|<img alt="5" src="https://github.com/user-attachments/assets/620b0a9b-590c-4ebf-aad4-6b2162f4d001" width="100">   | **5. Selection (หน้า 5)**<br>• Checkbox / CheckboxListTile<br>• Switch / SwitchListTile<br>• Radio / RadioListTile<br>• FilterChip<br>• Chip |
|<img alt="6" src="https://github.com/user-attachments/assets/6a57bb54-da16-4cde-a72c-8752c614900a" width="100">   | **6. Text Inputs (หน้า 6)**<br>• TextField<br>• TextFormField<br>• Form Validation<br>• Password Field (พร้อม show/hide) <br>• MultilineTextField |

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
