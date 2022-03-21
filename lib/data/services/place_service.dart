// ignore_for_file: avoid_dynamic_calls

import 'dart:io';

import 'package:get/get.dart';
import 'package:pooulp_flutter/data/data.dart';

class PlaceApiProvider extends GetConnect {
  final key = Platform.isAndroid ? APIKeys.androidKey : APIKeys.iosKey;

  Future<List<GooglePlaceSearchModel>> getGooglePlacesAutocomplete({
    String? search,
    String? lang = 'en',
    String? sessionToken = '',
  }) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&language=$lang&types=address&key=$key&sessiontoken=$sessionToken';
    //         'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=address&language=$lang&components=country:ch&key=$apiKey&sessiontoken=$sessionToken';
    final response = await get(url);
    final apiResponse = response
        .body; //same as // final apiResponse = json.decode(response.bodyString.toString());

    final jsonResults = apiResponse['predictions'] as List;
// debugPrint('<=====jsonResults:: $jsonResults=====>');
    return jsonResults
        .map(
          (place) =>
              GooglePlaceSearchModel.fromJson(place as Map<String, dynamic>),
        )
        .toList();
  }

  Future<GooglePlaceDetailModel> getGooglePlaceDetail({
    String? placeId,
    String? sessionToken = '',
  }) async {
    // debugPrint('<=====getGooglePlaceDetail=====>');

    final url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key&sessiontoken=$sessionToken';
    final response = await httpClient.get(url);

    final apiResponse = response.body;

    // final jsonResult = apiResponse['result'] as Map<String, dynamic>;

    final jsonResp =
        GooglePlaceDetailModel.fromJson(apiResponse as Map<String, dynamic>);

    // debugPrint("jsonResp:: $jsonResp");
    // debugPrint(
    //   "jsonResp formattedAddress:: ${jsonResp.result!.formattedAddress}",
    // );
    // debugPrint(
    //   "jsonResp lat/long:: ${jsonResp.result!.geometry!.location!.lat}/${jsonResp.result!.geometry!.location!.lng}",
    // );

    // final data = jsonResp.result!.addressComponents;
    // for (final c in data!) {
    //   if (c.types!.contains('country')) {
    //     debugPrint("country:: ${c.longName}");
    //   }
    //   if (c.types!.contains('administrative_area_level_2')) {
    //     debugPrint("administrative_area_level_2:: ${c.longName}");
    //   }
    //   if (c.types!.contains('administrative_area_level_1')) {
    //     debugPrint("administrative_area_level_1:: ${c.longName}");
    //   }
    //   if (c.types!.contains('postal_code')) {
    //     debugPrint("postal_code:: ${c.longName}");
    //   }
    // }
    // debugPrint('<=====End of getPlace=====>');

    return jsonResp;
  }

  // Future<List<Place>> getPlaces(
  //   double lat,
  //   double lng,
  //   String placeType,
  // ) async {
  //   debugPrint('<=====getPlaces=====>');
  //   final url =
  //       'https://maps.googleapis.com/maps/api/place/textsearch/json?location=$lat,$lng&type=$placeType&rankby=distance&key=$key';
  //   final response = await httpClient.get(url);
  //   final json = convert.jsonDecode(response.body.toString());
  //   final jsonResults = json['results'] as List;
  //   return jsonResults
  //       .map((place) => Place.fromJson(place as Map<String, dynamic>))
  //       .toList();
  // }

  // Future<void> getPlaceDetail({String? id}) async {
  //   final GoogleMapsPlaces placesProvider = GoogleMapsPlaces(apiKey: key);
  //   final PlacesDetailsResponse detail =
  //       await placesProvider.getDetailsByPlaceId(id!);

  //   // final placeId = p.placeId;
  //   final double lat = detail.result.geometry!.location.lat;
  //   final double lng = detail.result.geometry!.location.lng;

  //   // final address = await Geocoder.local.findAddressesFromQuery(p.description);

  //   print("lat: $lat");
  //   print("lng: $lng");
  // }
}
