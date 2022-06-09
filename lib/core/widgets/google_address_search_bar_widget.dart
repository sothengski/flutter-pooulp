import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';

class GoogleAddressSearchBarWidget extends SearchDelegate<PlaceDetailModel> {
  // final onboardingController = Get.find<OnboardingController>();
  final placeApiProvider = Get.put(PlaceApiProvider());
  PlaceDetailModel? placeDetailData;
  final String? sessionToken;

  GoogleAddressSearchBarWidget({
    this.sessionToken,
    this.placeDetailData,
  });

  Future<void> myAsyncMethod({
    BuildContext? context,
    String? placeId,
    VoidCallback? onSuccess,
  }) async {
    await Future.delayed(DurationConstant.d1500);
    placeDetailData = await placeApiProvider.getGooglePlaceFilterDetail(
      placeId: placeId,
      sessionToken: sessionToken,
    );
    onSuccess!.call();
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        Get.back();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // return null;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Get.back();
    });

    return Container();
  }

  // @override
  // void showResults(BuildContext context) {
  //   Navigator.of(context).popAndPushNamed(
  //     '/rro',
  //     arguments: query,
  //   );
  //   super.showResults(context);
  // }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: query == ""
          ? null
          : placeApiProvider.getGooglePlacesAutocomplete(
              search: query,
              sessionToken: sessionToken,
              // Localizations.localeOf(context).languageCode,
            ),
      builder: (context, snapshot) {
        if (query == '') {
          return const Center(
            child: CustomTextWidget(text: 'Enter your address'),
          );
        } else {
          if (snapshot.hasData) {
            final List<GooglePlaceSearchModel> listOfPlace =
                snapshot.data! as List<GooglePlaceSearchModel>;
            return ListView.builder(
              itemBuilder: (context, index) {
                final GooglePlaceSearchModel place = listOfPlace[index];
                return ListTile(
                  title: Text(' ${place.description.toString()}'),
                  onTap: () => myAsyncMethod(
                    context: context,
                    placeId: place.placeId,
                    onSuccess: () {
                      // Navigator.of(context).pop();
                      close(context, placeDetailData!);
                    },
                  ),
                  // onTap: () async {
                  //   placeDetailData =
                  //       await placeApiProvider.getGooglePlaceFilterDetail(
                  //     placeId: place.placeId,
                  //     sessionToken: sessionToken,
                  //   );
                  //   debugPrint("placeDetailData:: $placeDetailData");
                  //   Get.back();
                  //   // close(context, listOfPlace[index]);
                  // },
                );
              },
              itemCount: listOfPlace.length,
            );
          } else {
            return const Center(child: CustomTextWidget(text: 'Loading...'));
          }
        }
      },
    );
  }
}
