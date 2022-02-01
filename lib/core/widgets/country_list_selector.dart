import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../core.dart';

class CountryListSelector extends StatelessWidget {
  final List<CountryModel>? countrylist;
  final CountryModel? selectedCountry;
  // late CountryFinder _countryFinder;
  final ScrollController? scrollController;
  final int? separatorIndex;
  final Function(CountryModel)? onTap;
  final bool? showPhoneCode;
  final bool? showCountry;

  const CountryListSelector({
    this.countrylist,
    this.scrollController,
    this.separatorIndex = 1,
    this.onTap,
    Key? key,
    this.showPhoneCode = true,
    this.showCountry = true,
    @required this.selectedCountry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 70,
          width: double.infinity,
          child: CustomTextWidget(
            text: "search",
            textAlign: TextAlign.center,
            marginTop: AppSize.s10,
          ),
          // SearchBox(
          //   autofocus: widget.searchAutofocus,
          //   onChanged: _onSearch,
          // ),
        ),
        Flexible(
          child: countrylist!.isNotEmpty
              ? ListView.separated(
                  controller: scrollController,
                  shrinkWrap: true,
                  itemCount: countrylist!.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    height: 0.0,
                    thickness: 0.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final CountryModel country = countryList[index];
                    return Card(
                      elevation: 0.0,
                      color: selectedCountry!.iso3Code ==
                              country.iso3Code.toString()
                          ? ColorsManager.grey300
                          : ColorsManager.white,
                      child: ListTile(
                        key: Key(country.isoCode.toString()),
                        dense: true,
                        contentPadding:
                            const EdgeInsets.only(left: 20.0, right: 20.0),
                        leading: CircleFlag(
                          country.isoCode.toString(),
                        ),
                        title: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: showCountry == true
                              ? CustomTextWidget(
                                  text: "${country.name}",
                                  fontSize: 16.0,
                                  fontWeight: FontWeightManager.medium,
                                  color: selectedCountry!.iso3Code ==
                                          country.iso3Code.toString()
                                      ? ColorsManager.primary
                                      : ColorsManager.primaryBlue,
                                )
                              : Container(),
                        ),
                        trailing: showPhoneCode == true
                            ? CustomTextWidget(
                                text: country.phoneCode,
                                color: selectedCountry!.iso3Code ==
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
                        onTap: () => onTap!(country),
                      ),
                    );
                  },
                )
              : const Padding(
                  key: Key('no-result'),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'No result found',
                  ),
                ),
        ),
      ],
    );
  }
}
