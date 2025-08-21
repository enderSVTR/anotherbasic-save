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
                'https://picsum.photos/600/300',
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
                      _buildGridIcon(
                        context,
                        CupertinoIcons.calendar,
                        'Calendar',
                      ),
                      _buildGridIcon(context, CupertinoIcons.map, 'Map'),
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
                'https://picsum.photos/600/300',
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
              'lorem ipsum Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
              'Sed euismod, nisl vel tincidunt fermentum, sapien justo cursus nulla, '
              'nec tincidunt lorem sapien nec nisi. Curabitur a felis ac nulla facilisis tincidunt. '
              'Integer vitae velit ut sapien gravida porta. Suspendisse potenti. Fusce euismod, '
              'justo at ultricies rhoncus, sapien sem convallis nulla, nec laoreet magna sapien in leo.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 12),
            const Text(
              'Praesent nec orci nec sapien bibendum tincidunt. Pellentesque habitant morbi tristique '
              'senectus et netus et malesuada fames ac turpis egestas. Vivamus vel turpis ac justo convallis '
              'convallis. Etiam ut diam vel sapien gravida dapibus. Nulla facilisi. Duis nec lorem nec sapien '
              'tincidunt convallis.',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
