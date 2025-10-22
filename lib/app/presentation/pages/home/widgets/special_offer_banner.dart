import 'package:flutter/material.dart';

class SpecialOfferBanner extends StatelessWidget {
  final String discount;
  final String title;
  final String description;
  final String? imageUrl;
  final VoidCallback? onTap;

  const SpecialOfferBanner({
    super.key,
    required this.discount,
    required this.title,
    required this.description,
    this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * 0.12,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            if (imageUrl != null)
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
                    height: size.height * 0.1,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(color: Colors.grey.shade300);
                    },
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      discount,
                      style: TextStyle(
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Flexible(
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        description,
                        style: TextStyle(
                          fontSize: size.width * 0.025,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
