import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Profile Header Section
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
              color: Colors.blue.shade900,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile title and Edit Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Profile",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: Colors.white),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          // Handle Edit Profile
                        },
                        child: Text(
                          "Edit Profile",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Colors.blue.shade900),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Profile Image, Name, and Email
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 45,
                        backgroundImage:
                            AssetImage('assets/images/profile_placeholder.png'),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'John Doe',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            'johndoe@example.com',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.white70),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Profile Options Section
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                // Account Settings
                ListTile(
                  leading: Icon(Iconsax.user_edit, color: Colors.blue.shade900),
                  title: const Text('Account Settings'),
                  onTap: () {
                    // Handle Account Settings
                  },
                ),
                const Divider(),
                // Notifications
                ListTile(
                  leading:
                      Icon(Iconsax.notification, color: Colors.blue.shade900),
                  title: const Text('Notifications'),
                  onTap: () {
                    // Handle Notifications
                  },
                ),
                const Divider(),
                // Payment Methods
                ListTile(
                  leading: Icon(Iconsax.card, color: Colors.blue.shade900),
                  title: const Text('Payment Methods'),
                  onTap: () {
                    // Handle Payment Methods
                  },
                ),
                const Divider(),
                // Security
                ListTile(
                  leading: Icon(Iconsax.lock, color: Colors.blue.shade900),
                  title: const Text('Security'),
                  onTap: () {
                    // Handle Security
                  },
                ),
                const Divider(),
                // Help and Support
                ListTile(
                  leading: Icon(Iconsax.support, color: Colors.blue.shade900),
                  title: const Text('Help & Support'),
                  onTap: () {
                    // Handle Help & Support
                  },
                ),
                const Divider(),
                // Logout
                ListTile(
                  leading: const Icon(Iconsax.logout, color: Colors.red),
                  title: const Text('Logout'),
                  onTap: () {
                    // Handle Logout
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

