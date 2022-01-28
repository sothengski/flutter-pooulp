import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../core.dart';

class CountryListSelector extends StatelessWidget {
  final List<CountryModel>? countrylist;
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
                    height: 2.0,
                    thickness: 1.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final CountryModel country = countryList[index];
                    return ListTile(
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
                              )
                            : Container(),
                      ),
                      trailing: showPhoneCode == true
                          ? CustomTextWidget(
                              text: country.phoneCode,
                              color: ColorsManager.grey600,
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
