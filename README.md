# 📱 CineVerse

**CineVerse** is a cutting-edge Flutter application for discovering and browsing movies using The Movie Database (TMDB) APIs. Built with clean architecture principles, it delivers a smooth, responsive experience with offline support, local caching, and polished visuals.

## 📹 Demo

[Watch the CineVerse Demo Video/Images (Google Drive)](https://drive.google.com/file/d/1JTdiMW_bT5rAPdo4YcjiRUtjsHtLehb-/view?usp=drive_link)

---

---

## 🚀 Features

- 🎬 Explore popular and top-rated movies
- 🔍 Debounced search for instant results
- 📂 Offline support with ObjectBox caching
- 🎭 Detailed movie pages with cast, genres, and ratings
- 🔄 Lazy loading with skeleton animations
- 📱 Fully responsive UI with adaptive scaling
- 🌐 Multilingual and RTL support
- 🔐 TMDB session stored securely
- 🧠 Custom platform channel for native device info
- ❤️ Favorites and Watchlist management
- 🎭 Genre-based filtering for easy discovery
- 🌓 Dark mode toggle for comfortable viewing

---

## 🧱 Architecture

CineVerse follows a **Clean Architecture** approach using a feature-first structure:

```
lib/
├── core/             # Core utilities, config, services
├── data/             # Data sources, models, repositories
├── di/               # Dependency injection
├── features/         # UI & business logic per feature
├── l10n/             # Localization
├── theme/            # Theming and design constants
├── widget/           # Shared reusable widgets
└── main.dart         # Entry point
```

**Layers**:
- **Presentation**: Cubits, Screens, Widgets
- **Domain**: Use cases and entities (if needed)
- **Data**: Remote/local sources, models, repositories

---

## 📦 Packages Used

| Category | Packages |
|---------|----------|
| State Management | flutter_bloc, equatable |
| Dependency Injection | get_it, injectable |
| Networking | dio, retrofit, flutter_dotenv |
| JSON Parsing | json_annotation, json_serializable |
| Persistence | objectbox, flutter_secure_storage, shared_preferences |
| UI/UX | flutter_screenutil, skeletonizer, cached_network_image, animated_splash_screen, linear_progress_bar, custom_rating_bar |
| Fonts & Icons | google_fonts, font_awesome_flutter |
| Localization | flutter_localization, intl |
| Utilities | easy_debounce |

---

## 🧠 Caching Strategy

- **ObjectBox** for local data persistence
- Cache entries expire after **30 seconds**
- App reads from cache first, then updates if needed
- Smooth offline experience

---

## 🔐 TMDB Authentication

- API key and base URL managed via `.env`
- TMDB sessions stored securely using `flutter_secure_storage`

---

## 📡 API Layer

- Built with **Dio** and **Retrofit**
- Typed API definitions with codegen
- Includes interceptors (auth, cache) and error handling

---

## 🌐 Localization

- Localized via `flutter_localization` and `.arb` files
- RTL layout support

---

## 🧭 Platform Integration

Custom platform channel to access native device data:
- 📱 Device model
- ⚙️ OS version
- 🔋 Battery level
- 💾 Storage capacity

Available under **Profile Settings > Device Information**.

---

## 🛠 Setup Instructions

### ✅ Prerequisites
- Flutter 3.7.2+
- Dart 3+

### 🔧 Environment Setup

Create a `.env` file in the root directory:
```
TMDB_API_KEY=your_tmdb_api_key
TMDB_BEARER_TOKEN=your_tmdb_bearer_token
```

### 🔨 Build & Run

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

---

## 💡 Roadmap

- [ ] Enhanced user profiles
- [ ] Movie recommendations
- [ ] Social sharing features
- [ ] Expand test coverage

---

## 👨‍💻 Author

**Fahad** – [Self-taught Flutter developer](https://github.com/) passionate about crafting beautiful, high-performance apps.

---

## 📜 License

This project is licensed under the MIT License.
