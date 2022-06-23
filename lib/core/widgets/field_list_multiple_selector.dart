import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/data.dart';
import '../core.dart';

class FieldListMultipleSelector extends StatefulWidget {
  final List<FieldModel>? dataListforSelected;
  final List<FieldModel>? selectedItems;
  final ScrollController? scrollController;
  final int? separatorIndex;
  final Function(FieldModel)? onTap;
  final bool? showPhoneCode;
  final bool? showCountry;
  final String? inputHintText;
  final Widget? cardItem;

  const FieldListMultipleSelector({
    this.dataListforSelected,
    this.scrollController,
    this.separatorIndex = 1,
    this.onTap,
    Key? key,
    this.showPhoneCode = true,
    this.showCountry = true,
    this.selectedItems,
    this.inputHintText = 'Search...',
    this.cardItem,
  }) : super(key: key);

  @override
  State<FieldListMultipleSelector> createState() =>
      _FieldListMultipleSelectorState();
}

class _FieldListMultipleSelectorState extends State<FieldListMultipleSelector> {
  late List<FieldModel>? filteredDataList = [];

  @override
  void initState() {
    super.initState();
    filteredDataList!.addAll(widget.dataListforSelected!.toList());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: AppSize.s12,
            left: AppSize.s16,
            right: AppSize.s16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.pop(context, true),
                  child: CustomTextWidget(
                    text: 'cancel'.tr,
                    color: ColorsManager.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: AppSize.s16,
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => Navigator.pop(context, true),
                  child: CustomTextWidget(
                    textAlign: TextAlign.right,
                    text: 'done'.tr,
                    fontWeight: FontWeight.w600,
                    fontSize: AppSize.s16,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: CustomTextInput(
            hintText: widget.inputHintText,
            suffixIcon: const Icon(Icons.search),
            onChanged: filterSearchResults,
            enabledBorderColor: ColorsManager.grey300,
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
                    final FieldModel fieldItem = filteredDataList![index];
                    return Card(
                      elevation: 0.0,
                      color: ColorsManager.white,
                      child: RowDataSelectionWidget.checkBox(
                        isClickingValue: widget.selectedItems!
                            .where((item) => item.id == fieldItem.id)
                            .isNotEmpty,
                        // widget.selectedItems!.contains(fieldItem),
                        text: fieldItem.label,
                        onPressed: () => {
                          setState(
                            () => widget.onTap!(fieldItem),
                          )
                        },
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
    List<FieldModel> searchResult = <FieldModel>[];
    if (query.isEmpty) {
      searchResult.addAll(widget.dataListforSelected!);
    } else {
      searchResult = widget.dataListforSelected!
          .where(
            (c) => c.label!.toLowerCase().startsWith(
                  query.toLowerCase(),
                ),
          )
          .toList();
    }
    setState(() => filteredDataList = searchResult);
  }
}
