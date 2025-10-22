import 'package:flutter/material.dart';

class ProfileMenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? trailing;
  final VoidCallback? onTap;
  final bool isLogout;
  final Widget? trailingWidget;

  const ProfileMenuTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
    this.isLogout = false,
    this.trailingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      leading: Icon(
        icon,
        size: 24,
        color: isLogout ? Colors.red : Colors.black87,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: isLogout ? Colors.red : Colors.black87,
        ),
      ),
      trailing: trailingWidget ??
          (trailing != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      trailing!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.chevron_right,
                      size: 24,
                      color: Colors.black54,
                    ),
                  ],
                )
              : const Icon(
                  Icons.chevron_right,
                  size: 24,
                  color: Colors.black54,
                )),
    );
  }
}
