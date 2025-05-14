import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductionCompanyLogo extends StatelessWidget {
  final String logoUrl;

  const ProductionCompanyLogo({
    super.key,
    required this.logoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CachedNetworkImage(
            imageUrl: logoUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
