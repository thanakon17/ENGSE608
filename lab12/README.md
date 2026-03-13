# lab12

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# 💊 Home Pharma - แอปพลิเคชันคลังยาประจำบ้าน

**Home Pharma** เป็นแอปพลิเคชันที่พัฒนาด้วย **Flutter** เพื่อใช้ในการจัดการสต็อกยาสามัญประจำบ้าน ช่วยให้สมาชิกในครอบครัวสามารถบันทึก แก้ไข และติดตามจำนวนยาคงเหลือได้อย่างมีประสิทธิภาพ พร้อมระบบบันทึกเวลาที่ทำรายการล่าสุด

---

## 📸 ภาพตัวอย่างแอปพลิเคชัน (Screenshots)

| หน้าจอหลัก (แสดงรายการยา) | ระบบเพิ่ม/แก้ไขข้อมูลยา |
|<img width="708" height="1479" alt="Screenshot 2026-03-13 183046" src="https://github.com/user-attachments/assets/97d384db-eada-4ce4-ab41-a70b42cc2d21" />|<img width="707" height="1475" alt="Screenshot 2026-03-13 183100" src="https://github.com/user-attachments/assets/5f6ad346-d30b-4425-bc68-ce2245258374" />|

---

## ✨ คุณสมบัติหลัก (Key Features)

* **📦 การจัดการคลังยา:** สามารถเพิ่ม (Add), แก้ไข (Update) และลบ (Delete) ข้อมูลยาได้ในที่เดียว
* **🕒 ระบบบันทึกเวลาอัตโนมัติ:** ทุกการเพิ่มหรือแก้ไขจะมีการบันทึกวันที่และเวลาปัจจุบัน (Timestamp) แสดงผลใต้ชื่อยา
* **🎨 ระบบหมวดหมู่ด้วยไอคอน:** แยกประเภทของยาได้ชัดเจน 4 หมวดหมู่ (ยาเม็ด, ยาน้ำ, ยาทา, อุปกรณ์ทำแผล) 
* **💾 ฐานข้อมูลภายในเครื่อง:** ข้อมูลถูกเก็บไว้อย่างถาวรด้วย **SQLite (sqflite)** ข้อมูลจะยังคงอยู่แม้ปิดหรือรีสตาร์ทแอป
* **⚡ การจัดการสถานะ (State Management):** ใช้แนวคิด **Provider** เพื่อการอัปเดตข้อมูลบนหน้าจอแบบ Reactive (Real-time)

---

## 🛠 เทคโนโลยีที่ใช้ (Tech Stack)

* **Framework:** Flutter (Dart)
* **State Management:** [Provider](https://pub.dev/packages/provider)
* **Local Database:** [sqflite](https://pub.dev/packages/sqflite) & [path](https://pub.dev/packages/path)
* **Utility Libraries:** * `uuid`: สำหรับสร้างรหัสเฉพาะ (Unique ID) ให้ข้อมูลแต่ละรายการ
    * `intl`: สำหรับจัดการรูปแบบวันที่และเวลา (DateTime Formatting)

---

## 🚀 วิธีการติดตั้งและรันโปรเจกต์

1.  **ติดตั้ง Library ที่จำเป็น:**
    ```bash
    flutter pub get
    ```
2.  **รันแอปพลิเคชัน:**
    ```bash
    flutter run
    ```

---

## 📁 โครงสร้างโปรเจกต์ (Project Structure)

```text
lib/
 ├── helpers/    # DBHelper: ส่วนติดต่อฐานข้อมูล SQLite
 ├── models/     # Medicine Model: นิยามโครงสร้างข้อมูลยา
 ├── providers/  # MedicineProvider: ส่วนจัดการ Logic และ State ของแอป
 ├── screens/    # HomeScreen: หน้าจอ UI และการจัดการ ModalBottomSheet
 └── main.dart   # จุดเริ่มต้นของแอปพลิเคชัน (Main Entry Point)
