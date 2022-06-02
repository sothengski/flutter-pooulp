import 'dart:convert';

class GooglePlaceSearchModel {
  final String? description;
  final String? placeId;

  GooglePlaceSearchModel({this.description, this.placeId});

  factory GooglePlaceSearchModel.fromJson(Map<String, dynamic> json) {
    return GooglePlaceSearchModel(
      description: json['description'] as String?,
      placeId: json['place_id'] as String?,
    );
  }
  @override
  String toString() => '''
    PlaceSearch(
      description: $description,
      placeId: $placeId,
    )''';
}

class GooglePlaceDetailModel {
  GooglePlaceDetailModel({
    // this.htmlAttributions,
    this.result,
    this.status,
  });

  // final List<dynamic>? htmlAttributions;
  final GooglePlaceResultModel? result;
  final String? status;

  factory GooglePlaceDetailModel.fromRawJson(String str) =>
      GooglePlaceDetailModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory GooglePlaceDetailModel.fromJson(Map<String, dynamic> json) =>
      GooglePlaceDetailModel(
        // htmlAttributions:
        //     List<dynamic>.from(json["html_attributions"].map((x) => x)),
        // result: GooglePlaceResultModel.fromJson(
        //   json["result"],
        result: json['result'] == null
            ? null
            : GooglePlaceResultModel.fromJson(
                json['result'] as Map<String, dynamic>,
              ),
        status: json["status"] as String?,
      );

  Map<String, dynamic> toJson() => {
        // "html_attributions": List<dynamic>.from(htmlAttributions.map((x) => x)),
        "result": result?.toJson(),
        "status": status,
      };

  @override
  String toString() => '''
    GooglePlaceModel(
      result: $result,
      status: $status,
    )''';
}

class GooglePlaceResultModel {
  final List<AddressComponent>? addressComponents;
  final String? adrAddress;
  final String? formattedAddress;
  final Geometry? geometry;
  final String? icon;
  final String? iconBackgroundColor;
  final String? iconMaskBaseUri;
  final String? name;
  final String? placeId;
  final String? reference;
  final List<String>? types;
  final String? url;
  final int? utcOffset;
  final String? vicinity;

  GooglePlaceResultModel({
    this.addressComponents,
    this.adrAddress,
    this.formattedAddress,
    this.geometry,
    this.icon,
    this.iconBackgroundColor,
    this.iconMaskBaseUri,
    this.name,
    this.placeId,
    this.reference,
    this.types,
    this.url,
    this.utcOffset,
    this.vicinity,
  });

  String get googlePlaceCountry {
    String country = '';
    for (final c in addressComponents!) {
      if (c.types!.contains('country')) {
        country = c.longName!;
      }
    }
    return country;
  }

