# 📰 Flutter Article App

A Flutter app that fetches and displays a list of articles from a public API.

---

### Features
- List of articles
- Search functionality
- Detail view
- Favorite articles with local persistence (bonus feature)
- Pull-to-refresh
- Responsive UI

---

### Setup Instructions

### 1. Clone the repository
```bash
git clone https://github.com/armaan277/BharatNXT_Task.git
cd flutter_article_app

### 2. Install dependencies
```bash
flutter pub get

### 3. Run the app
flutter run


Tech Stack
Flutter SDK: 3.29.3

State Management: Provider
HTTP Client: http
Persistence: shared_preferences
Proper Error Handling : fpdart

### State Management Explanation
This project uses Provider for managing app state such as articles, search filtering, and favorite toggling. The HomeViewModel class extends ChangeNotifier, exposing observable fields to the UI. Updates like toggling favorites or filtering articles through search automatically notify the UI to reflect changes.

### Persistence
Favorite articles are persisted using shared_preferences. When the user marks an article as favorite, its ID is stored locally, and the state is retained even after app restarts.
