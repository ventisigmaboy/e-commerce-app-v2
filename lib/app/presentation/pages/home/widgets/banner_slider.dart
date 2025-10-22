import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'special_offer_banner.dart';

class BannerSlider extends StatefulWidget {
  final List<Map<String, String>> banners;
  final VoidCallback? onBannerTap;

  const BannerSlider({
    super.key,
    required this.banners,
    this.onBannerTap,
  });

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CarouselSlider(
          items: widget.banners.map((banner) {
            return SpecialOfferBanner(
              discount: banner['discount'] ?? '',
              title: banner['title'] ?? '',
              description: banner['description'] ?? '',
              imageUrl: banner['imageUrl'],
              onTap: widget.onBannerTap,
            );
          }).toList(),
          options: CarouselOptions(
            height: size.height * 0.15,
            viewportFraction: 1.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 12,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.banners.asMap().entries.map((entry) {
              return Container(
                width: _currentIndex == entry.key ? 16 : 4,
                height: 4,
                margin: const EdgeInsets.symmetric(horizontal: 2.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: _currentIndex == entry.key
                      ? Colors.black
                      : Colors.grey.shade400,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
