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
```

### 2. Install dependencies
```bash
flutter pub get`
```

### 3. Run the app
```bash
flutter run
```

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

### Screenshots

#### 1. Show All Article

![1746982224069](https://github.com/user-attachments/assets/4d8f46a4-e88e-4d72-a9ee-deaf7e756307)

#### 2. Article Information

![1746982224066](https://github.com/user-attachments/assets/199f5053-b81e-4c2f-bedb-a98b37bf91a1)

#### 3. Favourite Article

![1746982224063](https://github.com/user-attachments/assets/9e05f3fc-06a8-433e-b665-e068c4d5996b)

#### 4. Search Article

![1746982224059](https://github.com/user-attachments/assets/987e4892-3a34-4946-a0f7-be127096bffb)


