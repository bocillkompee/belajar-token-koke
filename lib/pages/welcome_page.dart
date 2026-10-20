import 'package:coba_login/pages/login_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 330,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF0D1730),
                  borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(260, 110)),
                ),
              ),
              Positioned(
                bottom: -45,
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Color(0x1A000000), blurRadius: 16)],
                  ),
                  child: const Icon(Icons.eco, size: 50, color: Color(0xFF3BB54A)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 70),
          const Text(
            'Leafboard',
            style: TextStyle(fontSize: 38, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          const Text(
            'A platform built for a new way of working',
            style: TextStyle(fontSize: 14),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFA8F57C),
              foregroundColor: Colors.black87,
              elevation: 0,
              minimumSize: const Size(0, 48),
              padding: const EdgeInsets.symmetric(horizontal: 28),
              shape: const StadiumBorder(),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Get Started for Free'),
                SizedBox(width: 8),
                Icon(Icons.chevron_right, size: 18),
              ],
            ),
          ),
          const SizedBox(height: 48),
        ],
      ),
    );
  }
}