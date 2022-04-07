import '../../../data/data.dart';

class OnboardingInfoModel {
  final int? id;
  final String? textTitle;
  final String? textDescription;
  final String? imgUrl;
  final List<FieldModel>? fieldList;

  OnboardingInfoModel({
    this.id,
    this.textTitle,
    this.textDescription,
    this.imgUrl,
    this.fieldList,
  });

  @override
  String toString() {
    return '''
    OnboardingInfoModel(
      id: $id, 
      textTitle: $textTitle, 
      textDescription: $textDescription, 
      imgUrl: $imgUrl, 
      fieldList: $fieldList,
    )''';
  }
}
