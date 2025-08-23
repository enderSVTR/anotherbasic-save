import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // Only for icons and colors

void main() {
  runApp(const ProfilePage());
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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

  // Keep _buildProfileCard and _buildMenuItem methods here
}
