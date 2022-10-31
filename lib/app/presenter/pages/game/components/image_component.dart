import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';

import '../../../../domain/entities/entities.dart';

import '../../../widgets/widgets.dart';

class ImageComponent extends StatelessWidget {
  final GameEntity game;

  const ImageComponent({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return game.cover != null
        ? CachedNetworkImageWidget(
            image: "${ApiConstants.apiUrlImagePrefix}"
                "${game.cover!.imageId}.jpg",
            fit: BoxFit.cover,
            borderRadius: BorderRadius.circular(0),
          )
        : Container();
  }
}
