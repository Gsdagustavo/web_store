
# 🛍️ Web Store

**Web Store** is a Flutter-based e-commerce simulation app that demonstrates clean architecture, REST API integration, and persistent local storage. It includes essential shopping features such as user login, theming, and product browsing — ideal for learning or showcasing Flutter capabilities.

## ✨ Features

- 🔐 **User Authentication with Token**  
  Login via credentials using a remote API (DummyJSON).  
  Token is stored securely using `SharedPreferences`, with session persistence and secure logout.

- 👤 **User Profile**  
  Displays the authenticated user’s name, email, and profile image.  
  Automatically loads the session if the token is still valid.

- 🛍️ **Product API Integration**  
  Fetches real-time product data from a public REST API.  
  Includes graceful loading states and error handling.

- 🎨 **Light & Dark Theme Support**  
  Easily switch between light and dark themes.  
  Preferences are saved locally for a consistent user experience.

- 📱 **Responsive UI**  
  Optimized for different screen sizes using a clean, modern layout.

- 🧩 **State Management**  
  Powered by the `provider` package for efficient and scalable app state handling.

---

## 📦 Dependencies

- [`flutter`](https://flutter.dev)
- [`provider`](https://pub.dev/packages/provider)
- [`shared_preferences`](https://pub.dev/packages/shared_preferences)
- [`http`](https://pub.dev/packages/http)

---

## 🚀 Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/Gsdagustavo/web_store.git
   cd web_store

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**

   ```bash
   flutter run
   ```

---

## 📁 Project Structure

```
lib/
├── constants/           # Global constants (e.g., URLs, theme settings)
├── controller/          # Providers and state controllers
├── model/               # App data models
├── view/                # UI components and screens
└── main.dart            # Application entry point
```

---

## ⚠️ Notes

* Ensure your Android NDK version is **27.0.12077973** or higher to avoid build issues.
* This app is a simulation — no real payment system or production-grade authentication is included.
* API used: [DummyJSON](https://dummyjson.com/)

---

## 💡 Future Improvements

* 🧾 Shopping cart functionality
* 🛒 Product search and filters
* 🔒 Token expiration and refresh logic
* 📦 Integration with real payment gateways
* 🌍 Internationalization (i18n) and localization support

---

## 📸 Screenshots

*Coming soon...*

---

## 🧑‍💻 Author

**Gustavo Daniel**
📘 Flutter Developer | 💻 Software Analyst | 🛡️ Aspiring Cybersecurity Specialist
📧 Contact: [LinkedIn](https://www.linkedin.com/in/gustavo-daniel-b00756279/)

---

## 📜 License

This project is open-source and available under the [MIT License](LICENSE).