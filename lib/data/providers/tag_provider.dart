import 'dart:convert';

import '../data.dart';

abstract class ITagProvider {
  Future<List<FieldModel>> getJobOfferTypes();
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
}
