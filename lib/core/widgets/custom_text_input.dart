// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core.dart';

class CustomTextInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? inputTitle;
  final double? fontSizeTitle;
  final FontWeight? fontWeightTitle;
  final Color? titleColor;
  final String? hintText;
  final Color? hintTextColor;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final Function? onSubmitted;
  final bool? isLastField;
  final String? initialText;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final OnValidator? onValidator;
  final String? errorText;
  final bool? enabled;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? inputIcon;
  final Widget? prefixIcon;
  final TextCapitalization? textCapitalization;
  final TextAlign? textAlign;
  final int? maxLength;
  final FocusNode? focusNodeName;
  final FocusNode? focusnextNode;
  final bool? counter;
  // final ValueChanged<String> onChanged;
  final bool? showPassword;
  final VoidCallback? changeShowPassword;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatterList;
  final bool? enableSuggestions;
  final bool? autocorrect;
  final double? leftPadding;
  final double? topPadding;
  final double? rightPadding;
  final double? bottomPadding;
  final double? height;
  final Color? fillColor;
  final bool? isFilled;
  final double? borderRadius;
  final double? leftContentPadding;
  final double? topContentPadding;
  final double? rightContentPadding;
  final double? bottomContentPadding;
  final int? minLines;
  final int? maxLines;
  final double? fontSize;
  final Color? fontColor;
  final bool? isReadOnly;
  final double? hintTexFontSize;
  final Color? enabledBorderColor;
  final List<String>? autofillHintsList;

  const CustomTextInput({
    this.controller,
    this.inputTitle,
    this.fontSizeTitle = AppSize.s14,
    this.fontWeightTitle = FontWeight.w400,
    this.titleColor = ColorsManager.primaryBlue,
    this.hintText,
    this.hintTextColor = ColorsManager.grey400,
    this.keyboardType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.isLastField = false,
    this.onSubmitted,
    this.initialText,
    this.onSaved,
    this.errorText,
    this.enabled = true,
    this.onValidator,
    this.onChanged,
    this.obscureText = false,
    this.suffixIcon,
    this.inputIcon,
    this.prefixIcon,
    this.textCapitalization,
    this.textAlign,
    this.maxLength = 50,
    this.focusNodeName,
    this.focusnextNode,
    this.counter = false,
    this.showPassword = false,
    this.changeShowPassword,
    this.validator,
    this.inputFormatterList,
    this.enableSuggestions = false,
    this.autocorrect = false,
    this.leftPadding = 0.0,
    this.topPadding = 0.0,
    this.rightPadding = 0.0,
    this.bottomPadding = 0.0,
    this.height = 80.0,
    this.fillColor = ColorsManager.grey100,
    this.isFilled = false,
    this.borderRadius = 8.0,
    this.leftContentPadding = 8.0,
    this.topContentPadding = 0.0, // = 20.0,
    this.rightContentPadding = 8.0,
    this.bottomContentPadding = 0.0, // = 20.0,
    this.minLines = 1,
    this.maxLines = 1,
    this.fontSize = 16.0,
    this.fontColor = Colors.black,
    this.isReadOnly = false,
    this.hintTexFontSize = 16,
    this.enabledBorderColor = ColorsManager.grey100,
    this.autofillHintsList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        leftPadding!,
        topPadding!,
        rightPadding!,
        bottomPadding!,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (inputTitle != null)
            CustomTextWidget(
              text: inputTitle,
              fontSize: fontSizeTitle,
              fontWeight: fontWeightTitle,
              color: titleColor,
            )
          else
            const SizedBox.shrink(),
          const SizedBox(height: AppSize.s4),
          Row(
            children: <Widget>[
              inputIcon ?? const SizedBox.shrink(),
              if (inputIcon != null)
                const SizedBox(width: 5.0)
              else
                const SizedBox.shrink(),
              Expanded(
                child: TextFormField(
                  controller: controller,
                  textAlign: textAlign ?? TextAlign.start,
                  textCapitalization:
                      textCapitalization ?? TextCapitalization.words,
                  // maxLines: obscureText ? 1 : null,
                  initialValue: initialText,
                  enabled: enabled,
                  keyboardType: keyboardType,
                  obscureText: obscureText!,
                  // obscureText: !showPassword,
                  cursorColor: ColorsManager.black,
                  maxLength: maxLength,
                  minLines: minLines,
                  maxLines: maxLines,
                  focusNode: focusNodeName,
                  autocorrect: autocorrect!,
                  enableSuggestions: enableSuggestions!,
                  readOnly: isReadOnly!,
                  autofillHints: autofillHintsList,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: fontColor,
                    // fontWeight: FontWeight.w400,
                  ),

                  decoration: InputDecoration(
                    // counterStyle: const TextStyle(
                    //   height: double.minPositive,
                    // ),
                    counterText: counter == true ? null : "",
                    // counter: counter == true
                    //     ? null
                    //     : Container(), // Validate Message
                    // focusColor: primary,
                    // errorText: errorText,
                    // errorStyle: const TextStyle(
                    //   fontSize: 16.0,
                    // ),

                    // prefixIcon: Icon(
                    //   prefixIcon,
                    //   // color: primary,
                    // ),
                    // focusColor: Colors.white,
                    // floatingLabelBehavior: FloatingLabelBehavior.never,
                    prefixIcon: prefixIcon,
                    prefixText: " ",
                    suffixIcon: suffixIcon,
                    filled: isFilled,
                    fillColor: fillColor,
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: hintTextColor,
                      fontSize: hintTexFontSize,
                    ),
                    // isDense: true,
                    // contentPadding: EdgeInsets.zero,
                    contentPadding: EdgeInsets.fromLTRB(
                      leftContentPadding!,
                      topContentPadding!,
                      rightContentPadding!,
                      bottomContentPadding!,
                    ), //const EdgeInsets.fromLTRB(12, 20, 12, 20), //default value:
                    border: OutlineInputBorder(
                      // borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          borderRadius!,
                        ),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius!),
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: ColorsManager.grey600,
                      ),
                    ),
                    enabledBorder: outlineInputBorder(
                      borderColor: enabledBorderColor,
                      borderRadius: borderRadius,
                    ),
                    // OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(borderRadius!),
                    //   borderSide: const BorderSide(
                    //     color: ColorsManager.grey100,
                    //   ),
                    // ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius!),
                      borderSide: const BorderSide(
                        color: ColorsManager.red,
                      ),
                    ),
                    // contentPadding: const EdgeInsets.only(
                    //   left: 8.0,
                    //   right: 8.0,
                    // ),
                  ),
                  textInputAction: inputAction,
                  //  isLastField!
                  //     ? TextInputAction.done
                  //     : TextInputAction.next,
                  // onEditingComplete: () {
                  //   if (!focusNodeName.hasPrimaryFocus) {
                  //     focusNodeName.unfocus();
                  //   }
                  //   FocusScope.of(context).requestFocus(focusnextNode);
                  // },
                  onFieldSubmitted: (value) {
                    if (!isLastField!) {
                      // if (!focusNodeName.hasPrimaryFocus) {
                      //   focusNodeName.unfocus();
                      // }
                      FocusScope.of(context).requestFocus(focusnextNode);
                      // FocusScope.of(context)
                      //     .focusInDirection(TraversalDirection.down);
                    } else if (onSubmitted != null) {
                      Future.delayed(const Duration(milliseconds: 300), () {
                        onSubmitted!(value);
                      });
                    }
                  },
                  validator: validator,
                  inputFormatters: inputFormatterList,
                  // inputFormatters: [
                  //   FilteringTextInputFormatter.allow(
                  //     textEditingController == phoneNumber1Controller ||
                  //             textEditingController == phoneNumber2Controller
                  //         ? RegExp(r'^[0-9\+]+$')
                  //         : RegExp(r"^.{1,50}$"),
                  //   ),
                  // ],
                  // validator: (value) {
                  //   if (value.isEmpty) {
                  //     if (obscureText != null && obscureText) {
                  //       return "Password is empty.";
                  //     }
                  //     if (inputType != null &&
                  //         inputType == TextInputType.emailAddress) {
                  //       return "Email is empty.";
                  //     } else if (inputTitle != null) {
                  //       return "$inputTitle is empty.";
                  //     } else {
                  //       return "This field is empty.";
                  //     }
                  //   } else if (value.length < 6) {
                  //     return "Password should be at least 6 characters.";
                  //   } else if (onValidator != null) {
                  //     return onValidator(value);
                  //   } else {
                  //     return null;
                  //   }
                  // },
                  // onSaved: (value) {
                  //   if (onSaved != null) {
                  //     onSaved(value);
                  //   }
                  // },
                  onSaved: onSaved,
                  onChanged: onChanged,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // InputDecoration setInputDecoration() {
  //   return InputDecoration(
  //     errorText: errorText,
  //     errorStyle: const TextStyle(
  //       fontSize: 12.0,
  //     ),
  //     prefixText: " ",
  //     filled: true,
  //     fillColor: AppColors.grey100,
  //     border: const OutlineInputBorder(
  //       borderSide: BorderSide.none,
  //       borderRadius: BorderRadius.all(
  //         Radius.circular(5.0),
  //       ),
  //     ),
  //     hintStyle: const TextStyle(
  //       color: Colors.grey,
  //     ),
  //     hintText: hintText,
  //   );
  // }
}

typedef OnValidator = String Function(String value);
