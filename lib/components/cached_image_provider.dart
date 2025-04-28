import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smartcampus/utils/utils.dart';


class CachedImageProvider extends StatelessWidget {
  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BorderRadius? borderRadius;
  final int? maxHeight; // Maximum height for image quality
  final int? maxWidth; // Maximum width for image quality

  const CachedImageProvider({
    super.key,
    required this.imagePath,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.borderRadius,
    this.maxHeight,
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    // Default skeleton loading placeholder
    final defaultPlaceholder = Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius,
        ),
      ),
    );

    final defaultErrorWidget = Container(
      color: Colors.grey.shade200,
      child: const Center(
        child: Icon(Icons.broken_image, color: Colors.grey),
      ),
    );

    return FutureBuilder<String>(
      future: getimage(path: imagePath),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: borderRadius,
            ),
            child: placeholder ?? defaultPlaceholder,
          );
        } else if (snapshot.hasError || !snapshot.hasData) {
          return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: borderRadius,
            ),
            child: errorWidget ?? defaultErrorWidget,
          );
        } else {
          final imageWidget = CachedNetworkImage(
            imageUrl: snapshot.data!,
            height: height,
            width: width,
            fit: fit,
            placeholder: (context, url) => placeholder ?? defaultPlaceholder,
            errorWidget: (context, url, error) =>
                errorWidget ?? defaultErrorWidget,
            // Improve image quality by setting higher cache dimensions
            memCacheHeight: maxHeight ??
                (height?.toInt() != null ? height!.toInt() * 2 : null),
            memCacheWidth: maxWidth ??
                (width?.toInt() != null ? width!.toInt() * 2 : null),
            cacheKey: snapshot.data,
            // Improve image quality
            fadeInDuration: const Duration(milliseconds: 200),
            maxHeightDiskCache:
                maxHeight ?? 1024, // Higher resolution for disk cache
            maxWidthDiskCache:
                maxWidth ?? 1024, // Higher resolution for disk cache
          );

          if (borderRadius != null) {
            return ClipRRect(
              borderRadius: borderRadius!,
              child: imageWidget,
            );
          }

          return imageWidget;
        }
      },
    );
  }
}
