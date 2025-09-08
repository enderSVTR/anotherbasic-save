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
      title: 'GameStore',
      home: HomePage(),
    );
  }
}

/// ------------------- HOMEPAGE -------------------
/// ------------------- HOMEPAGE -------------------
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> games = const [
    {
      "title": "Arena Breakout",
      "image":
          "https://game.intel.com/wp-content/uploads/2024/11/Arena-Breakout-Infinite-Season-Web-1920x1080-2-1024x576.jpg?x48957&x48957",
      "desc":
          "Arena Breakout: Infinite is a hyper-realistic tactical extraction shooter developed and published by MoreFun Studios. Released on August 13, 2024, it features five distinct maps—Farm, Valley, Northridge, Armory, and TV Station—each demanding unique raid strategies. The game emphasizes realism with dynamic weather, over 900 weapon mods, and a deep gunsmith system. Recent updates include a Cyberpunk 2077 crossover event, anti-cheat enhancements, and the introduction of a Trophy Room system for showcasing loot. Arena Breakout supports solo and squad modes, with fair play enforced through killcams and automatic compensation for losses due to cheating. Minimum PC requirements include a Core i5-7500, 16GB RAM, and GTX 960. Recommended specs push toward Core i7-10700KF, 32GB RAM, and RTX 2080. While mobile specs aren’t officially listed, the game demands high-end performance and is best suited for flagship devices",
    },
    {
      "title": "Valorant Mobile",
      "image":
          "https://gamebrott.com/wp-content/uploads/2022/10/Fakta-Valorant-mobile-750x375.jpg",
      "desc":
          "Valorant Mobile is Riot Games’ tactical 5v5 shooter adapted for mobile, developed in partnership with Tencent. It launched exclusively in China on August 19, 2025, featuring 18 agents, 7 core maps, and 10 game modes including Competitive, Spike Rush, and Deathmatch. The mobile version retains the PC game’s strategic depth, agent synergy, and fast-paced combat.The launch patch focused on agent balance, UI polish, and server stability. Riot invested heavily in mobile esports infrastructure, aiming to expand globally by the end of 2025. While no global release date is confirmed, regional rollouts are expected. Valorant Mobile runs on Android 5.0+ with Snapdragon 450 or better, and iOS 12+ on iPhone 6s or newer. It’s optimized for mid-range devices and includes touch controls, with potential gamepad support in future updates",
    },
    {
      "title": "Warframe mobile",
      "image":
          "https://static0.thegamerimages.com/wordpress/wp-content/uploads/2022/10/Warframe-Excalibur-And-Styanax.jpg?q=50&fit=crop&w=1100&h=618&dpr=1.5",
      "desc":
          "Warframe Mobile is a sci-fi third-person looter-shooter set in a galaxy torn by war. Developed and published by Digital Extremes, it brings the full Warframe experience—including mechs, swordplay, open-world raids, and faction warfare—to mobile platforms. The game supports cross-platform save and play, allowing Tenno to continue their progress across PC, console, and mobile. The iOS version launched globally on February 20, 2024, while the Android release is expected in early 2025. Recent updates include the Warframe: 1999 expansion, accessibility improvements, and new questlines. Players can explore planets like Earth, Venus, and Mercury, and take on missions like Vor’s Prize and Once Awake. On iOS, Warframe Mobile requires iOS 14+ and an A12 Bionic chip or better. Android specs are still being finalized, but mid-range devices with Snapdragon 720G or equivalent are expected to be supported. The game supports touch controls and Bluetooth gamepads, offering a full-featured experience on mobile",
    },
    {
      "title": "Delta Force Mobile",
      "image":
          "https://egw.news/_next/image?url=https%3A%2F%2Fegw.news%2Fuploads%2Fnews%2F1%2F17%2F1745397804119_1745397804120.webp&w=1920&q=75",
      "desc":
          "Delta Force Mobile is a next-gen tactical FPS developed by Team Jade under TiMi Studio Group and published by Garena. It brings large-scale warfare, extraction missions, and operator-based combat to mobile and PC. Players engage in battles across seven launch maps like Knife Edge and Trainwreck, using over 50 weapons and 12 vehicles. The game features unique operators with class gadgets and abilities, including recon, support, and engineer roles. The game officially launched on April 21, 2025, for Android and iOS, with console versions following in August. The latest update introduced new maps, balance tweaks for operators, and UI improvements. Delta Force avoids pay-to-win mechanics and supports cross-platform progression. Minimum requirements include Android 8.0+, 4GB RAM, and Snapdragon 660 or higher. On iOS, it runs on iPhone 8 or newer. Playability is smooth on mid-range devices, with tactical depth and squad coordination at its core",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Container(
              height: 48,
              color: CupertinoColors.white, // ✅ white bar
              alignment: Alignment.center,
              child: const Text(
                'GameStore',
                style: TextStyle(
                  color: CupertinoColors.black, // ✅ black text
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // ✅ Featured Image Slider
            SizedBox(
              height: 160,
              child: PageView(
                children: games.map((game) => _buildBanner(game)).toList(),
              ),
            ),

            const SizedBox(height: 6),

            // ✅ Game List
            Expanded(
              child: ListView.builder(
                itemCount: games.length,
                itemBuilder: (context, index) {
                  final game = games[index];
                  return _buildGameCard(context, game);
                },
              ),
            ),

            // ✅ Bottom Navigation
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
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

  static Widget _buildBanner(Map<String, String> game) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Image.network(game["image"]!, fit: BoxFit.cover),
    );
  }

  static Widget _buildGameCard(BuildContext context, Map<String, String> game) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6, // ✅ keep light card background
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              game["image"]!,
              width: 70,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  game["title"]!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.black, // ✅ black title
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  game["desc"]!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: CupertinoColors.black, // ✅ black description
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          CupertinoButton(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ), // compact
            minSize: 28,
            color: CupertinoColors.activeBlue,
            child: const Text("Get", style: TextStyle(fontSize: 12)),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => DetailScreen(game: game),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  static Widget _buildBottomIcon(
    BuildContext context,
    IconData icon,
    String label,
  ) {
    return GestureDetector(
      onTap: () {
        if (label == 'Profile') {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => const ProfilePage()),
          );
        } else if (label == 'Settings') {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => const SettingsPage()),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 22, color: Colors.grey),
          const SizedBox(height: 2),
          Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
        ],
      ),
    );
  }
}

