---

````markdown
# 🛍️ Web Store

A simple and responsive E-Commerce simulation built with **Flutter**.

This project demonstrates a clean architecture using providers, API integration, and persistent theme preferences.

---

## 🚀 Features

- 🌐 **Product API Integration**  
  Fetches product data from a remote REST API.

- 🎨 **Light & Dark Theme Support**  
  Theme mode is persisted using `SharedPreferences`.

- 📱 **Responsive UI**  
  Adapts to different screen sizes with a clean and modern layout.

- 🧩 **State Management**  
  Uses the `provider` package for managing global app state.

---

## 📦 Dependencies

- [`flutter`](https://flutter.dev)
- [`provider`](https://pub.dev/packages/provider)
- [`shared_preferences`](https://pub.dev/packages/shared_preferences)
- [`http`](https://pub.dev/packages/http)

---

## 🛠️ Getting Started

1. **Clone the repository**  
   ```bash
   git clone https://github.com/Gsdagustavo/web_store.git
   cd web_store
````

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the project**

   ```bash
   flutter run
   ```

---

## 📁 Project Structure

```
lib/
├── constants/           # App-wide constants (colors, strings, keys)
├── controller/          # State management (e.g., theme provider)
├── model/               # Data models
├── service/             # API services
├── view/                # UI (pages, widgets)
└── main.dart            # Entry point
```

---

## ⚠️ Notes

* Make sure your Android NDK version is **27.0.12077973** or higher to avoid build issues with some plugins.
* This is a basic simulation — no real payment integration or user authentication is included.