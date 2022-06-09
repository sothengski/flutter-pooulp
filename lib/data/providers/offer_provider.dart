import 'dart:convert';

import 'package:flutter/material.dart';

import '../data.dart';

abstract class IOfferProvider {
  Future<List<JobOfferModel>> getFeedOffers();
  Future<List<JobOfferModel>> getPendingOffers();
  Future<List<JobOfferModel>> getMatchedOffers();
  Future<List<JobOfferModel>> getSavedOffers();
  Future<List<JobOfferModel>> getRejectedOffers();
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
      debugPrint(
        'Page: $pageNumber, Param:${jobOfferForSearch.toSearchJson()}',
      );
      // debugPrint(
      //   'API: ${API.postSearchOffer(pageNumber: pageNumber)}',
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
}
