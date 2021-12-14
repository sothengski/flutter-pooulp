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
  String get displayCountryCode => '+ $phoneCode';

  factory CountryModel.fromMap(Map<String, String> map) => CountryModel(
        name: map['name'],
        isoCode: map['isoCode'],
        iso3Code: map['iso3Code'],
        phoneCode: map['phoneCode'],
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
