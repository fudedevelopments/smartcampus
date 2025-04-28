import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class ImageDisplay extends StatelessWidget {
  final Future<String> imageUrlFuture;
  final double? height; // Optional height
  final double? width; // Optional width
  final BoxFit fit; // Control how the image fits
  final Widget? loadingWidget; // Custom loading widget
  final Widget? errorWidget; // Custom error widget
  final int? maxHeight; // Maximum height for image quality
  final int? maxWidth; // Maximum width for image quality

  const ImageDisplay({
    super.key,
    required this.imageUrlFuture,
    this.height,
    this.width,
    this.fit = BoxFit.cover, // Default to cover
    this.loadingWidget, // Default loading is now skeleton
    this.errorWidget, // Default error
    this.maxHeight,
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    // Default skeleton loading
    final defaultLoadingWidget = Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        color: Colors.white,
      ),
    );

    // Default error widget
    final defaultErrorWidget = Container(
      height: height,
      width: width,
      color: Colors.grey.shade200,
      child: const Center(
        child: Icon(Icons.broken_image, color: Colors.grey),
      ),
    );

    return FutureBuilder<String>(
      future: imageUrlFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SizedBox(
              height: height,
              width: width,
              child: loadingWidget ?? defaultLoadingWidget,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: SizedBox(
              height: height,
              width: width,
              child: errorWidget ?? defaultErrorWidget,
            ),
          );
        } else if (snapshot.hasData) {
          return CachedNetworkImage(
            imageUrl: snapshot.data!,
            height: height,
            width: width,
            fit: fit,
            placeholder: (context, url) =>
                loadingWidget ?? defaultLoadingWidget,
            errorWidget: (context, url, error) =>
                errorWidget ?? defaultErrorWidget,
            // Improve image quality by setting higher cache dimensions
            memCacheHeight: maxHeight ??
                (height?.toInt() != null ? height!.toInt() * 2 : null),
            memCacheWidth: maxWidth ??
                (width?.toInt() != null ? width!.toInt() * 2 : null),
            // Improve image quality
            fadeInDuration: const Duration(milliseconds: 200),
            maxHeightDiskCache:
                maxHeight ?? 1024, // Higher resolution for disk cache
            maxWidthDiskCache:
                maxWidth ?? 1024, // Higher resolution for disk cache
          );
        } else {
          return Center(
            child: SizedBox(
              height: height,
              width: width,
              child: const Text('No image URL found'),
            ),
          );
        }
      },
    );
  }
}
