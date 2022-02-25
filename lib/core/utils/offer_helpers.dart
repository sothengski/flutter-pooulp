import '../../data/data.dart';

class OfferHelper {
  //CONSTRUCTOR
  OfferHelper();

  void updateOfferStateItem({
    required String? actionStateName,
    int? totalItem = 0,
    List<FieldModel>? jobOfferStateList,
  }) {
    final FieldModel itemToBeUpdated =
        jobOfferStateList!.firstWhere((e) => e.label == actionStateName);
    itemToBeUpdated.total = totalItem;
  }

  void removeItemFromJobOfferList({
    List<JobOfferModel>? jobOfferList,
    int? jobOfferId,
  }) {
    jobOfferList!.removeWhere((item) => item.id == jobOfferId);
  }
}
