import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../core.dart';

class CachedNetworkImgWidget extends StatelessWidget {
  final String? imgUrl;
  final double? borderRadius;
  final bool? isHost;
  final double iconSize;

  const CachedNetworkImgWidget({
    required this.imgUrl,
    this.borderRadius = 0.0,
    this.isHost = true,
    this.iconSize = AppSize.s20,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imgUrl! != ''
        ? CachedNetworkImage(
            imageUrl: isHost == true ? '${API.host}$imgUrl' : imgUrl!,
            imageBuilder: (
              context,
              imageProvider,
            ) =>
                Container(
              decoration: BoxDecoration(
                // shape: BoxShape.circle,
                border: Border.all(
                  color: ColorsManager.white,
                  width: 0,
                ),
                borderRadius: BorderRadius.circular(
                  borderRadius!,
                ),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            placeholder: (context, url) => LoadingWidget(
              size: iconSize,
            ),
            errorWidget: (
              context,
              url,
              error,
            ) =>
                Icon(
              Icons.error,
              color: ColorsManager.grey,
              size: iconSize,
            ),
          )
        : Icon(
            Icons.image_outlined,
            color: ColorsManager.grey,
            size: iconSize,
          );
  }
}