/// ------------------- DETAIL SCREEN -------------------
class DetailScreen extends StatelessWidget {
  final Map<String, String> game;
  const DetailScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(game["title"]!)),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(14),
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                game["image"]!,
                height: 180, // reduced for phone
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              game["title"]!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(game["desc"]!, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 16),
            CupertinoButton.filled(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: const Text(
                "Download / Install",
                style: TextStyle(fontSize: 14),
              ),
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (_) => CupertinoAlertDialog(
                    title: Text("Downloading ${game["title"]}"),
                    content: const Text("Your download has started..."),
                    actions: [
                      CupertinoDialogAction(
                        child: const Text("OK"),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// ------------------- PROFILE PAGE -------------------
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Profile')),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // ✅ Avatar & Basic Info
            Center(
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 40,
                    child: Icon(CupertinoIcons.person, size: 40),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "William Carter VII",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "willcrtr1267t@gmail.com",
                    style: TextStyle(
                      color: CupertinoColors.systemGrey,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "#HilalEnder",
                    style: TextStyle(
                      color: CupertinoColors.systemGrey,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),

            const Text(
              "Account Management",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: CupertinoColors.activeBlue,
              ),
            ),
            const SizedBox(height: 10),

            // ✅ Security & Account Management
            const _ProfileItem(
              icon: CupertinoIcons.lock,
              title: "Security & Account Management",
            ),

            // ✅ Avatar/Profile Picture
            const _ProfileItem(
              icon: CupertinoIcons.photo,
              title: "Avatar / Profile Picture",
            ),

            // ✅ Username / Display Name
            const _ProfileItem(
              icon: CupertinoIcons.person,
              title: "Username / Display Name",
              subtitle: "William Carter VII",
            ),

            // ✅ Email / Phone
            const _ProfileItem(
              icon: CupertinoIcons.mail,
              title: "Email / Phone",
              subtitle: "willcrtr1267t@gmail.com",
            ),

            // ✅ Account ID / Tagline
            const _ProfileItem(
              icon: CupertinoIcons.number,
              title: "Account ID / Tagline",
              subtitle: "#HilalEnder",
            ),

            const SizedBox(height: 20),
            const Text(
              "Activity & Privacy",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: CupertinoColors.activeBlue,
              ),
            ),
            const SizedBox(height: 10),

            // ✅ Download history
            const _ProfileItem(
              icon: CupertinoIcons.cloud_download,
              title: "Download History",
            ),

            // ✅ Privacy settings
            const _ProfileItem(
              icon: CupertinoIcons.shield,
              title: "Privacy Settings",
            ),
          ],
        ),
      ),
    );
  }
}

