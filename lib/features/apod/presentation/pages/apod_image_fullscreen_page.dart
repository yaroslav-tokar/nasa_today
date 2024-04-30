import 'package:flutter/material.dart';
import 'package:nasa_today/features/components/custom_image_view.dart';

class ApodImageFullscreenPage extends StatelessWidget {
  const ApodImageFullscreenPage({
    required this.imageTag,
    required this.imageUrl,
    required this.size,
    super.key,
  });

  final String imageUrl;
  final Size size;
  final String imageTag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomImageView(
          onTap: () => Navigator.of(context).pop(),
          imageUrl: imageUrl,
          imageHeight: size.width,
          imageWidth: size.height,
          imageTag: imageTag,
        ),
      ),
    );
  }
}
