import 'dart:async';

import '../../data.dart';

/// Fake StudentProvider that mimics the real StudentProvider interface
/// without requiring a backend connection.
///
/// Best practices:
/// 1. Match the exact method signatures from the real provider
/// 2. Use Future.delayed to simulate network latency
/// 3. Return properly structured mock data using model classes
/// 4. Handle error cases appropriately
/// 5. Make it easy to switch between real and fake providers
class FakeStudentProvider implements IStudentProvider {
  // Simulated network delay (adjust as needed)
  static const Duration _networkDelay = Duration(milliseconds: 500);

  //===== Education Section =====//

  /// Fake postStudentEducation API that simulates adding education
  /// Matches: StudentProvider.postStudentEducation()
  @override
  Future<JsonResponse> postStudentEducation({
    EducationModel? educationData,
  }) async {
    await Future.delayed(_networkDelay);

    if (educationData == null) {
      return const JsonResponse(
        status: 400,
        message: 'Education data is required',
        data: {'error': 'Education data is required'},
      );
    }

    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Education added successfully',
      data: {'message': 'Education added successfully', 'id': 1},
    );
  }

  /// Fake putStudentEducation API that simulates updating education
  /// Matches: StudentProvider.putStudentEducation()
  @override
  Future<JsonResponse> putStudentEducation({
    required int? eduId,
    EducationModel? educationData,
  }) async {
    await Future.delayed(_networkDelay);

    if (eduId == null) {
      return const JsonResponse(
        status: 400,
        message: 'Education ID is required',
        data: {'error': 'Education ID is required'},
      );
    }

    if (educationData == null) {
      return const JsonResponse(
        status: 400,
        message: 'Education data is required',
        data: {'error': 'Education data is required'},
      );
    }

    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Education updated successfully',
      data: {'message': 'Education updated successfully'},
    );
  }

  /// Fake deleteStudentEducation API that simulates deleting education
  /// Matches: StudentProvider.deleteStudentEducation()
  @override
  Future<JsonResponse> deleteStudentEducation({required int? eduId}) async {
    await Future.delayed(_networkDelay);

    if (eduId == null) {
      return const JsonResponse(
        status: 400,
        message: 'Education ID is required',
        data: {'error': 'Education ID is required'},
      );
    }

    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Education deleted successfully',
      data: {'message': 'Education deleted successfully'},
    );
  }

  //===== Experience Section =====//

  /// Fake postStudentExperience API that simulates adding experience
  /// Matches: StudentProvider.postStudentExperience()
  @override
  Future<JsonResponse> postStudentExperience({
    ExperienceModel? experienceData,
  }) async {
    await Future.delayed(_networkDelay);

    if (experienceData == null) {
      return const JsonResponse(
        status: 400,
        message: 'Experience data is required',
        data: {'error': 'Experience data is required'},
      );
    }

    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Experience added successfully',
      data: {'message': 'Experience added successfully', 'id': 1},
    );
  }

  /// Fake putStudentExperience API that simulates updating experience
  /// Matches: StudentProvider.putStudentExperience()
  @override
  Future<JsonResponse> putStudentExperience({
    required int? expId,
    ExperienceModel? experienceData,
  }) async {
    await Future.delayed(_networkDelay);

    if (expId == null) {
      return const JsonResponse(
        status: 400,
        message: 'Experience ID is required',
        data: {'error': 'Experience ID is required'},
      );
    }

    if (experienceData == null) {
      return const JsonResponse(
        status: 400,
        message: 'Experience data is required',
        data: {'error': 'Experience data is required'},
      );
    }

    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Experience updated successfully',
      data: {'message': 'Experience updated successfully'},
    );
  }

  /// Fake deleteStudentExperience API that simulates deleting experience
  /// Matches: StudentProvider.deleteStudentExperience()
  @override
  Future<JsonResponse> deleteStudentExperience({required int? expId}) async {
    await Future.delayed(_networkDelay);

    if (expId == null) {
      return const JsonResponse(
        status: 400,
        message: 'Experience ID is required',
        data: {'error': 'Experience ID is required'},
      );
    }

    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Experience deleted successfully',
      data: {'message': 'Experience deleted successfully'},
    );
  }

  //===== Achievement Section =====//

  /// Fake postStudentAchievement API that simulates adding achievement
  /// Matches: StudentProvider.postStudentAchievement()
  @override
  Future<JsonResponse> postStudentAchievement({
    AchievementModel? achievementData,
  }) async {
    await Future.delayed(_networkDelay);

    if (achievementData == null) {
      return const JsonResponse(
        status: 400,
        message: 'Achievement data is required',
        data: {'error': 'Achievement data is required'},
      );
    }

    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Achievement added successfully',
      data: {'message': 'Achievement added successfully', 'id': 1},
    );
  }

  /// Fake putStudentAchievement API that simulates updating achievement
  /// Matches: StudentProvider.putStudentAchievement()
  @override
  Future<JsonResponse> putStudentAchievement({
    required int? achievementId,
    AchievementModel? achievementData,
  }) async {
    await Future.delayed(_networkDelay);

    if (achievementId == null) {
      return const JsonResponse(
        status: 400,
        message: 'Achievement ID is required',
        data: {'error': 'Achievement ID is required'},
      );
    }

    if (achievementData == null) {
      return const JsonResponse(
        status: 400,
        message: 'Achievement data is required',
        data: {'error': 'Achievement data is required'},
      );
    }

    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Achievement updated successfully',
      data: {'message': 'Achievement updated successfully'},
    );
  }

  /// Fake deleteStudentAchievement API that simulates deleting achievement
  /// Matches: StudentProvider.deleteStudentAchievement()
  @override
  Future<JsonResponse> deleteStudentAchievement({
    required int? achievementId,
  }) async {
    await Future.delayed(_networkDelay);

    if (achievementId == null) {
      return const JsonResponse(
        status: 400,
        message: 'Achievement ID is required',
        data: {'error': 'Achievement ID is required'},
      );
    }

    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Achievement deleted successfully',
      data: {'message': 'Achievement deleted successfully'},
    );
  }

  //===== Certificate Section =====//

  /// Fake postStudentCertificate API that simulates adding certificate
  /// Matches: StudentProvider.postStudentCertificate()
  @override
  Future<JsonResponse> postStudentCertificate({
    CertificateModel? certificateData,
  }) async {
    await Future.delayed(_networkDelay);

    if (certificateData == null) {
      return const JsonResponse(
        status: 400,
        message: 'Certificate data is required',
        data: {'error': 'Certificate data is required'},
      );
    }

    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Certificate added successfully',
      data: {'message': 'Certificate added successfully', 'id': 1},
    );
  }

  /// Fake putStudentCertificate API that simulates updating certificate
  /// Matches: StudentProvider.putStudentCertificate()
  @override
  Future<JsonResponse> putStudentCertificate({
    required int? certificateId,
    CertificateModel? certificateData,
  }) async {
    await Future.delayed(_networkDelay);

    if (certificateId == null) {
      return const JsonResponse(
        status: 400,
        message: 'Certificate ID is required',
        data: {'error': 'Certificate ID is required'},
      );
    }

    if (certificateData == null) {
      return const JsonResponse(
        status: 400,
        message: 'Certificate data is required',
        data: {'error': 'Certificate data is required'},
      );
    }

    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Certificate updated successfully',
      data: {'message': 'Certificate updated successfully'},
    );
  }

  /// Fake deleteStudentCertificate API that simulates deleting certificate
  /// Matches: StudentProvider.deleteStudentCertificate()
  @override
  Future<JsonResponse> deleteStudentCertificate({
    required int? certificateId,
  }) async {
    await Future.delayed(_networkDelay);

    if (certificateId == null) {
      return const JsonResponse(
        status: 400,
        message: 'Certificate ID is required',
        data: {'error': 'Certificate ID is required'},
      );
    }

    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Certificate deleted successfully',
      data: {'message': 'Certificate deleted successfully'},
    );
  }

  //===== Spoken Language Section =====//

  /// Fake postStudentSpokenLanguageList API that simulates adding language list
  /// Matches: StudentProvider.postStudentSpokenLanguageList()
  @override
  Future<JsonResponse> postStudentSpokenLanguageList({
    List<FieldModel>? languageListData,
  }) async {
    await Future.delayed(_networkDelay);

    if (languageListData == null || languageListData.isEmpty) {
      return const JsonResponse(
        status: 400,
        message: 'Language list data is required',
        data: {'error': 'Language list data is required'},
      );
    }

    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Languages added successfully',
      data: {'message': 'Languages added successfully'},
    );
  }

  /// Fake postStudentSpokenLanguage API that simulates adding a single language
  /// Matches: StudentProvider.postStudentSpokenLanguage()
  @override
  Future<JsonResponse> postStudentSpokenLanguage({
    required int? languageId,
    FieldModel? languageData,
  }) async {
    await Future.delayed(_networkDelay);

    if (languageId == null) {
      return const JsonResponse(
        status: 400,
        message: 'Language ID is required',
        data: {'error': 'Language ID is required'},
      );
    }

    if (languageData == null) {
      return const JsonResponse(
        status: 400,
        message: 'Language data is required',
        data: {'error': 'Language data is required'},
      );
    }

    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Language added successfully',
      data: {'message': 'Language added successfully', 'id': 1},
    );
  }

  /// Fake putStudentSpokenLanguage API that simulates updating language
  /// Matches: StudentProvider.putStudentSpokenLanguage()
  @override
  Future<JsonResponse> putStudentSpokenLanguage({
    required int? spokenLanguageId,
    FieldModel? spokenLanguageData,
  }) async {
    await Future.delayed(_networkDelay);

    if (spokenLanguageId == null) {
      return const JsonResponse(
        status: 400,
        message: 'Spoken language ID is required',
        data: {'error': 'Spoken language ID is required'},
      );
    }

    if (spokenLanguageData == null) {
      return const JsonResponse(
        status: 400,
        message: 'Spoken language data is required',
        data: {'error': 'Spoken language data is required'},
      );
    }

    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Language updated successfully',
      data: {'message': 'Language updated successfully'},
    );
  }

  /// Fake deleteStudentSpokenLanguage API that simulates deleting language
  /// Matches: StudentProvider.deleteStudentSpokenLanguage()
  @override
  Future<JsonResponse> deleteStudentSpokenLanguage({
    required int? spokenLanguageId,
  }) async {
    await Future.delayed(_networkDelay);

    if (spokenLanguageId == null) {
      return const JsonResponse(
        status: 400,
        message: 'Spoken language ID is required',
        data: {'error': 'Spoken language ID is required'},
      );
    }

    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Language deleted successfully',
      data: {'message': 'Language deleted successfully'},
    );
  }

  //===== Skill Section =====//

  /// Fake postStudentSkillList API that simulates adding skill list
  /// Matches: StudentProvider.postStudentSkillList()
  @override
  Future<JsonResponse> postStudentSkillList({
    List<FieldModel>? skillData,
  }) async {
    await Future.delayed(_networkDelay);

    if (skillData == null || skillData.isEmpty) {
      return const JsonResponse(
        status: 400,
        message: 'Skill data is required',
        data: {'error': 'Skill data is required'},
      );
    }

    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Skills added successfully',
      data: {'message': 'Skills added successfully'},
    );
  }

  /// Fake postStudentSkill API that simulates adding a single skill
  /// Matches: StudentProvider.postStudentSkill()
  @override
  Future<JsonResponse> postStudentSkill({
    required String? skillCategory,
    FieldModel? skillData,
  }) async {
    await Future.delayed(_networkDelay);

    if (skillCategory == null || skillCategory.isEmpty) {
      return const JsonResponse(
        status: 400,
        message: 'Skill category is required',
        data: {'error': 'Skill category is required'},
      );
    }

    if (skillData == null) {
      return const JsonResponse(
        status: 400,
        message: 'Skill data is required',
        data: {'error': 'Skill data is required'},
      );
    }

    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Skill added successfully',
      data: {'message': 'Skill added successfully', 'id': 1},
    );
  }

  /// Fake putStudentSkill API that simulates updating skill
  /// Matches: StudentProvider.putStudentSkill()
  @override
  Future<JsonResponse> putStudentSkill({
    required int? skillId,
    FieldModel? skillData,
  }) async {
    await Future.delayed(_networkDelay);

    if (skillId == null) {
      return const JsonResponse(
        status: 400,
        message: 'Skill ID is required',
        data: {'error': 'Skill ID is required'},
      );
    }

    if (skillData == null) {
      return const JsonResponse(
        status: 400,
        message: 'Skill data is required',
        data: {'error': 'Skill data is required'},
      );
    }

    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Skill updated successfully',
      data: {'message': 'Skill updated successfully'},
    );
  }

  /// Fake deleteStudentSkill API that simulates deleting skill
  /// Matches: StudentProvider.deleteStudentSkill()
  @override
  Future<JsonResponse> deleteStudentSkill({required int? skillId}) async {
    await Future.delayed(_networkDelay);

    if (skillId == null) {
      return const JsonResponse(
        status: 400,
        message: 'Skill ID is required',
        data: {'error': 'Skill ID is required'},
      );
    }

    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Skill deleted successfully',
      data: {'message': 'Skill deleted successfully'},
    );
  }

  //===== Availability Section =====//

  /// Fake postStudentAvailability API that simulates adding availability
  /// Matches: StudentProvider.postStudentAvailability()
  @override
  Future<JsonResponse> postStudentAvailability({
    PeriodModel? availabilityData,
  }) async {
    await Future.delayed(_networkDelay);

    if (availabilityData == null) {
      return const JsonResponse(
        status: 400,
        message: 'Availability data is required',
        data: {'error': 'Availability data is required'},
      );
    }

    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Availability added successfully',
      data: {'message': 'Availability added successfully', 'id': 1},
    );
  }

  /// Fake putStudentAvailability API that simulates updating availability
  /// Matches: StudentProvider.putStudentAvailability()
  @override
  Future<JsonResponse> putStudentAvailability({
    required int? availabilityId,
    PeriodModel? availabilityData,
  }) async {
    await Future.delayed(_networkDelay);

    if (availabilityId == null) {
      return const JsonResponse(
        status: 400,
        message: 'Availability ID is required',
        data: {'error': 'Availability ID is required'},
      );
    }

    if (availabilityData == null) {
      return const JsonResponse(
        status: 400,
        message: 'Availability data is required',
        data: {'error': 'Availability data is required'},
      );
    }

    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Availability updated successfully',
      data: {'message': 'Availability updated successfully'},
    );
  }

  /// Fake deleteStudentAvailability API that simulates deleting availability
  /// Matches: StudentProvider.deleteStudentAvailability()
  @override
  Future<JsonResponse> deleteStudentAvailability({
    required int? availabilityId,
  }) async {
    await Future.delayed(_networkDelay);

    if (availabilityId == null) {
      return const JsonResponse(
        status: 400,
        message: 'Availability ID is required',
        data: {'error': 'Availability ID is required'},
      );
    }

    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Availability deleted successfully',
      data: {'message': 'Availability deleted successfully'},
    );
  }
}
