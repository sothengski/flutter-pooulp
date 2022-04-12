import 'package:get/get.dart';

import '../core.dart';

String translateStateWords({required String? stateWord}) {
  if (stateWord == OfferStrings.pendingState) {
    return 'offer.pending'.tr;
  } else if (stateWord == OfferStrings.matchedState) {
    return 'offer.matched'.tr;
  } else if (stateWord == OfferStrings.savedState) {
    return 'offer.saved'.tr;
  } else if (stateWord == OfferStrings.rejectedState) {
    return 'offer.rejected'.tr;
  } else if (stateWord == SkillCategoryStrings.hardSkill) {
    return 'profile.hardSkill'.tr;
  } else if (stateWord == SkillCategoryStrings.softSkill) {
    return 'profile.softSkill'.tr;
  } else if (stateWord == LevelStrings.undefined) {
    return 'profile.undefined'.tr;
  } else if (stateWord == LevelStrings.beginner) {
    return 'profile.beginner'.tr;
  } else if (stateWord == LevelStrings.intermediate) {
    return 'profile.itermediate'.tr;
  } else if (stateWord == LevelStrings.professional) {
    return 'profile.professional'.tr;
  } else if (stateWord == LevelStrings.motherTongue) {
    return 'profile.motherTongue'.tr;
  }

  // else if (stateWord == 'All') {
  //   return 'offer.all'.tr;
  // }
  else {
    return 'offer.na'.tr;
  }
}