  factory GooglePlaceResultModel.fromRawJson(String str) =>
      GooglePlaceResultModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory GooglePlaceResultModel.fromJson(Map<String, dynamic> json) =>
      GooglePlaceResultModel(
        addressComponents: json['address_components'] != null ||
                json['address_components'] != []
            ? (json['address_components'] as List)
                .map(
                  (i) => AddressComponent.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList()
            : [],
        adrAddress: json["adr_address"] as String?,
        formattedAddress: json["formatted_address"] as String?,
        geometry: json['geometry'] == null
            ? null
            : Geometry.fromJson(
                json['geometry'] as Map<String, dynamic>,
              ),
        icon: json["icon"] as String?,
        iconBackgroundColor: json["icon_background_color"] as String?,
        iconMaskBaseUri: json["icon_mask_base_uri"] as String?,
        name: json["name"] as String?,
        placeId: json["place_id"] as String?,
        reference: json["reference"] as String?,
        types: (json['types'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [],
        url: json["url"] as String?,
        utcOffset: json["utc_offset"] as int?,
        vicinity: json["vicinity"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "address_components":
            List<dynamic>.from(addressComponents!.map((x) => x.toJson())),
        "adr_address": adrAddress,
        "formatted_address": formattedAddress,
        "geometry": geometry!.toJson(),
        "icon": icon,
        "icon_background_color": iconBackgroundColor,
        "icon_mask_base_uri": iconMaskBaseUri,
        "name": name,
        "place_id": placeId,
        "reference": reference,
        "types": List<dynamic>.from(types!.map((x) => x)),
        "url": url,
        "utc_offset": utcOffset,
        "vicinity": vicinity,
      };

  @override
  String toString() {
    return '''
      GooglePlaceResultModel(
        addressComponents: $addressComponents,
        adrAddress: $adrAddress,
        formattedAddress: $formattedAddress,
        geometry: $geometry,
        icon: $icon,
        iconBackgroundColor: $iconBackgroundColor,
        iconMaskBaseUri: $iconMaskBaseUri,
        name: $name,
        placeId: $placeId,
        reference: $reference,
        types: $types,
        url: $url,
        utcOffset: $utcOffset,
        vicinity: $vicinity,
      )''';
  }
}

class AddressComponent {
  final String? longName;
  final String? shortName;
  final List<String>? types;

  AddressComponent({
    this.longName,
    this.shortName,
    this.types,
  });

  factory AddressComponent.fromRawJson(String str) =>
      AddressComponent.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory AddressComponent.fromJson(Map<String, dynamic> json) =>
      AddressComponent(
        longName: json["long_name"] as String?,
        shortName: json["short_name"] as String?,
        types: (json['types'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        "long_name": longName,
        "short_name": shortName,
        "types": List<dynamic>.from(types!.map((x) => x)),
      };

  @override
  String toString() => '''
    AddressComponent(
      longName: $longName, 
      shortName: $shortName, 
      types: $types,
    )''';
}

class Geometry {
  final Location? location;
  final Viewport? viewport;

  Geometry({
    this.location,
    this.viewport,
  });

  factory Geometry.fromRawJson(String str) =>
      Geometry.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: Location.fromJson(json["location"] as Map<String, dynamic>),
        viewport: Viewport.fromJson(json["viewport"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "location": location!.toJson(),
        "viewport": viewport!.toJson(),
      };

  @override
  String toString() => '''
    Geometry(
      location: $location,
      viewport: $viewport,
    )''';
}

class Location {
  final double? lat;
  final double? lng;

  Location({
    this.lat,
    this.lng,
  });

  factory Location.fromRawJson(String str) =>
      Location.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"] as double?,
        lng: json["lng"] as double?,
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };

  @override
  String toString() => '''
    Location(
      lat: $lat, 
      lng: $lng,
    )''';
}

class Viewport {
  final Location? northeast;
  final Location? southwest;

  Viewport({
    this.northeast,
    this.southwest,
  });

  factory Viewport.fromRawJson(String str) =>
      Viewport.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory Viewport.fromJson(Map<String, dynamic> json) => Viewport(
        northeast: Location.fromJson(json["northeast"] as Map<String, dynamic>),
        southwest: Location.fromJson(json["southwest"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "northeast": northeast!.toJson(),
        "southwest": southwest!.toJson(),
      };

  @override
  String toString() => '''
    Viewport(
      northeast: $northeast, 
      southwest: $southwest,
    )''';
}

class PlaceDetailModel {
  final String? country;
  final String? areaLevel1;
  final String? areaLevel2;
  final String? postalCode;
  final String? fullAddress;
  final double? lat;
  final double? lng;

  PlaceDetailModel({
    this.country,
    this.areaLevel1,
    this.areaLevel2,
    this.postalCode,
    this.fullAddress,
    this.lat,
    this.lng,
  });

  factory PlaceDetailModel.fromRawJson(String str) =>
      PlaceDetailModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory PlaceDetailModel.fromJson(Map<String, dynamic> json) =>
      PlaceDetailModel(
        lat: json["lat"] as double?,
        lng: json["lng"] as double?,
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };

  @override
  String toString() => '''
    Location(
      country: $country, 
      areaLevel1: $areaLevel1,
      areaLevel2: $areaLevel2, 
      postalCode: $postalCode,
      fullAddress: $fullAddress,
      lat: $lat, 
      lng: $lng,
    )''';
}
