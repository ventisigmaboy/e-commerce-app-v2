import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final String greeting;
  final String userName;
  final String? avatarUrl;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onFavoriteTap;

  const HomeHeader({
    super.key,
    required this.greeting,
    required this.userName,
    this.avatarUrl,
    this.onNotificationTap,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey.shade300,
          backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl!) : null,
          child: avatarUrl == null
              ? const Icon(Icons.person, size: 30, color: Colors.white)
              : null,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              greeting,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            Text(
              userName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: onNotificationTap ?? () {},
          icon: const Icon(Icons.notifications_outlined),
          iconSize: 28,
        ),
        IconButton(
          onPressed: onFavoriteTap ?? () {},
          icon: const Icon(Icons.favorite_border),
          iconSize: 28,
        ),
      ],
    );
  }
}
