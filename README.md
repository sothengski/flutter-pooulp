# Pooulp Flutter

A comprehensive job matching platform built with Flutter that connects students with enterprises, enabling seamless job discovery, application, and communication.

## 📱 Overview

Pooulp is a mobile application designed to bridge the gap between students seeking job opportunities and enterprises looking for talent. The platform provides a complete ecosystem for job matching, profile management, and communication.

## ✨ Key Features

### 🔐 Authentication & Security
- **User Registration & Login**: Email/password authentication
- **Social Authentication**: Google Sign-In and LinkedIn Login
- **Password Management**: Forgot password functionality
- **Secure Storage**: Keychain-based credential storage

### 👤 User Profiles
- **Student Profiles**: Comprehensive profile management with:
  - Personal information
  - Skills (Soft skills & Hard skills)
  - Education history
  - Work experience (Professional & Personal)
  - Achievements
  - Certificates
  - Language proficiency
  - Availability schedules
- **Enterprise Profiles**: Company profiles with detailed information

### 💼 Job Offers
- **Job Discovery**: Browse and search job offers
- **Offer Feed**: Personalized feed of available positions
- **Offer Details**: Comprehensive job offer information including:
  - Job descriptions
  - Requirements (skills, languages, fields)
  - Company information
  - Application status tracking
- **Offer Management**: Save, apply, and track job offers
- **Filtering & Search**: Advanced filtering by:
  - Job types (Internship, Study subject, Student job, Job)
  - Fields (IT, Business, Science, Arts, etc.)
  - Location (with Google Places integration)
  - Skills and languages

### 💬 Messaging
- **Real-time Chat**: Direct messaging between students and enterprises
- **Room Management**: Organized conversation rooms
- **Message History**: Persistent chat history

### 🎓 Profile Building
- **Education Management**: Add and manage educational background
- **Experience Tracking**: Record professional and personal experiences
- **Skills Portfolio**: 
  - Soft skills (Communication, Leadership, Problem-solving, etc.)
  - Hard skills (Programming, Design, Marketing, etc.)
- **Achievements**: Showcase accomplishments
- **Certificates**: Manage professional certifications
- **Language Proficiency**: Track spoken and written language levels
- **Availability Schedules**: Set weekly availability with time slots

### 🌍 Internationalization
- **Multi-language Support**: English, French, and Dutch
- **Dynamic Language Switching**: Change language on the fly
- **Localized Content**: All UI elements and content translated

### 🎨 User Experience
- **Onboarding Flow**: Guided setup for new users
- **Dark/Light Theme**: Theme customization
- **Responsive Design**: Optimized for various screen sizes
- **Shimmer Loading**: Elegant loading states
- **Deep Linking**: Firebase Dynamic Links integration
- **Share Functionality**: Share job offers and profiles

### 📄 Additional Features
- **CV Generation**: Generate PDF resumes from profile data
- **YouTube Integration**: Video content support
- **Image Management**: Profile pictures and image uploads
- **Address Search**: Google Places API integration
- **Settings**: App preferences and account management

## 📸 Screenshots

### 🔐 Authentication & Onboarding

<div align="center">
  <img src="screenshots/Login-Page.png" width="200" alt="Login Page" />
  <img src="screenshots/Onboarding-Page.png" width="200" alt="Onboarding Page" />
  <img src="screenshots/splash-screen.png" width="200" alt="Splash Screen" />
</div>

### 💼 Job Discovery & Offers

<div align="center">
  <img src="screenshots/Feed-Page.png" width="200" alt="Feed Page" />
  <img src="screenshots/Feed-Page-1.png" width="200" alt="Feed Page 1" />
  <img src="screenshots/Feed-Page-2.png" width="200" alt="Feed Page 2" />
</div>

<div align="center">
  <img src="screenshots/Job-detail-Page.png" width="200" alt="Job Detail Page" />
  <img src="screenshots/Job-detail-Page-1.png" width="200" alt="Job Detail Page 1" />
  <img src="screenshots/Search-Preferences.png" width="200" alt="Search Preferences" />
</div>

<div align="center">
  <img src="screenshots/MyOffers-Page-Matched.png" width="200" alt="My Offers - Matched" />
  <img src="screenshots/MyOffers-Page-Matched1.png" width="200" alt="My Offers - Matched 1" />
  <img src="screenshots/MyOffers-Page-Pending.png" width="200" alt="My Offers - Pending" />
</div>

### 👤 Profile Management

<div align="center">
  <img src="screenshots/Profile-Page.png" width="200" alt="Profile Page" />
  <img src="screenshots/Profile-Page-1.png" width="200" alt="Profile Page 1" />
  <img src="screenshots/Profile-Page-2.png" width="200" alt="Profile Page 2" />
</div>

<div align="center">
  <img src="screenshots/Profile-Page-3.png" width="200" alt="Profile Page 3" />
  <img src="screenshots/Profile-Page-4.png" width="200" alt="Profile Page 4" />
  <img src="screenshots/Profile-Edit-Info-Page.png" width="200" alt="Profile Edit Info Page" />
</div>

### 🎓 Profile Building Features

<div align="center">
  <img src="screenshots/Education-Add-Page.png" width="200" alt="Education Add Page" />
  <img src="screenshots/Education-Add-Page-1.png" width="200" alt="Education Add Page 1" />
  <img src="screenshots/Experience-Add-Page.png" width="200" alt="Experience Add Page" />
</div>

