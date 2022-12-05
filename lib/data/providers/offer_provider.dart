import 'dart:convert';

import '../data.dart';

abstract class IOfferProvider {
  Future<List<JobOfferModel>> getFeedOffers();
  Future<List<JobOfferModel>> getPendingOffers();
  Future<List<JobOfferModel>> getMatchedOffers();
  Future<List<JobOfferModel>> getSavedOffers();
  Future<List<JobOfferModel>> getRejectedOffers();
  Future<SearchPreferencesModel> getSearchPreferences();
  Future<List<SearchModel>> getSavedSearchList();
  Future<SearchModel> postCreateSavedSearch({
    JobOfferModel jobOfferForSearch,
  });
  Future<SearchModel> putEditSavedSearch({
    JobOfferModel jobOfferForSearch,
  });
  Future<JsonResponse> deleteSavedSearch({required int? savedSearchId});
  Future<List<JobOfferModel>> postSearchOffer({
    int? pageNumber = 1,
    JobOfferModel jobOfferForSearch,
  });
  Future<PaginationModel> postSearchOfferWithPagination({
    int? pageNumber = 1,
    JobOfferModel jobOfferForSearch,
  });
  Future<JobOfferModel> postApplyOffer({required int? jobOfferId});
  Future<JobOfferModel> postUnApplyOffer({required int? jobOfferId});
  Future<JobOfferModel> postSaveOffer({required int? jobOfferId});
  Future<JobOfferModel> postUnSaveOffer({required int? jobOfferId});
  Future<JobOfferModel> postHideOffer({required int? jobOfferId});
  Future<JobOfferModel> postUnHideOffer({required int? jobOfferId});
  Future<JsonResponse> postJobOfferViewCount({required String? jobOfferUUID});
  Future<JobOfferModel> getJobOfferDetailByUUID({
    required String? jobOfferUUID,
  });
  Future<JobOfferModel> getJobOfferDetailByID({
    required String? jobOfferID,
  });
}

