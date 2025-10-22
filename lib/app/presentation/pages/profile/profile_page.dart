import 'package:flutter/material.dart';
import 'widgets/profile_menu_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Icon(
            Icons.flutter_dash,
            color: Colors.black,
            size: 28,
          ),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz,
              color: Colors.black,
              size: 28,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            // Profile Picture Section
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey.shade200,
                        width: 2,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade200,
                            child: const Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Name
            const Text(
              'Andrew Ainsley',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            // Phone Number
            Text(
              '+1 111 467 378 399',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 24),
            const Divider(height: 1),
            const SizedBox(height: 8),
            // Menu Items
            ProfileMenuTile(
              icon: Icons.person_outline,
              title: 'Edit Profile',
              onTap: () {},
            ),
            ProfileMenuTile(
              icon: Icons.location_on_outlined,
              title: 'Address',
              onTap: () {},
            ),
            ProfileMenuTile(
              icon: Icons.notifications_outlined,
              title: 'Notification',
              onTap: () {},
            ),
            ProfileMenuTile(
              icon: Icons.payment_outlined,
              title: 'Payment',
              onTap: () {},
            ),
            ProfileMenuTile(
              icon: Icons.security_outlined,
              title: 'Security',
              onTap: () {},
            ),
            ProfileMenuTile(
              icon: Icons.language_outlined,
              title: 'Language',
              trailing: 'English (US)',
              onTap: () {},
            ),
            ProfileMenuTile(
              icon: Icons.dark_mode_outlined,
              title: 'Dark Mode',
              trailingWidget: Switch(
                value: false,
                onChanged: (value) {},
                activeColor: Colors.teal,
              ),
            ),
            ProfileMenuTile(
              icon: Icons.lock_outline,
              title: 'Privacy Policy',
              onTap: () {},
            ),
            ProfileMenuTile(
              icon: Icons.help_outline,
              title: 'Help Center',
              onTap: () {},
            ),
            ProfileMenuTile(
              icon: Icons.people_outline,
              title: 'Invite Friends',
              onTap: () {},
            ),
            const SizedBox(height: 8),
            ProfileMenuTile(
              icon: Icons.logout,
              title: 'Logout',
              isLogout: true,
              onTap: () {},
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
