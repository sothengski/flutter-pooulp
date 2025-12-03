import 'package:flutter/material.dart';

import '../core.dart';

class RowDataSelectionWidget extends StatelessWidget {
  final String? text;
  final Widget? textWidget;
  final bool? isLeftSideText;
  final IconData? iconDataClick;
  final Color? iconColorClick;
  final IconData? iconDataUnClick;
  final Color? iconColorUnClick;
  final bool? isClickingValue;
  final VoidCallback? onPressed;
  final double verticalPadding;
  final double horizontalPadding;

  const RowDataSelectionWidget({
    super.key,
    this.text = '',
    this.textWidget,
    this.isLeftSideText = true,
    this.iconDataClick,
    this.iconColorClick = ColorsManager.black,
    this.iconDataUnClick,
    this.iconColorUnClick = ColorsManager.black,
    this.isClickingValue = false,
    this.onPressed,
    this.verticalPadding = 8.0,
    this.horizontalPadding = 8.0,
  });

  const RowDataSelectionWidget.radioButton({
    super.key,
    this.text = '',
    this.textWidget,
    this.isLeftSideText = true,
    this.iconDataClick = Icons.radio_button_checked,
    this.iconColorClick = ColorsManager.primary,
    this.iconDataUnClick = Icons.radio_button_unchecked,
    this.iconColorUnClick = ColorsManager.primary,
    this.isClickingValue = false,
    this.onPressed,
    this.verticalPadding = 8.0,
    this.horizontalPadding = 8.0,
  });

  const RowDataSelectionWidget.checkBox({
    super.key,
    this.text = '',
    this.textWidget,
    this.isLeftSideText = true,
    this.iconDataClick = Icons.check_box,
    this.iconColorClick = ColorsManager.primary,
    this.iconDataUnClick = Icons.check_box_outline_blank,
    this.iconColorUnClick = ColorsManager.primary,
    this.isClickingValue = false,
    this.onPressed,
    this.verticalPadding = 8.0,
    this.horizontalPadding = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isLeftSideText == false)
              Wrap(
                children: [
                  // const SizedBox(width: 8.0),
                  if (isClickingValue == true)
                    iconDataClick == null
                        ? Container()
                        : Icon(iconDataClick, color: iconColorClick)
                  else
                    iconDataUnClick == null
                        ? Container()
                        : Icon(iconDataUnClick, color: iconColorUnClick),
                  // const SizedBox(width: 8.0),
                ],
              )
            else
              Container(),
            Expanded(
              flex: 75,
              child:
                  textWidget ??
                  CustomTextWidget(
                    marginLeft: 8.0,
                    marginRight: 8.0,
                    text: text,
                    fontWeight: isClickingValue == true
                        ? FontWeight.w600
                        : FontWeight.w300,
                  ),
            ),
            if (isLeftSideText == true)
              Wrap(
                alignment: WrapAlignment.end,
                children: [
                  const SizedBox(width: 8.0),
                  if (isClickingValue == true)
                    iconDataClick == null
                        ? Container()
                        : Icon(iconDataClick, color: iconColorClick)
                  else
                    iconDataUnClick == null
                        ? Container()
                        : Icon(iconDataUnClick, color: iconColorUnClick),
                  const SizedBox(width: 8.0),
                ],
              )
            else
              Container(),
          ],
        ),
      ),
    );
  }
}
