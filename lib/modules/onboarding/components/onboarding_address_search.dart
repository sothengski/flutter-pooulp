import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';

class OnBoardingAddressSearchBarWidget
    extends SearchDelegate<GooglePlaceSearchModel> {
  // final editInformationController = Get.find<EditUserInformationController>();
  final placeApiProvider = Get.put(PlaceApiProvider());
  final String? sessionToken;

  OnBoardingAddressSearchBarWidget({
    this.sessionToken,
  });
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
                  onTap: () async {
                    placeApiProvider.getGooglePlaceFilterDetail(
                      placeId: place.placeId,
                      sessionToken: sessionToken,
                    );
                    Get.back();
                    // close(context, listOfPlace[index]);
                  },
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
