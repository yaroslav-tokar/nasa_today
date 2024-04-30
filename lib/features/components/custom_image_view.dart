import 'package:flutter/material.dart';

class CustomImageView extends StatelessWidget {
  const CustomImageView({
    required this.imageHeight,
    required this.imageWidth,
    required this.imageTag,
    this.onTap,
    this.imageUrl,
    super.key,
  });

  final String? imageUrl;
  final String imageTag;
  final double imageHeight;
  final double imageWidth;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final url = imageUrl;
    if (url == null) {
      return const Center(
        child: Icon(Icons.not_interested_sharp),
      );
    }

    return Center(
      child: Container(
        color: Colors.white,
        width: imageWidth,
        child: Hero(
          tag: imageTag,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Image.network(
                url,
                fit: BoxFit.contain,
                height: imageHeight,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;

                  return Center(
                    child: SizedBox(
                      height: imageHeight / 2,
                      width: imageHeight / 2,
                      child: const CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
