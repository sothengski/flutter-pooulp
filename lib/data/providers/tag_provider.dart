import 'dart:convert';

import '../data.dart';

abstract class ITagProvider {
  Future<List<FieldModel>> getJobOfferTypes();
  Future<List<FieldModel>> getAllFields();
  Future<List<FieldModel>> getLanguages();
  Future<List<SchoolModel>> getSchools();
  Future<List<FieldModel>> getExperienceTypes();
  Future<List<FieldModel>> getHardAndSoftSkills();
  Future<List<FieldModel>> getOnlyHardSkills();
  Future<List<FieldModel>> getOnlySoftSkills();
  Future<List<FieldModel>> getAvailabilitiesTags();
  Future<List<FieldModel>> getInternshipTypeTags();
  Future<List<FieldModel>> getInternshipPeriodTags();
}

class TagProvider extends BaseProvider implements ITagProvider {
  @override
  Future<List<FieldModel>> getJobOfferTypes() async {
    try {
      final dataResponse = await get(
        API.paths[Endpoint.getJobOfferTypes].toString(),
      );
      final List<FieldModel> jobOfferTypeList = <FieldModel>[];
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final apiResponse =
            json.decode(dataResponse.bodyString.toString()) as List;
        for (final e in apiResponse) {
          jobOfferTypeList.add(FieldModel.fromJson(e as Map<String, dynamic>));
        }
        return jobOfferTypeList;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<List<FieldModel>> getAllFields() async {
    try {
      final dataResponse = await get(
        API.paths[Endpoint.getFields].toString(),
      );
      final List<FieldModel> jobOfferTypeList = <FieldModel>[];
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final apiResponse =
            json.decode(dataResponse.bodyString.toString()) as List;
        for (final e in apiResponse) {
          jobOfferTypeList.add(FieldModel.fromJson(e as Map<String, dynamic>));
        }
        return jobOfferTypeList;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<List<FieldModel>> getLanguages() async {
    try {
      final dataResponse = await get(
        API.paths[Endpoint.getLanguages].toString(),
      );
      final List<FieldModel> jobOfferTypeList = <FieldModel>[];
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final apiResponse =
            json.decode(dataResponse.bodyString.toString()) as List;
        for (final e in apiResponse) {
          jobOfferTypeList.add(FieldModel.fromJson(e as Map<String, dynamic>));
        }
        return jobOfferTypeList;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<List<SchoolModel>> getSchools() async {
    try {
      final dataResponse = await get(
        API.paths[Endpoint.getSchools].toString(),
      );
      final List<SchoolModel> schoolList = <SchoolModel>[];
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final apiResponse =
            json.decode(dataResponse.bodyString.toString()) as List;
        for (final e in apiResponse) {
          schoolList.add(SchoolModel.fromJson(e as Map<String, dynamic>));
        }
        return schoolList;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<List<FieldModel>> getExperienceTypes() async {
    try {
      final dataResponse = await get(
        API.paths[Endpoint.getExperienceTypes].toString(),
      );
      final List<FieldModel> jobOfferTypeList = <FieldModel>[];
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final apiResponse =
            json.decode(dataResponse.bodyString.toString()) as List;
        for (final e in apiResponse) {
          jobOfferTypeList.add(FieldModel.fromJson(e as Map<String, dynamic>));
        }
        return jobOfferTypeList;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<List<FieldModel>> getHardAndSoftSkills() async {
    try {
      final dataResponse = await get(
        API.paths[Endpoint.getHardAndSoftSkills].toString(),
      );
      final List<FieldModel> hardAndSoftSkillList = <FieldModel>[];
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final apiResponse =
            json.decode(dataResponse.bodyString.toString()) as List;
        for (final e in apiResponse) {
          hardAndSoftSkillList
              .add(FieldModel.fromJson(e as Map<String, dynamic>));
        }
        return hardAndSoftSkillList;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<List<FieldModel>> getOnlyHardSkills() async {
    try {
      final dataResponse = await get(
        API.paths[Endpoint.getOnlyHardSkills].toString(),
      );
      final List<FieldModel> hardSkillList = <FieldModel>[];
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final apiResponse =
            json.decode(dataResponse.bodyString.toString()) as List;
        for (final e in apiResponse) {
          hardSkillList.add(FieldModel.fromJson(e as Map<String, dynamic>));
        }
        return hardSkillList;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<List<FieldModel>> getOnlySoftSkills() async {
    try {
      final dataResponse = await get(
        API.paths[Endpoint.getOnlySoftSkills].toString(),
      );
      final List<FieldModel> softSkillList = <FieldModel>[];
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final apiResponse =
            json.decode(dataResponse.bodyString.toString()) as List;
        for (final e in apiResponse) {
          softSkillList.add(FieldModel.fromJson(e as Map<String, dynamic>));
        }
        return softSkillList;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<List<FieldModel>> getAvailabilitiesTags() async {
    try {
      final dataResponse = await get(
        API.paths[Endpoint.getAvailabilitiesTags].toString(),
      );
      final List<FieldModel> availabilitiesTags = <FieldModel>[];
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final apiResponse =
            json.decode(dataResponse.bodyString.toString()) as List;
        for (final e in apiResponse) {
          availabilitiesTags
              .add(FieldModel.fromJson(e as Map<String, dynamic>));
        }
        return availabilitiesTags;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<List<FieldModel>> getInternshipTypeTags() async {
    try {
      final dataResponse = await get(
        API.paths[Endpoint.getInternshipTypeTags].toString(),
      );
      final List<FieldModel> internshipTypeTags = <FieldModel>[];
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final apiResponse =
            json.decode(dataResponse.bodyString.toString()) as List;
        for (final e in apiResponse) {
          internshipTypeTags
              .add(FieldModel.fromJson(e as Map<String, dynamic>));
        }
        return internshipTypeTags;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<List<FieldModel>> getInternshipPeriodTags() async {
    try {
      final dataResponse = await get(
        API.paths[Endpoint.getInternshipPeriodTags].toString(),
      );
      final List<FieldModel> internshipPeriodTags = <FieldModel>[];
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final apiResponse =
            json.decode(dataResponse.bodyString.toString()) as List;
        for (final e in apiResponse) {
          internshipPeriodTags
              .add(FieldModel.fromJson(e as Map<String, dynamic>));
        }
        return internshipPeriodTags;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
