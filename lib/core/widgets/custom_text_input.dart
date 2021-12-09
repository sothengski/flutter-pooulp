import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core.dart';

class CustomTextInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? inputTitle;
  final String? hintText;
  final TextInputType? inputType;
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
  final Widget? inputIcon;
  final IconData? prefixIcon;
  final TextCapitalization? textCapitalization;
  final TextAlign? textAlign;
  final int? maxLength;
  final FocusNode? focusNodeName;
  final FocusNode? focusnextNode;
  final bool? counter;
  // final ValueChanged<String> onChanged;
  final bool? showPassword;
  final Function? changeShowPassword;
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

  const CustomTextInput({
    this.controller,
    this.inputTitle,
    this.hintText,
    this.inputType,
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
    this.fillColor = AppColors.grey100Color,
    this.isFilled = false,
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
            Text(
              inputTitle!,
            )
          else
            const SizedBox.shrink(),
          const SizedBox(height: 5.0),
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
                      textCapitalization ?? TextCapitalization.none,
                  // maxLines: obscureText ? 1 : null,
                  initialValue: initialText,
                  enabled: enabled,
                  keyboardType: inputType,
                  obscureText: obscureText!,
                  // obscureText: !showPassword,
                  cursorColor: AppColors.blackColor,
                  maxLength: maxLength,
                  focusNode: focusNodeName,
                  autocorrect: autocorrect!,
                  enableSuggestions: enableSuggestions!,

                  decoration: InputDecoration(
                    counterStyle: const TextStyle(
                      height: double.minPositive,
                    ),
                    counterText: "",
                    // counter: counter == true ? null : Container(),
                    // focusColor: primaryColor,
                    // errorText: errorText,
                    errorStyle: const TextStyle(
                      fontSize: 16.0,
                    ),

                    // prefixIcon: Icon(
                    //   prefixIcon,
                    //   // color: primaryColor,
                    // ),
                    prefixText: " ",
                    suffixIcon: obscureText!
                        ? IconButton(
                            icon: const Icon(
                              Icons.visibility_outlined,
                              color: AppColors.grey400Color,
                            ),
                            onPressed: () => changeShowPassword,
                          )
                        : null,
                    filled: isFilled,
                    fillColor: fillColor,

                    border: const OutlineInputBorder(
                      // borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          10.0,
                        ),
                      ),
                    ),
                    hintText: hintText,
                    hintStyle: const TextStyle(
                      color: AppColors.grey400Color,
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: AppColors.grey800Color,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.grey300Color,
                      ),
                    ),
                    // contentPadding: const EdgeInsets.only(
                    //   left: 8.0,
                    //   right: 8.0,
                    // ),
                  ),
                  textInputAction: isLastField!
                      ? TextInputAction.done
                      : TextInputAction.next,
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
  //     fillColor: AppColors.grey100Color,
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
