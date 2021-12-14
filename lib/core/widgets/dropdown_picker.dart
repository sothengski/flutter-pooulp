import 'package:flutter/material.dart';

class DropdownPicker extends StatelessWidget {
  final List<dynamic> menuOptions;
  final String selectedOption;
  final void Function(String?)? onChanged;

  const DropdownPicker({
    Key? key,
    required this.menuOptions,
    required this.selectedOption,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration:
          const BoxDecoration(border: Border(bottom: BorderSide(width: 1.5))),
      child: Row(
        children: [
          // SvgPicture.asset(ImageConstants.languageIconSvg),
          const SizedBox(width: 20),
          Expanded(
            child: DropdownButton<String>(
              value: selectedOption,
              icon: const Icon(Icons.arrow_drop_down),
              isExpanded: true,
              onChanged: onChanged,
              underline: const SizedBox(),
              items: menuOptions
                  .map(
                    (data) => DropdownMenuItem<String>(
                      value: data.key.toString(),
                      child: Text(
                        data.value.toString(),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
