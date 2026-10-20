import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 12),

          // Foto profil
          Stack(
            children: [
              const CircleAvatar(
                radius: 42,
                backgroundColor: Color(0xFFE5E7EB),
                child: Icon(
                  Icons.person,
                  size: 44,
                  color: Colors.black38,
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.black87,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.edit,
                    size: 10,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          const Text(
            'Alex Gilles',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 24),

          // Kartu data diri
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0F000000),
                  blurRadius: 16,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: const Column(
              children: [
                ListTile(
                  leading: Icon(Icons.phone_outlined),
                  title: Text(
                    'PHONE',
                    style: TextStyle(
                      fontSize: 8,
                      color: Colors.black45,
                    ),
                  ),
                  subtitle: Text(
                    '+ 7 904 599 XXX 11',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  trailing: Icon(Icons.chevron_right, size: 16),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.mail_outline),
                  title: Text(
                    'EMAIL',
                    style: TextStyle(
                      fontSize: 8,
                      color: Colors.black45,
                    ),
                  ),
                  subtitle: Text(
                    'alexg@gmail.com',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  trailing: Icon(Icons.chevron_right, size: 16),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.location_on_outlined),
                  title: Text(
                    'ADDRESS',
                    style: TextStyle(
                      fontSize: 8,
                      color: Colors.black45,
                    ),
                  ),
                  subtitle: Text(
                    'St. Petersburg, Vos...',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  trailing: Icon(Icons.chevron_right, size: 16),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // Tombol Logout
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.logout),
              label: const Text(
                'Logout',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFEEEE),
                foregroundColor: Colors.red,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}