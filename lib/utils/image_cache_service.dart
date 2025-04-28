import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ImageCacheService {
  // Singleton pattern
  static final ImageCacheService _instance = ImageCacheService._internal();
  factory ImageCacheService() => _instance;
  ImageCacheService._internal();

  // Cache to store image URLs
  final Map<String, String> _imageUrlCache = {};

  // Get image URL from cache or fetch it
  Future<String> getImageUrl(String path) async {
    // Return cached URL if available
    if (_imageUrlCache.containsKey(path)) {
      return _imageUrlCache[path]!;
    }

    try {
      // Fetch the URL if not cached
      final result = await Amplify.Storage.getUrl(
        path: StoragePath.fromString(path),
      ).result;

      final urlString = result.url.toString();

      // Cache the URL
      _imageUrlCache[path] = urlString;

      return urlString;
    } catch (e) {
      safePrint('Error fetching image URL: $e');
      rethrow;
    }
  }

  // Clear the URL cache
  void clearCache() {
    _imageUrlCache.clear();
  }

  // Remove a specific item from cache
  void removeFromCache(String path) {
    _imageUrlCache.remove(path);
  }

  // Clear both URL cache and image cache
  void clearAllCaches() {
    // Clear our URL cache
    clearCache();

    // Clear the Flutter image cache
    PaintingBinding.instance.imageCache.clear();
    PaintingBinding.instance.imageCache.clearLiveImages();

    // Clear the disk cache from CachedNetworkImage
    DefaultCacheManager().emptyCache();
  }
}