class OfferProvider extends BaseProvider implements IOfferProvider {
  @override
  Future<List<JobOfferModel>> getFeedOffers() async {
    try {
      final dataResponse = await get(
        API.paths[Endpoint.getFeedFresh].toString(),
      );
      final List<JobOfferModel> feedOfferList = <JobOfferModel>[];
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final apiResponse =
            json.decode(dataResponse.bodyString.toString()) as List;
        for (final e in apiResponse) {
          feedOfferList.add(JobOfferModel.fromJson(e as Map<String, dynamic>));
        }
        return feedOfferList;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<List<JobOfferModel>> getPendingOffers() async {
    try {
      final dataResponse = await get(
        API.paths[Endpoint.getPendingOffer].toString(),
      );
      final List<JobOfferModel> pendingOfferList = <JobOfferModel>[];
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final apiResponse =
            json.decode(dataResponse.bodyString.toString()) as List;
        for (final e in apiResponse) {
          pendingOfferList
              .add(JobOfferModel.fromJson(e as Map<String, dynamic>));
        }
        return pendingOfferList;
      }
    } catch (e) {
      // rethrow;
      return Future.error(e.toString());
    }
  }

  @override
  Future<List<JobOfferModel>> getMatchedOffers() async {
    try {
      final dataResponse = await get(
        API.paths[Endpoint.getMatchedOffer].toString(),
      );
      final List<JobOfferModel> matchedOfferList = <JobOfferModel>[];
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final apiResponse =
            json.decode(dataResponse.bodyString.toString()) as List;
        for (final e in apiResponse) {
          matchedOfferList
              .add(JobOfferModel.fromJson(e as Map<String, dynamic>));
        }
        return matchedOfferList;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<List<JobOfferModel>> getSavedOffers() async {
    try {
      final dataResponse = await get(
        API.paths[Endpoint.getSavedOffer].toString(),
      );
      final List<JobOfferModel> savedOfferList = <JobOfferModel>[];
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final apiResponse =
            json.decode(dataResponse.bodyString.toString()) as List;
        for (final e in apiResponse) {
          savedOfferList.add(JobOfferModel.fromJson(e as Map<String, dynamic>));
        }
        return savedOfferList;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<List<JobOfferModel>> getRejectedOffers() async {
    try {
      final dataResponse = await get(
        API.paths[Endpoint.getRejectedOffer].toString(),
      );
      final List<JobOfferModel> rejectedOfferList = <JobOfferModel>[];
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final apiResponse =
            json.decode(dataResponse.bodyString.toString()) as List;
        for (final e in apiResponse) {
          rejectedOfferList
              .add(JobOfferModel.fromJson(e as Map<String, dynamic>));
        }
        return rejectedOfferList;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<SearchPreferencesModel> getSearchPreferences() async {
    try {
      final dataResponse = await get(
        API.paths[Endpoint.getSearchPreferences].toString(),
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final apiResponse = json.decode(dataResponse.bodyString.toString());

        return SearchPreferencesModel.fromJson(
          apiResponse as Map<String, dynamic>,
        );
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<List<SearchModel>> getSavedSearchList() async {
    try {
      final dataResponse = await get(
        API.paths[Endpoint.getSavedSearch].toString(),
      );
      final List<SearchModel> savedSearchList = <SearchModel>[];

      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final apiResponse =
            json.decode(dataResponse.bodyString.toString()) as List;
        for (final e in apiResponse) {
          savedSearchList.add(SearchModel.fromJson(e as Map<String, dynamic>));
        }
        // debugPrint('getSavedSearchList: $savedSearchList');
        return savedSearchList;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<List<JobOfferModel>> postSearchOffer({
    int? pageNumber,
    JobOfferModel? jobOfferForSearch,
  }) async {
    try {
      // debugPrint(
      //   'Page: $pageNumber, Param:${jobOfferForSearch!.toSearchJson()}',
      // );

      final dataResponse = await post(
        API.postSearchOffer(pageNumber: pageNumber),
        jobOfferForSearch!.toSearchJson(),
      );
      // debugPrint(
      //   'API: ${API.postSearchOffer(pageNumber: pageNumber)}',
      // );
      final List<JobOfferModel> feedOfferList = <JobOfferModel>[];
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final apiResponse = json.decode(dataResponse.bodyString.toString());
        final PaginationModel offerPagination =
            PaginationModel.fromJson(apiResponse as Map<String, dynamic>);
        // int count = 0;
        for (final e in offerPagination.data!) {
          // count += 1;
          // debugPrint('$count:: ${e.title}');
          feedOfferList.add(e);
        }
        return feedOfferList;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<PaginationModel> postSearchOfferWithPagination({
    int? pageNumber,
    JobOfferModel? jobOfferForSearch,
  }) async {
    try {
      final dataResponse = await post(
        API.postSearchOffer(pageNumber: pageNumber),
        jobOfferForSearch!.toSearchJson(),
      );
      // debugPrint(
      //   'Page: $pageNumber, Param:${jobOfferForSearch.toSearchJson()}',
      // );
      // debugPrint(
      //   'API: ${API.postSearchOffer(pageNumber: pageNumber)}',
      // );
      // debugPrint(
      //   'Data::${dataResponse.bodyString}',
      // );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final apiResponse = json.decode(dataResponse.bodyString.toString());
        final PaginationModel offerPagination =
            PaginationModel.fromJson(apiResponse as Map<String, dynamic>);

        return offerPagination;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  /// API: postApplyOffer
  @override
  Future<JobOfferModel> postApplyOffer({int? jobOfferId}) async {
    try {
      final dataResponse = await post(
        API.postApplyOffer(offerId: jobOfferId),
        {},
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        // print('postApplyOffer:: ${dataResponse.bodyString.toString()}');
        final apiResponse = json.decode(dataResponse.bodyString.toString());
        return JobOfferModel.fromJson(apiResponse as Map<String, dynamic>);
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<JobOfferModel> postUnApplyOffer({int? jobOfferId}) async {
    try {
      final dataResponse = await post(
        API.postUnApplyOffer(offerId: jobOfferId),
        {},
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        // print('postUnApplyOffer:: ${dataResponse.bodyString.toString()}');
        final apiResponse = json.decode(dataResponse.bodyString.toString());
        return JobOfferModel.fromJson(apiResponse as Map<String, dynamic>);
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<JobOfferModel> postSaveOffer({int? jobOfferId}) async {
    try {
      final dataResponse = await post(
        API.postSavedOffer(offerId: jobOfferId),
        {},
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        // print('postSaveOffer:: ${dataResponse.bodyString.toString()}');
        final apiResponse = json.decode(dataResponse.bodyString.toString());
        return JobOfferModel.fromJson(apiResponse as Map<String, dynamic>);
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<JobOfferModel> postUnSaveOffer({int? jobOfferId}) async {
    try {
      final dataResponse = await post(
        API.postUnSaveOffer(offerId: jobOfferId),
        {},
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        // print('postUnSaveOffer:: ${dataResponse.bodyString.toString()}');
        final apiResponse = json.decode(dataResponse.bodyString.toString());
        return JobOfferModel.fromJson(apiResponse as Map<String, dynamic>);
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<JobOfferModel> postHideOffer({int? jobOfferId}) async {
    try {
      final dataResponse = await post(
        API.postHideOffer(offerId: jobOfferId),
        {},
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        // print('postHideOffer:: ${dataResponse.bodyString.toString()}');
        final apiResponse = json.decode(dataResponse.bodyString.toString());
        return JobOfferModel.fromJson(apiResponse as Map<String, dynamic>);
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<JobOfferModel> postUnHideOffer({int? jobOfferId}) async {
    try {
      final dataResponse = await post(
        API.postUnHideOffer(offerId: jobOfferId),
        {},
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        // print('postUnHideOffer:: ${dataResponse.bodyString.toString()}');
        final apiResponse = json.decode(dataResponse.bodyString.toString());
        return JobOfferModel.fromJson(apiResponse as Map<String, dynamic>);
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<JobOfferModel> getJobOfferDetailByUUID({
    required String? jobOfferUUID,
  }) async {
    try {
      final dataResponse = await get(
        API.getJobOfferDetailByUUID(jobOfferUUID: jobOfferUUID),
      );
      // debugPrint('onboardingData: ${onboardingData.toRawJson()}');
      if (dataResponse.hasError) {
        // debugPrint('resp: ${dataResponse.bodyString}');
        // throw Exception(dataResponse.bodyString);
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        // debugPrint(
        //   'API: ${API.getJobOfferDetailByUUID(jobOfferUUID: jobOfferUUID)}\nresponse::${response.data}',
        // );
        // return response;
        return JobOfferModel.fromJson(response.data as Map<String, dynamic>);
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<JobOfferModel> getJobOfferDetailByID({
    required String? jobOfferID,
  }) async {
    try {
      final dataResponse = await get(
        API.getJobOfferDetailByUUID(jobOfferUUID: jobOfferID),
      );
      // debugPrint('onboardingData: ${onboardingData.toRawJson()}');
      if (dataResponse.hasError) {
        // debugPrint('resp: ${dataResponse.bodyString}');
        // throw Exception(dataResponse.bodyString);
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        // debugPrint(
        //   'API: ${API.getJobOfferDetailByUUID(jobOfferUUID: jobOfferUUID)}\nresponse::${response.data}',
        // );
        // return response;
        return JobOfferModel.fromJson(response.data as Map<String, dynamic>);
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<JsonResponse> postJobOfferViewCount({
    required String? jobOfferUUID,
  }) async {
    try {
      final dataResponse = await post(
        API.postJobOfferViewCount(jobOfferUUID: jobOfferUUID),
        {},
      );
      // debugPrint('onboardingData: ${onboardingData.toRawJson()}');
      if (dataResponse.hasError) {
        // debugPrint('resp: ${dataResponse.bodyString}');
        // throw Exception(dataResponse.bodyString);
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        // debugPrint(
        //   'API: ${API.postJobOfferViewCount(jobOfferUUID: jobOfferUUID)}\nresponse::${response.data}',
        // );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<SearchModel> postCreateSavedSearch({
    JobOfferModel? jobOfferForSearch,
  }) async {
    try {
      final dataResponse = await post(
        API.paths[Endpoint.postCreateSavedSearch].toString(),
        jobOfferForSearch!.toSearchJson(),
      );
      // debugPrint("jobOfferForSearch: ${jobOfferForSearch.toSearchJson()}");
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final apiResponse = json.decode(dataResponse.bodyString.toString());

        return SearchModel.fromJson(
          apiResponse as Map<String, dynamic>,
        );
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<SearchModel> putEditSavedSearch({
    JobOfferModel? jobOfferForSearch,
  }) async {
    try {
      final dataResponse = await put(
        API.paths[Endpoint.putEditSavedSearch].toString(),
        jobOfferForSearch!.toSearchJson(),
      );
      // debugPrint("jobOfferForSearch: ${jobOfferForSearch.toSearchJson()}");
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final apiResponse = json.decode(dataResponse.bodyString.toString());

        return SearchModel.fromJson(
          apiResponse as Map<String, dynamic>,
        );
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<JsonResponse> deleteSavedSearch({
    required int? savedSearchId,
  }) async {
    try {
      final dataResponse = await delete(
        API.deleteSavedSearch(savedSearchId: savedSearchId),
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
