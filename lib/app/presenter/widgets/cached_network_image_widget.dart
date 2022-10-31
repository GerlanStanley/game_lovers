import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String? image;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final BoxFit? fit;
  final EdgeInsets? margin;

  const CachedNetworkImageWidget({
    Key? key,
    this.image,
    this.width,
    this.height,
    this.borderRadius,
    this.fit,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        child: SizedBox(
          width: width,
          height: height,
          child: image == null
              ? Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: borderRadius ?? BorderRadius.circular(12),
                  ),
                )
              : CachedNetworkImage(
                  imageUrl: image!,
                  fit: fit,
                  placeholder: (context, url) => Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) {
                    return Container(
                      width: width,
                      height: height,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: borderRadius ?? BorderRadius.circular(12),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
