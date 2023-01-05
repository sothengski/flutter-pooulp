import 'package:get/get.dart';

import '../core.dart';

String translateStateWords({required String? stateWord}) {
  if (stateWord == OfferStrings.pendingState) {
    return 'pending'.tr;
  } else if (stateWord == OfferStrings.matchedState) {
    return 'matchings'.tr;
  } else if (stateWord == OfferStrings.savedState) {
    return 'savedOffers'.tr;
  } else if (stateWord == OfferStrings.rejectedState) {
    return 'refused'.tr;
  } else if (stateWord == SkillCategoryStrings.hardSkill) {
    return 'hardSkill'.tr;
  } else if (stateWord == SkillCategoryStrings.softSkill) {
    return 'softSkill'.tr;
  } else if (stateWord == LevelStrings.undefined) {
    return 'undefined'.tr;
  } else if (stateWord == LevelStrings.beginner) {
    return 'beginner'.tr;
  } else if (stateWord == LevelStrings.intermediate) {
    return 'intermediate'.tr;
  } else if (stateWord == LevelStrings.professional) {
    return 'professional'.tr;
  } else if (stateWord == LevelStrings.motherTongue) {
    return 'motherTongue'.tr;
  } else if (stateWord == GenderStrings.male) {
    return 'male'.tr;
  } else if (stateWord == GenderStrings.female) {
    return 'female'.tr;
  } else if (stateWord == GenderStrings.others) {
    return 'others'.tr;
  }

  // else if (stateWord == 'All') {
  //   return 'offer.all'.tr;
  // }
  else {
    return '-'.tr;
  }
}

String? getLevelString({int? level}) {
  // if (level == 0) {
  //   return 'profile.undefined'.tr;
  // }
  return level == 1
      ? 'beginner'.tr
      : level == 2
          ? 'intermediate'.tr
          : level == 3
              ? 'confirmed'.tr
              : level == 4
                  ? 'expert'.tr
                  : 'undefined'.tr;
}
