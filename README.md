# 🍽️ Community Kitchen Management App

## 📌 Overview

The Community Kitchen Management App is a Flutter-based application developed to help community kitchens efficiently manage daily meal distribution, inventory, and meal records. The application provides an easy-to-use interface for recording meals served, tracking food inventory, and viewing reports.

---

## 🎯 Objectives

- Simplify meal record management.
- Track daily food inventory.
- Generate meal reports.
- Reduce manual paperwork.
- Improve operational efficiency.

---

## ✨ Features

### 📊 Dashboard
- Displays an overview of the kitchen.
- Quick access to all modules.
- Statistics cards.

### 🍛 Add Meal Record
- Select meal type.
- Choose serving date.
- Enter meals served.
- Add volunteer name.
- Add notes.
- Save meal records.

### 📋 Records
- View all saved meal records.
- Displays meal details.
- Delete records.

### 📦 Inventory Management
- View available stock.
- Increase stock.
- Reduce stock.
- Low stock indicator.

### 📈 Reports
- Total meals served.
- Breakfast count.
- Lunch count.
- Dinner count.

---

## 🛠️ Technologies Used

- Flutter
- Dart
- Material Design
- In-Memory Storage (Demo Version)

> Note: The current demo uses temporary in-memory storage for browser compatibility. It can be extended to SQLite or Firebase for persistent storage.

---

## 📁 Project Structure

```
lib/
│
├── config/
├── database/
├── models/
│   ├── meal_record.dart
│   └── inventory_item.dart
│
├── services/
│   ├── meal_service.dart
│   └── inventory_service.dart
│
├── screens/
│   ├── dashboard/
│   ├── add_record/
│   ├── records/
│   ├── inventory/
│   └── reports/
│
├── widgets/
└── main.dart
```

---

## 🚀 How to Run

1. Clone the repository.
2. Open the project in Visual Studio Code.
3. Run:

```bash
flutter pub get
flutter run
```

---

## 📸 Application Modules

- Dashboard
- Add Meal
- Meal Records
- Inventory
- Reports

---

## 🔮 Future Enhancements

- User Authentication
- SQLite/Firebase Database
- QR Code Attendance
- PDF Report Generation
- Search & Filter Records
- Notifications
- Cloud Backup

---

## 👨‍💻 Developed Using

- Flutter SDK
- Dart Programming Language
- Visual Studio Code

---

## 📄 License

This project is developed for educational purposes.