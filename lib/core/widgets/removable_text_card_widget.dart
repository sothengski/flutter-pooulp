import 'package:flutter/material.dart';

import '../core.dart';

class RemovableTextCardWidget extends StatelessWidget {
  final String? text;
  final VoidCallback? onRemove;

  const RemovableTextCardWidget({
    Key? key,
    this.text = '',
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppSize.s8,
        left: AppSize.s2,
        right: AppSize.s2,
        bottom: AppSize.s2,
      ),
      child: CustomBoxWidget(
        backgroundColor: ColorsManager.grey200,
        borderRadius: AppSize.s6,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextWidget(
              textAlign: TextAlign.center,
              text: '$text',
              fontWeight: FontWeightManager.regular,
              marginRight: AppSize.s4,
            ),
            InkWell(
              onTap: onRemove,
              child: const Icon(
                IconsManager.close,
                size: AppSize.s14,
                color: ColorsManager.grey600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
