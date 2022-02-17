import 'dart:convert';

import '../data.dart';

abstract class IFeedProvider {
  Future<List<JobOfferModel>> getFeedOffers();
}

class FeedProvider extends BaseProvider implements IFeedProvider {
  @override
  Future<List<JobOfferModel>> getFeedOffers() async {
    try {
      final dataResponse = await get(
        API.paths[Endpoint.feedFresh].toString(),
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
}
