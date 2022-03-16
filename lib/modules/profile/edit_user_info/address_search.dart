// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:get/get.dart';
// import 'package:pooulp_flutter/data/services/place_service.dart';

// class AddressSearch extends SearchDelegate<Suggestion> {
//   AddressSearch(this.sessionToken) {
//     // apiClient = PlaceApiProvider(sessionToken);
//   }

//   final sessionToken;
//   // late PlaceApiProvider apiClient;

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         tooltip: 'Clear',
//         icon: const Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       )
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       tooltip: 'Back',
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () {
//         // close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // return null;
//     SchedulerBinding.instance!.addPostFrameCallback((_) {
//       Get.back();
//     });

//     return Container();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return Container(child: const Text('Loading...'));
//     // FutureBuilder(
//     //   future: query == ""
//     //       ? null
//     //       : apiClient.fetchSuggestions(
//     //           input: query,
//     //           // Localizations.localeOf(context).languageCode,
//     //         ),
//     //   builder: (context, snapshot) => query == ''
//     //       ? Container(
//     //           padding: const EdgeInsets.all(16.0),
//     //           child: const Text('Enter your address'),
//     //         )
//     //       : snapshot.hasData
//     //           ? Container(
//     //               child: const Text('a'),
//     //             )
//     //           //  ListView.builder(
//     //           //     itemBuilder: (context, index) => ListTile(
//     //           //       title:
//     //           //           Text((snapshot.data[index] as Suggestion).description),
//     //           //       onTap: () {
//     //           //         close(context, snapshot.data[index] as Suggestion);
//     //           //       },
//     //           //     ),
//     //           //     itemCount: snapshot.data.length,
//     //           //   )
//     //           : Container(child: const Text('Loading...')),
//     // );
//   }
// }
