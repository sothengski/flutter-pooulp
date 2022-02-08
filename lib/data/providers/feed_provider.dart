import 'dart:convert';

import '../data.dart';

abstract class IFeedProvider {
  Future<List<FeedModel>> getFeedOffers();
}

class FeedProvider extends BaseProvider implements IFeedProvider {
  @override
  Future<List<FeedModel>> getFeedOffers() async {
    try {
      final dataResponse = await get(
        API.paths[Endpoint.feed].toString(),
      );
      final List<FeedModel> feedOfferList = <FeedModel>[];
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final apiResponse = json.decode(dataResponse.bodyString.toString());
        apiResponse.forEach(
          (e) {
            feedOfferList.add(FeedModel.fromJson(e as Map<String, dynamic>));
          },
        );
        //sort
        // dateTimeSortingOrderTrx(list: orderTrxList);
        return feedOfferList;
        // return orderTrxListFromJson(response.body['data'].toString());
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
