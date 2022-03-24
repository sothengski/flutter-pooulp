import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../core.dart';

class SchoolListSelector extends StatefulWidget {
  final List<SchoolModel>? dataListforSelected;
  final SchoolModel? selectedItem;
  final ScrollController? scrollController;
  final int? separatorIndex;
  final Function(SchoolModel)? onTap;
  final bool? showPhoneCode;
  final bool? showCountry;

  const SchoolListSelector({
    this.dataListforSelected,
    this.scrollController,
    this.separatorIndex = 1,
    this.onTap,
    Key? key,
    this.showPhoneCode = true,
    this.showCountry = true,
    @required this.selectedItem,
  }) : super(key: key);

  @override
  State<SchoolListSelector> createState() => _SchoolListSelectorState();
}

class _SchoolListSelectorState extends State<SchoolListSelector> {
  late List<SchoolModel>? filteredDataList = [];

  @override
  void initState() {
    super.initState();
    filteredDataList!.addAll(widget.dataListforSelected!.toList());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: CustomTextInput(
            hintText: 'Search School Name',
            suffixIcon: const Icon(
              Icons.search,
              // color: ColorsManager.grey400,
            ),
            onChanged: filterSearchResults,
          ),
        ),
        Flexible(
          child: filteredDataList!.isNotEmpty
              ? ListView.separated(
                  controller: widget.scrollController,
                  shrinkWrap: true,
                  itemCount: filteredDataList!.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    height: 0.0,
                    thickness: 0.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final SchoolModel schoolItem = filteredDataList![index];
                    return Card(
                      elevation: 0.0,
                      color: widget.selectedItem!.id == schoolItem.id
                          ? ColorsManager.grey300
                          : ColorsManager.white,
                      child: ListTile(
                        key: Key(schoolItem.id.toString()),
                        dense: true,
                        contentPadding:
                            const EdgeInsets.only(left: 20.0, right: 20.0),
                        // leading: CircleFlag(
                        //  schoolItem.id.toString(),
                        // ),
                        title: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: widget.showCountry == true
                              ? CustomTextWidget(
                                  text: "${schoolItem.name}",
                                  fontSize: 16.0,
                                  maxLine: 3,
                                  fontWeight: FontWeightManager.medium,
                                  color:
                                      widget.selectedItem!.id == schoolItem.id
                                          ? ColorsManager.primary
                                          : ColorsManager.primaryBlue,
                                )
                              : Container(),
                        ),
                        // trailing: widget.showPhoneCode == true
                        //     ? CustomTextWidget(
                        //         text: schoolItem.id.toString(),
                        //         color: widget.selectedItem!.id == schoolItem.id
                        //             ? ColorsManager.primary
                        //             : ColorsManager.grey600,
                        //         fontSize: 16.0,
                        //         fontWeight: FontWeightManager.medium,
                        //       )
                        //     : const CustomTextWidget(
                        //         color: ColorsManager.primary,
                        //       ),
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
                        onTap: () => widget.onTap!(schoolItem),
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

  void filterSearchResults(String query) {
    List<SchoolModel> searchResult = <SchoolModel>[];
    if (query.isEmpty) {
      searchResult.addAll(widget.dataListforSelected!);
    } else {
      searchResult = widget.dataListforSelected!
          .where(
            (c) => c.name!.toLowerCase().startsWith(
                  query.toLowerCase(),
                ),
          )
          .toList();
    }
    setState(() => filteredDataList = searchResult);
  }
}
