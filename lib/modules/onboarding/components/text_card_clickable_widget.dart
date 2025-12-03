import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';

class TextCardClickableWidget extends StatelessWidget {
  final String? text;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final int? maxLine;
  final VoidCallback? onClick;
  final double? bottomMargin;
  final double? size;
  final double? leftPadding;
  final double? rightPadding;
  final double? topPadding;
  final double? bottomPadding;
  final bool? isCenterText;
  final List<FieldModel>? itemList;
  final FieldModel? item;
  final String? rightTopText;

  const TextCardClickableWidget({
    Key? key,
    required this.text,
    this.backgroundColor = ColorsManager.white,
    this.textColor = ColorsManager.black,
    this.fontSize = AppSize.s16,
    this.maxLine = 1,
    required this.onClick,
    this.bottomMargin = 0.0,
    this.size,
    this.leftPadding = AppSize.s8,
    this.rightPadding = AppSize.s8,
    this.topPadding = AppSize.s10,
    this.bottomPadding = AppSize.s10,
    this.isCenterText = true,
    this.itemList,
    this.item,
    this.rightTopText = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: CustomBoxWidget(
        size: size,
        bottomMargin: bottomMargin,
        leftPadding: leftPadding,
        rightPadding: rightPadding,
        topPadding: topPadding,
        bottomPadding: bottomPadding,
        backgroundColor: itemList!.contains(item)
            ? ColorsManager.primary
            : ColorsManager.grey100,
        // backgroundColor:  backgroundColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 30.0,
            spreadRadius: -6.0,
            offset: -const Offset(5, 3),
            color: ColorsManager.white,
          ),
          const BoxShadow(
            blurRadius: 5.0,
            spreadRadius: -5.0,
            offset: Offset(3, 5),
            color: ColorsManager.grey,
          ),
        ],
        child: Container(
          alignment: isCenterText == true ? Alignment.center : null,
          child: (rightTopText == '')
              ? CustomTextWidget(
                  text: text,
                  textAlign: TextAlign.center,
                  maxLine: maxLine,
                  fontSize: fontSize,
                  color: itemList!.contains(item)
                      ? ColorsManager.white
                      : ColorsManager.black,
                )
              : Stack(
                  children: [
                    Align(
                      child: CustomTextWidget(
                        text: text,
                        textAlign: TextAlign.center,
                        maxLine: maxLine,
                        fontSize: fontSize,
                        color: itemList!.contains(item)
                            ? ColorsManager.white
                            : ColorsManager.black,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(AppSize.s8),
                          bottomLeft: Radius.circular(AppSize.s8),
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: ColorsManager.primary,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.s12,
                            vertical: AppSize.s5,
                          ),
                          child: CustomTextWidget(
                            textAlign: TextAlign.center,
                            text: rightTopText,
                            color: ColorsManager.white,
                            fontWeight: FontWeightManager.regular,
                            fontSize: AppSize.s12,
                            // marginBottom: 50.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
