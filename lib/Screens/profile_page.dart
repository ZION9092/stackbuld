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
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                ListTile(
                  leading: Icon(Iconsax.user_edit, color: Colors.blue.shade900),
                  title: const Text('Account Settings'),
                  onTap: () {
                  },
                ),
                const Divider(),
                ListTile(
                  leading:
                      Icon(Iconsax.notification, color: Colors.blue.shade900),
                  title: const Text('Notifications'),
                  onTap: () {
                  },
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Iconsax.card, color: Colors.blue.shade900),
                  title: const Text('Payment Methods'),
                  onTap: () {},
                ),
                const Divider(),
                // Security
                ListTile(
                  leading: Icon(Iconsax.lock, color: Colors.blue.shade900),
                  title: const Text('Security'),
                  onTap: (){},
                ),
                const Divider(),
                
                ListTile(
                  leading: Icon(Iconsax.support, color: Colors.blue.shade900),
                  title: const Text('Help & Support'),
                  onTap: () {
                   
                  },
                ),
                const Divider(),
                
                ListTile(
                  leading: const Icon(Iconsax.logout, color: Colors.red),
                  title: const Text('Logout'),
                  onTap: () {
                    
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

