class CountryModel {
  final String? name;
  final String? frName;
  final String? isoCode;
  final String? iso3Code;
  final String? phoneCode;

  const CountryModel({
    this.name,
    this.frName,
    this.isoCode,
    this.iso3Code,
    this.phoneCode,
  });

  /// returns "+ [phoneCode]"
  // String get displayCountryCode => '+ $phoneCode';

  factory CountryModel.fromJson(Map<String, String> json) => CountryModel(
        name: json['name'],
        frName: json['frName'],
        isoCode: json['isoCode'],
        iso3Code: json['iso3Code'],
        phoneCode: json['phoneCode'],
      );

  @override
  String toString() {
    return '''
    CountryModel(
      name: $name,
      frName: $frName,
      isoCode: $isoCode,
      iso3Code: $iso3Code,
      phoneCode: $phoneCode)''';
  }
}
