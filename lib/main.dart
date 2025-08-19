import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // Only for icons and colors

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Profile')),
      child: SafeArea(
        child: ListView(
          children: [
            _buildProfileCard(),
            const SizedBox(height: 10),
            _buildMenuItem(
              CupertinoIcons.doc_text,
              Colors.orange,
              'Terms of Use',
            ),
            _buildMenuItem(CupertinoIcons.lock, Colors.blue, 'Privacy Policy'),
            _buildMenuItem(
              CupertinoIcons.star_fill,
              Colors.green,
              'Upgrade to Plus',
            ),
            _buildMenuItem(
              CupertinoIcons.moon,
              Colors.orange,
              'Theme Mode',
              trailing: 'System',
            ),
            _buildMenuItem(
              CupertinoIcons.globe,
              Colors.blue,
              'App Language',
              trailing: 'English',
            ),
            _buildMenuItem(
              CupertinoIcons.bell,
              Colors.orange,
              'Notifications & Sounds',
            ),
            _buildMenuItem(
              CupertinoIcons.square_arrow_right,
              Colors.red,
              'Log out',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      margin: const EdgeInsets.all(14.0),
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemBrown,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CircleAvatar(radius: 25, child: Icon(CupertinoIcons.person)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'william carter VII',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  'willcrtr1267t@gmail.com',
                  style: TextStyle(
                    color: CupertinoColors.systemBackground,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    IconData icon,
    Color color,
    String text, {
    String? trailing,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: CupertinoListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color),
        ),
        title: Text(text),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (trailing != null)
              Text(
                trailing,
                style: const TextStyle(color: CupertinoColors.systemGrey),
              ),
            const Icon(
              CupertinoIcons.forward,
              size: 16,
              color: CupertinoColors.systemGrey,
            ),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}

/// Custom CupertinoListTile since it's not built-in
class CupertinoListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const CupertinoListTile({
    super.key,
    required this.leading,
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            leading,
            const SizedBox(width: 12),
            Expanded(child: title),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