/// 🔹 Reusable Profile Item Widget
class _ProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;

  const _ProfileItem({required this.icon, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, size: 22, color: CupertinoColors.activeBlue),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
              ],
            ),
          ),
          const Icon(CupertinoIcons.forward, size: 18, color: Colors.grey),
        ],
      ),
    );
  }
}

/// ------------------- SETTINGS PAGE -------------------
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Settings')),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // ✅ Preferences
            const Text(
              "Preferences",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: CupertinoColors.activeBlue,
              ),
            ),
            const SizedBox(height: 10),

            const _SettingsItem(
              icon: CupertinoIcons.moon,
              title: "Dark Mode",
              hasSwitch: true,
            ),
            const _SettingsItem(
              icon: CupertinoIcons.bell,
              title: "Notifications",
            ),
            const _SettingsItem(
              icon: CupertinoIcons.globe,
              title: "Language",
              subtitle: "English (US)",
            ),

            const SizedBox(height: 20),

            // ✅ Account & Security
            const Text(
              "Account & Security",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: CupertinoColors.activeBlue,
              ),
            ),
            const SizedBox(height: 10),

            const _SettingsItem(icon: CupertinoIcons.lock, title: "Privacy"),
            const _SettingsItem(
              icon: CupertinoIcons.shield_lefthalf_fill,
              title: "Security",
            ),
            const _SettingsItem(
              icon: CupertinoIcons.arrow_right_square,
              title: "Logout",
            ),

            const SizedBox(height: 20),

            // ✅ About Section
            const Text(
              "About",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: CupertinoColors.activeBlue,
              ),
            ),
            const SizedBox(height: 10),

            const _SettingsItem(
              icon: CupertinoIcons.info,
              title: "App Version",
              subtitle: "1.0.0",
            ),
            const _SettingsItem(
              icon: CupertinoIcons.doc_text,
              title: "Terms of Service",
            ),
            const _SettingsItem(
              icon: CupertinoIcons.shield,
              title: "Privacy Policy",
            ),
          ],
        ),
      ),
    );
  }
}

/// 🔹 Reusable Settings Item Widget
class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final bool hasSwitch;

  const _SettingsItem({
    required this.icon,
    required this.title,
    this.subtitle,
    this.hasSwitch = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, size: 22, color: CupertinoColors.activeBlue),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
              ],
            ),
          ),
          hasSwitch
              ? CupertinoSwitch(
                  value: false,
                  onChanged: (val) {
                    // Handle switch state change
                  },
                )
              : const Icon(
                  CupertinoIcons.forward,
                  size: 18,
                  color: Colors.grey,
                ),
        ],
      ),
    );
  }
}
