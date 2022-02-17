import 'dart:convert';

import '../data.dart';

abstract class IOfferProvider {
  Future<List<JobOfferModel>> getPendingOffers();
  Future<List<JobOfferModel>> getMatchedOffers();
  Future<List<JobOfferModel>> getSavedOffers();
  Future<List<JobOfferModel>> getRejectedOffers();
}

class OfferProvider extends BaseProvider implements IOfferProvider {
  @override
  Future<List<JobOfferModel>> getPendingOffers() async {
    try {
      final dataResponse = await get(
        API.paths[Endpoint.pendingOffer].toString(),
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
        print('getPendingOffers object');
        return pendingOfferList;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<List<JobOfferModel>> getMatchedOffers() async {
    try {
      final dataResponse = await get(
        API.paths[Endpoint.matchedOffer].toString(),
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
        print('getMatchingOffers object');
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
        API.paths[Endpoint.savedOffer].toString(),
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
        print('getSavedOffers object');
        return savedOfferList;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  ///TODO:: Not implement the API yet!!
  @override
  Future<List<JobOfferModel>> getRejectedOffers() async {
    try {
      final dataResponse = await get(
        API.paths[Endpoint.rejectedOffer].toString(),
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
        print('getRejectedOffers object');
        return rejectedOfferList;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
