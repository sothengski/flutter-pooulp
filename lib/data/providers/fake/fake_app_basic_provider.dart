import 'dart:async';

import '../../data.dart';

/// Fake AppBasicProvider that mimics the real AppBasicProvider interface
/// without requiring a backend connection.
///
/// Best practices:
/// 1. Match the exact method signatures from the real provider
/// 2. Use Future.delayed to simulate network latency
/// 3. Return properly structured mock data using model classes
/// 4. Handle error cases appropriately
/// 5. Make it easy to switch between real and fake providers
class FakeAppBasicProvider implements IAppBasicProvider {
  // Simulated network delay (adjust as needed)
  static const Duration _networkDelay = Duration(milliseconds: 500);

  /// Fake getAppBasicStatus API that returns mock app status data
  /// Matches: AppBasicProvider.getAppBasicStatus()
  @override
  Future<AppBasicModel> getAppBasicStatus() async {
    // Simulate network delay
    await Future.delayed(_networkDelay);

    // Return mock app basic status response
    return AppBasicModel.fromJson({
      'status': 'active',
      'version': '1.0.0',
      'enterprises': 150,
      'offers': 500,
      'matchings': 1200,
      'latestTranslationUpdate': DateTime.now().toIso8601String(),
    });
  }

  /// Fake getAllTranslationLangs API that returns mock translation data
  /// Matches: AppBasicProvider.getAllTranslationLangs()
  @override
  Future<JsonResponse> getAllTranslationLangs({required String? lang}) async {
    // Simulate network delay
    await Future.delayed(_networkDelay);

    // Validate language parameter (optional)
    if (lang == null || lang.isEmpty) {
      return const JsonResponse(
        status: 400,
        message: 'Language parameter is required',
        data: {'error': 'Language parameter is required'},
      );
    }

    // Supported languages: en, fr, nl
    final supportedLangs = ['en', 'fr', 'nl'];
    if (!supportedLangs.contains(lang.toLowerCase())) {
      return const JsonResponse(
        status: 400,
        message: 'Unsupported language',
        data: {'error': 'Unsupported language'},
      );
    }

    // Return mock translation data based on language
    final translationData = _getMockTranslationData(lang.toLowerCase());

    return JsonResponse(
      success: true,
      status: 200,
      message: 'OK',
      data: translationData,
    );
  }

  /// Helper method to generate mock translation data for different languages
  Map<String, dynamic> _getMockTranslationData(String lang) {
    switch (lang) {
      case 'en':
        return {
          'app_name': 'Pooulp',
          'welcome': 'Welcome',
          'login': 'Login',
          'sign_up': 'Sign Up',
          'email': 'Email',
          'password': 'Password',
          'forgot_password': 'Forgot Password?',
          'logout': 'Logout',
          'profile': 'Profile',
          'settings': 'Settings',
          'save': 'Save',
          'cancel': 'Cancel',
          'success': 'Success',
          'error': 'Error',
          'loading': 'Loading...',
          'no_data': 'No data available',
        };
      case 'fr':
        return {
          'app_name': 'Pooulp',
          'welcome': 'Bienvenue',
          'login': 'Connexion',
          'sign_up': "S'inscrire",
          'email': 'E-mail',
          'password': 'Mot de passe',
          'forgot_password': 'Mot de passe oublié?',
          'logout': 'Déconnexion',
          'profile': 'Profil',
          'settings': 'Paramètres',
          'save': 'Enregistrer',
          'cancel': 'Annuler',
          'success': 'Succès',
          'error': 'Erreur',
          'loading': 'Chargement...',
          'no_data': 'Aucune donnée disponible',
        };
      case 'nl':
        return {
          'app_name': 'Pooulp',
          'welcome': 'Welkom',
          'login': 'Inloggen',
          'sign_up': 'Registreren',
          'email': 'E-mail',
          'password': 'Wachtwoord',
          'forgot_password': 'Wachtwoord vergeten?',
          'logout': 'Uitloggen',
          'profile': 'Profiel',
          'settings': 'Instellingen',
          'save': 'Opslaan',
          'cancel': 'Annuleren',
          'success': 'Succes',
          'error': 'Fout',
          'loading': 'Laden...',
          'no_data': 'Geen gegevens beschikbaar',
        };
      default:
        return {
          'app_name': 'Pooulp',
          'welcome': 'Welcome',
          'login': 'Login',
          'sign_up': 'Sign Up',
        };
    }
  }
}