<div align="center">
  <img src="screenshots/Experience-Add-Page-1.png" width="200" alt="Experience Add Page 1" />
  <img src="screenshots/Achievement-Add-Page.png" width="200" alt="Achievement Add Page" />
  <img src="screenshots/Achievement-Add-Page-1.png" width="200" alt="Achievement Add Page 1" />
</div>

<div align="center">
  <img src="screenshots/Skill-Add-Page.png" width="200" alt="Skill Add Page" />
  <img src="screenshots/Skill-Add-Page-1.png" width="200" alt="Skill Add Page 1" />
  <img src="screenshots/Language-Add-Page.png" width="200" alt="Language Add Page" />
</div>

### 💬 Messaging & Communication

<div align="center">
  <img src="screenshots/Messaging-Page.png" width="200" alt="Messaging Page" />
  <img src="screenshots/Messaging-Page-1.png" width="200" alt="Messaging Page 1" />
  <img src="screenshots/Chatting-Page.png" width="200" alt="Chatting Page" />
</div>

### 🔍 Additional Views

<div align="center">
  <img src="screenshots/Feed-And-Profile-Page.png" width="200" alt="Feed And Profile Page" />
  <img src="screenshots/Search-Preferences-1.png" width="200" alt="Search Preferences 1" />
  <img src="screenshots/Promotion-popup.png" width="200" alt="Promotion Popup" />
</div>

## 🛠 Tech Stack

### Core Framework
- **Flutter**: ^3.10.0
- **Dart**: SDK ^3.10.0

### State Management
- **GetX**: ^4.6.6 - State management, dependency injection, and routing

### Backend & Storage
- **Firebase Core**: ^3.15.2
- **Firebase Dynamic Links**: ^6.1.10
- **Get Storage**: ^2.1.1 - Local storage
- **HTTP**: ^1.6.0 - API communication

### UI & Design
- **Material Design**: Custom theming
- **Shimmer**: ^3.0.0 - Loading animations
- **Flutter SVG**: ^2.2.3 - SVG support
- **Cached Network Image**: ^3.2.0 - Image caching

### Authentication
- **Google Sign-In**: ^7.2.0
- **LinkedIn Login**: ^3.1.3
- **Flutter Keychain**: ^2.2.1 - Secure storage

### Media & Files
- **Image Picker**: ^1.2.1
- **Image Cropper**: ^11.0.0
- **PDF**: ^3.8.0 - PDF generation
- **Printing**: ^5.9.0
- **YouTube Player**: ^5.2.0

### Utilities
- **Connectivity Plus**: ^7.0.0 - Network status
- **URL Launcher**: ^6.1.5
- **Share Plus**: ^12.0.1
- **UUID**: ^4.5.2
- **Intl**: ^0.20.2 - Internationalization
- **Date Time Picker**: ^2.1.0

## 📁 Project Structure

```
lib/
├── core/                 # Core functionality
│   ├── constants/       # App constants
│   ├── themes/          # Theme configuration
│   ├── utils/           # Utility functions
│   └── widgets/         # Reusable widgets
├── data/                # Data layer
│   ├── models/          # Data models
│   ├── providers/       # API providers
│   │   └── fake/       # Fake providers for testing
│   ├── repositories/    # Data repositories
│   └── services/        # Business services
├── modules/             # Feature modules
│   ├── auth/           # Authentication
│   ├── profile/        # User profiles
│   ├── offer/          # Job offers
│   ├── messaging/      # Chat functionality
│   ├── skill/          # Skills management
│   ├── education/      # Education management
│   ├── experience/     # Experience tracking
│   ├── achievement/    # Achievements
│   ├── certificate/    # Certificates
│   ├── language_usage/ # Language proficiency
│   ├── availability/   # Availability schedules
│   ├── onboarding/    # Onboarding flow
│   ├── setting/        # Settings
│   └── home/           # Home screen
└── routes/             # Navigation routes
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK ^3.10.0
- Dart SDK ^3.10.0
- Android Studio / VS Code
- iOS development: Xcode (for iOS builds)
- Firebase account (for Firebase services)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/sothengski/flutter-pooulp.git
   cd flutter-pooulp
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Add your `google-services.json` to `android/app/`
   - Add your `GoogleService-Info.plist` to `ios/Runner/`

4. **Run the app**
   ```bash
   flutter run
   ```

### Platform-Specific Setup

#### Android
- Minimum SDK: 24
- Target SDK: 33
- Gradle: 8.11
- Android Gradle Plugin: 8.0.2

#### iOS
- Minimum iOS: 13.0
- Configure deep linking in `Info.plist`

## 🧪 Testing

The project includes fake data providers for local testing:
- `FakeAuthProvider` - Mock authentication
- `FakeUserInfoProvider` - Mock user data
- `FakeTagProvider` - Mock tags and categories
- `FakeOfferProvider` - Mock job offers

## 📝 Configuration

### Environment Variables
- API endpoints configured in `lib/data/providers/api.dart`
- Local storage keys in `lib/core/constants/`

### Localization
- Translation files located in `assets/data/`
- Supported languages: English (en), French (fr), Dutch (nl)

## 🔧 Development

### Code Style
- Follows Flutter/Dart style guidelines
- Uses `flutter_lints` for code quality

### State Management
- GetX for state management, dependency injection, and routing
- Reactive programming with RxDart patterns

## 📄 License

This project is proprietary software.

## 👥 Contributing

This is a private project. For contributions, please contact the project maintainers.

## 📞 Support

For issues and questions, please contact the development team.

---

**Version**: 1.0.17+21  
**Last Updated**: 2025
