import 'dart:convert';

import '../data.dart';

abstract class ITagProvider {
  Future<List<FieldModel>> getJobOfferTypes();
  Future<List<FieldModel>> getAllFields();
  Future<List<FieldModel>> getLanguages();
  Future<List<SchoolModel>> getSchools();
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
}
