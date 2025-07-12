import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EnhancedNetworkImageWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final String? imageUrl;
  final BoxFit fit;
  final Widget? placeHolderWidget;
  final String? fallbackAssetImage;
  final ImageWidgetBuilder? imageBuilder;
  final bool cacheImage;
  final Duration fadeInDuration;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final bool showLoadingIndicator;
  final bool useShimmerEffect;
  final Color shimmerBaseColor;
  final Color shimmerHighlightColor;
  final BoxShape shape;

  const EnhancedNetworkImageWidget({
    super.key,
    this.height,
    this.imageUrl,
    this.fit = BoxFit.cover,
    this.placeHolderWidget,
    this.imageBuilder,
    this.width = double.infinity,
    this.fallbackAssetImage,
    this.cacheImage = true,
    this.color,
    this.fadeInDuration = const Duration(milliseconds: 300),
    this.borderRadius,
    this.border,
    this.showLoadingIndicator = true,
    this.useShimmerEffect = true,
    this.shimmerBaseColor = const Color(0xFFE0E0E0),
    this.shimmerHighlightColor = const Color(0xFFF5F5F5),
    this.shape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    // If imageUrl is null or empty, show the fallback asset image
    if (imageUrl == null || imageUrl!.isEmpty) {
      return _buildContainer(
        Image.asset(
          fallbackAssetImage!,
          height: height,
          width: width,
          fit: fit,
          color: color,
        ),
      );
    }

    return cacheImage
        ? _buildContainer(
      CachedNetworkImage(
        width: width,
        height: height,
        imageUrl: imageUrl!,
        color: color,
        fit: fit,
        imageBuilder: imageBuilder,
        fadeInDuration: fadeInDuration,
        placeholder: (context, url) => _buildPlaceholder(context),
        errorWidget: (context, url, error) => _buildErrorWidget(),
      ),
    )
        : _buildContainer(
      Image.network(
        imageUrl!,
        height: height,
        width: width,
        fit: fit,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return SizedBox(height: height, child: _buildPlaceholder(context));
        },
        errorBuilder: (context, error, stackTrace) {
          return _buildErrorWidget();
        },
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    if (placeHolderWidget != null) {
      return placeHolderWidget!;
    }

    if (useShimmerEffect) {
      return Shimmer.fromColors(
        baseColor: shimmerBaseColor,
        highlightColor: shimmerHighlightColor,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: borderRadius,
            shape: shape,
          ),
        ),
      );
    }

    return showLoadingIndicator
        ? Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: Theme.of(context).primaryColor,
        ),
      ),
    )
        : _buildFallbackAssetImage();
  }

  Widget _buildErrorWidget() {
    return _buildFallbackAssetImage();
  }

  Widget _buildFallbackAssetImage() {
    return Image.asset(
      fallbackAssetImage!,
      height: height,
      width: width,
      fit: fit,
      color: color,
    );
  }

  Widget _buildContainer(Widget child) {
    if (borderRadius != null || border != null) {
      return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: border,
        ),
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.zero,
          child: child,
        ),
      );
    }
    return child;
  }
}