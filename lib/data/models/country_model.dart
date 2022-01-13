class CountryModel {
  final String? name;
  final String? isoCode;
  final String? iso3Code;
  final String? phoneCode;

  const CountryModel({
    this.isoCode,
    this.iso3Code,
    this.phoneCode,
    this.name,
  });

  /// returns "+ [phoneCode]"
  // String get displayCountryCode => '+ $phoneCode';

  factory CountryModel.fromJson(Map<String, String> json) => CountryModel(
        name: json['name'],
        isoCode: json['isoCode'],
        iso3Code: json['iso3Code'],
        phoneCode: json['phoneCode'],
      );

  @override
  String toString() {
    return '''
    CountryModel(
      name: $name, 
      isoCode: $isoCode, 
      iso3Code: $iso3Code, 
      phoneCode: $phoneCode)''';
  }
}
