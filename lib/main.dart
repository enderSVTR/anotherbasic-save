import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // For icons and colors

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Homepage Concept',
      home: HomePage(),
    );
  }
}

/// ------------------- HOMEPAGE -------------------
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Container(
              height: 50,
              color: Colors.brown,
              alignment: Alignment.center,
              child: const Text(
                'Homepage',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ),

            // Featured Image
            Container(
              margin: const EdgeInsets.all(16),
              height: 180,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.network(
                'https://game.intel.com/wp-content/uploads/2024/11/Arena-Breakout-Infinite-Season-Web-1920x1080-2-1024x576.jpg?x48957&x48957',
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CupertinoActivityIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Text('Image failed to load'));
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildGridIcon(
                        context,
                        CupertinoIcons.chat_bubble_2,
                        'Description',
                        goToDetail: true,
                      ),
                      _buildGridIcon(context, CupertinoIcons.calendar, 'games'),
                      _buildGridIcon(context, CupertinoIcons.map, 'Search'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildGridIcon(
                        context,
                        CupertinoIcons.settings,
                        'Settings',
                      ),
                      _buildGridIcon(
                        context,
                        CupertinoIcons.cloud_download,
                        'Download',
                      ),
                      _buildGridIcon(context, CupertinoIcons.book, 'Library'),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Navigation
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: CupertinoColors.systemGrey4),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBottomIcon(context, CupertinoIcons.home, 'Home'),
                  _buildBottomIcon(
                    context,
                    CupertinoIcons.person_crop_circle,
                    'Profile',
                  ),
                  _buildBottomIcon(
                    context,
                    CupertinoIcons.settings_solid,
                    'Settings',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridIcon(
    BuildContext context,
    IconData icon,
    String label, {
    bool goToDetail = false,
  }) {
    return GestureDetector(
      onTap: () {
        if (goToDetail) {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => const DetailScreen()),
          );
        }
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildBottomIcon(BuildContext context, IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        if (label == 'Profile') {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => const ProfilePage()),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 24, color: Colors.grey),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
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
            _buildMenuItem(CupertinoIcons.star_fill, Colors.green, 'customize'),
            _buildMenuItem(
              CupertinoIcons.moon,
              Colors.orange,
              'wishlist',
              trailing: '5',
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

/// ------------------- DETAIL SCREEN -------------------
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Detail'),
        previousPageTitle: 'Back',
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Replaced placeholder with Image.network
            Container(
              height: 180,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.network(
                'https://thegigletter.com/wp-content/uploads/2025/04/Blog-pic-1280x720-3.jpg',
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CupertinoActivityIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Text('Image failed to load'));
                },
              ),
            ),
            const SizedBox(height: 16),

            // Description Texts
            const Text(
              ' Arena Breakout is a tactical first-person shooter (FPS) that blends intense combat with high-stakes survival and extraction gameplay. Developed by Tencent’s MoreFun Studio and published globally by Level Infinite, the game challenges players to not just fight—but to escape with valuable loot before time runs out ',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),
            const Text(
              'available on mobile, and PC (separate game but still the same), Arena Breakout offers a rich, immersive experience with its realistic graphics, dynamic environments, and a wide array of weapons and gear. Players can team up in squads or go solo, navigating through various maps filled with both AI-controlled enemies and other players.'
              'you can customize over 48 real-world inspired guns and 700+ attachments let you build your perfect weapon.The Gunsmith system allows deep customization, affecting recoil, damage, and handling.'
              'you can download from google play store and app store, for pc version you can download it from [https://www.arenabreakoutinfinite.com/en/] and steam (coming soon)',
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
