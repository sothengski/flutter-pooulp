import 'dart:io';

import 'package:get/get.dart';

import '../data.dart';

class PlaceApiProvider extends GetConnect {
  final key = Platform.isAndroid ? APIKeys.androidKey : APIKeys.iosKey;

  Future<List<GooglePlaceSearchModel>> getGooglePlacesAutocomplete({
    String? search,
    String? lang = 'en',
    String? sessionToken = '',
  }) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&language=$lang&types=(regions)&key=$key&sessiontoken=$sessionToken';
    //         'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=address&language=$lang&components=country:ch&key=$apiKey&sessiontoken=$sessionToken';
    final response = await get(url);
    final apiResponse = response
        .body; //same as // final apiResponse = json.decode(response.bodyString.toString());

    final jsonResults = (apiResponse as Map)['predictions'] as List;
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

    final jsonResp = GooglePlaceDetailModel.fromJson(
      apiResponse as Map<String, dynamic>,
    );

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

  Future<PlaceDetailModel> getGooglePlaceFilterDetail({
    String? placeId,
    String? sessionToken = '',
  }) async {
    // debugPrint('<=====getGooglePlaceDetail=====>');
    String? addressCountry;
    String? addressAreaLevel1;
    String? addressAreaLevel2;
    String? fullAddress;
    String? addressStreet;
    String? addressRoute;
    String? addressPostalCode;
    double? addressLat;
    double? addressLng;

    final url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key&sessiontoken=$sessionToken';
    final response = await httpClient.get(url);

    final apiResponse = response.body;

    // final jsonResult = apiResponse['result'] as Map<String, dynamic>;

    final jsonResp = GooglePlaceDetailModel.fromJson(
      apiResponse as Map<String, dynamic>,
    );
    final data = jsonResp.result!.addressComponents;
    for (final c in data!) {
      if (c.types!.contains('country')) {
        addressCountry = c.longName;
      }
      if (c.types!.contains('administrative_area_level_2')) {
        addressAreaLevel2 = c.longName;
      }
      if (c.types!.contains('administrative_area_level_1')) {
        addressAreaLevel1 = c.longName;
      }
      if (c.types!.contains('postal_code')) {
        addressPostalCode = c.longName;
      }
      if (c.types!.contains('street_number')) {
        addressStreet = c.longName;
      }
      if (c.types!.contains('route')) {
        addressRoute = c.longName;
      }
    }
    addressLat = jsonResp.result!.geometry!.location!.lat;
    addressLng = jsonResp.result!.geometry!.location!.lng;
    // countryCtrl.text = googlePlaceDetail.value.result!.googlePlaceCountry;
    fullAddress = jsonResp.result!.formattedAddress;
    // final PlaceDetailModel temp = PlaceDetailModel(
    //   country: addressCountry,
    //   areaLevel1: addressAreaLevel1,
    //   postalCode: addressPostalCode,
    //   fullAddress: fullAddress,
    //   lat: addressLat,
    //   lng: addressLng,
    // );
    // debugPrint('result: $temp');
    // debugPrint('<=====getGooglePlaceDetail=====>');

    return PlaceDetailModel(
      country: addressCountry,
      areaLevel1: addressAreaLevel1,
      areaLevel2: addressAreaLevel2,
      streetNumber: addressStreet,
      route: addressRoute,
      postalCode: addressPostalCode,
      fullAddress: fullAddress,
      lat: addressLat,
      lng: addressLng,
    );
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
