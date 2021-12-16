import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../core.dart';

class CountryListSelector extends StatelessWidget {
  final List<CountryModel>? countrylist;
  // late CountryFinder _countryFinder;
  final ScrollController? scrollController;
  final int? separatorIndex;
  final Function(CountryModel)? onTap;

  const CountryListSelector({
    this.countrylist,
    this.scrollController,
    this.separatorIndex = 1,
    this.onTap,
    Key? key,
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
            marginTop: double10,
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
                      leading: CircleFlag(
                        country.isoCode.toString(),
                      ),
                      title: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          "${country.name}",
                          textAlign: TextAlign.start,
                        ),
                      ),
                      subtitle: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          country.displayCountryCode,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.start,
                        ),
                      ),
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
