import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:top_institute/core/widget/app_theme.dart';
import '../constant/image_path.dart';

class AppCustomCachedNetworkImage extends StatefulWidget {
  const AppCustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.radius,
    this.color,
    this.margin,
    this.alignment,
    this.padding,
    this.borderRadius,
    this.isProvid = false,
    this.iscircle = false,
    this.showBorder = false,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final double? radius;
  final bool iscircle;
  final bool isProvid;
  final bool showBorder;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;

  @override
  State<AppCustomCachedNetworkImage> createState() =>
      _AppCustomCachedNetworkImageState();
}

class _AppCustomCachedNetworkImageState
    extends State<AppCustomCachedNetworkImage> {
  bool providError = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: widget.alignment,
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      padding: widget.padding,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        image: widget.isProvid
            ? DecorationImage(
                fit: widget.fit,
                image: providError
                    ? const AssetImage(kImageBreakfastCuisine) as ImageProvider
                    : CachedNetworkImageProvider(
                        widget.imageUrl,
                        errorListener: (p0) {
                          setState(() {
                            providError = true;
                          });
                        },
                      ),
              )
            : null,
        color: widget.color,
        borderRadius: widget.radius != null
            ? BorderRadius.circular(widget.radius!)
            : widget.borderRadius,
        border:
            widget.showBorder ? Border.all(color: kColorMain, width: 2) : null,
        shape: widget.iscircle ? BoxShape.circle : BoxShape.rectangle,
      ),
      child: widget.isProvid
          ? null
          : CachedNetworkImage(
              imageUrl: widget.imageUrl,
              fit: widget.fit,
              placeholder: (context, url) => LottieBuilder.asset(
                kLottieLoadingRed,
                width: widget.width,
                height: widget.height,
              ),
              errorWidget: (context, url, error) => Container(
                color: widget.color ?? kColorOffWhite,
                child: Image.asset(
                  kImageBreakfastCuisine,
                  width: widget.width,
                  height: widget.height,
                ),
              ),
            ),
    );
  }
}
