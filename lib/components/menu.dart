import 'package:flutter/material.dart';
import 'package:tp/services/auth.dart';

import 'UIColors.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  late AuthService authService;
  late String? userName = "";
  bool isLoading = false;
  void logout() {
    setState(() {
      isLoading = true;
    });
    authService.logout().then((val) {
      Navigator.pushNamed(context, "/");
    });
  }

  @override
  void initState() {
    super.initState();
    authService = AuthService();
    userName = authService.getCurrentUser()?.displayName;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: UIColors.black,
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: UIColors.white,
                  radius: 30,
                  child: Icon(
                    Icons.person_2,
                    size: 30,
                    color: UIColors.black,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    userName ?? "Guest",
                    style: const TextStyle(
                      color: UIColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ExpansionTile(
                  title: const Text(
                    "Image Classification Model",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, "/ann");
                      },
                      title: const Text("ANN Model"),
                      leading: const Icon(Icons.layers),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, "/cnn");
                      },
                      title: const Text("CNN Model"),
                      leading: const Icon(Icons.image),
                    ),
                  ],
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/voa');
                  },
                  title: const Text("Vocal Assistant"),
                  leading: const Icon(Icons.mic),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, "/spp");
                  },
                  title: const Text("Stock Price Prediction"),
                  leading: const Icon(Icons.show_chart),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, "/rag");
                  },
                  title: const Text("RAG"),
                  leading: const Icon(Icons.auto_fix_high),
                ),
              ],
            ),
          ),
          const Spacer(),
          isLoading
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: CircularProgressIndicator(),
                )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: ElevatedButton(
              onPressed: logout,
              style: ElevatedButton.styleFrom(
                backgroundColor: UIColors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                "Log Out",
                style: TextStyle(fontSize: 16, color: UIColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
