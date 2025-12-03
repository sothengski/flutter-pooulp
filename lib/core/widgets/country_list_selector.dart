import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/data.dart';
import '../core.dart';

// bool isNumeric(String s) => s.isNotEmpty && double.tryParse(s) != null;
class CountryListSelector extends StatefulWidget {
  final List<CountryModel>? countrylist;
  final CountryModel? selectedCountry;
  // late CountryFinder _countryFinder;
  final ScrollController? scrollController;
  final int? separatorIndex;
  final Function(CountryModel)? onTap;
  final bool? showPhoneCode;
  final bool? showCountry;
  final String? languageCode;

  const CountryListSelector({
    this.countrylist,
    this.scrollController,
    this.separatorIndex = 1,
    this.onTap,
    super.key,
    this.showPhoneCode = true,
    this.showCountry = true,
    this.selectedCountry,
    this.languageCode = 'en',
  });

  @override
  State<CountryListSelector> createState() => _CountryListSelectorState();
}

class _CountryListSelectorState extends State<CountryListSelector> {
  late List<CountryModel>? filteredCountryList = [];

  @override
  void initState() {
    super.initState();
    filteredCountryList!.addAll(widget.countrylist!.toList());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: CustomTextInput(
            hintText: 'search'.tr, //'profile.searchCountry'.tr,
            suffixIcon: const Icon(
              Icons.search,
              // color: ColorsManager.grey400,
            ),
            onChanged: filterSearchResults,
          ),
        ),
        Flexible(
          child: filteredCountryList!.isNotEmpty
              ? ListView.separated(
                  controller: widget.scrollController,
                  shrinkWrap: true,
                  itemCount: filteredCountryList!.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(height: 0.0, thickness: 0.0),
                  itemBuilder: (BuildContext context, int index) {
                    final CountryModel country = filteredCountryList![index];
                    return Card(
                      elevation: 0.0,
                      color:
                          widget.selectedCountry!.iso3Code ==
                              country.iso3Code.toString()
                          ? ColorsManager.grey300
                          : ColorsManager.white,
                      child: ListTile(
                        key: Key(country.isoCode.toString()),
                        dense: true,
                        contentPadding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                        ),
                        leading: CircleFlag(country.isoCode.toString()),
                        title: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: widget.showCountry == true
                              ? CustomTextWidget(
                                  text: widget.languageCode! == 'fr'
                                      ? "${country.frName}"
                                      : "${country.name}",
                                  fontSize: 16.0,
                                  maxLine: 2,
                                  fontWeight: FontWeightManager.medium,
                                  color:
                                      widget.selectedCountry!.iso3Code ==
                                          country.iso3Code.toString()
                                      ? ColorsManager.primary
                                      : ColorsManager.primaryBlue,
                                )
                              : Container(),
                        ),
                        trailing: widget.showPhoneCode == true
                            ? CustomTextWidget(
                                text: country.phoneCode,
                                color:
                                    widget.selectedCountry!.iso3Code ==
                                        country.iso3Code.toString()
                                    ? ColorsManager.primary
                                    : ColorsManager.grey600,
                                fontSize: 16.0,
                                fontWeight: FontWeightManager.medium,
                              )
                            : const CustomTextWidget(
                                color: ColorsManager.primary,
                              ),
                        // trailing:  Align(
                        //   alignment: AlignmentDirectional.centerStart,
                        //   child: showPhoneCode == true
                        //       ? CustomTextWidget(
                        //           text: country.phoneCode,
                        //           color: ColorsManager.primary,
                        //         )
                        //       : Container(),
                        // ),
                        // subtitle: Align(
                        //   alignment: AlignmentDirectional.centerStart,
                        //   child: showPhoneCode == true
                        //       ? CustomTextWidget(
                        //           text: country.phoneCode,
                        //           color: ColorsManager.primary,
                        //         )
                        //       : Container(),
                        // ),
                        onTap: () => widget.onTap!(country),
                      ),
                    );
                  },
                )
              : Padding(
                  key: const Key('no-result'),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'noResult'.tr,
                    // 'profile.noResult'.tr,
                  ),
                ),
        ),
      ],
    );
  }

  void filterSearchResults(String query) {
    List<CountryModel> searchResult = <CountryModel>[];
    if (query.isEmpty) {
      searchResult.addAll(countryList);
    } else {
      searchResult = countryList
          .where((c) => c.name!.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    }
    setState(() => filteredCountryList = searchResult);
  }
}
