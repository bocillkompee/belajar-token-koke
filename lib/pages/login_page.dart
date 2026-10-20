import 'package:coba_login/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:coba_login/services/api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool hidePassword = true;

  bool loading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool get formValid =>
      emailController.text.contains('@') && passwordController.text.length >= 8;

  Future<void> Login() async {
    try {
      final response = await ApiService.post("auth/login", 
      {"email": emailController.text.trim(), 
      "password": passwordController.text
      });

    } catch (e) {
      // Handle error
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),

              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.eco, size: 22, color: Color(0xFF3BB54A)),
                    SizedBox(width: 8),
                    Text(
                      'Leafboard',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  'Work without limits',
                  style: TextStyle(fontSize: 13),
                ),
              ),
              SizedBox(height: 48),

              Text('Your email address', style: TextStyle(fontSize: 12)),
              SizedBox(height: 8),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) =>
                    setState(() {}), // supaya tombol ikut berubah
                decoration: InputDecoration(
                  hintText: 'dilerragip@gmail.com',
                  filled: true,
                  fillColor: Color(0xFFF7F8F9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Color(0xFFE8EAED)),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Text('Choose a password', style: TextStyle(fontSize: 12)),
              SizedBox(height: 8),
              TextField(
                controller: passwordController,
                obscureText: hidePassword,
                onChanged: (value) => setState(() {}),
                decoration: InputDecoration(
                  hintText: 'min. 8 characters',
                  filled: true,
                  fillColor: Color(0xFFF7F8F9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Color(0xFFE8EAED)),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      hidePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 18,
                    ),
                    onPressed: () =>
                        setState(() => hidePassword = !hidePassword),
                  ),
                ),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: formValid ? (){} : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFA8F57C),
                  foregroundColor: Colors.black87,
                  disabledBackgroundColor: Color(0xFFEDEFF1),
                  elevation: 0,
                  minimumSize: Size.fromHeight(48),
                  shape: StadiumBorder(),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Continue'),
                    SizedBox(width: 8),
                    Icon(Icons.chevron_right, size: 18),
                  ],
                ),
              ),
              SizedBox(height: 16),

              Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'or',
                      style: TextStyle(fontSize: 12, color: Colors.black45),
                    ),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 16),

              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.g_mobiledata, size: 24),
                label: Text(
                  'Sign up with Google',
                  style: TextStyle(fontSize: 13),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size.fromHeight(48),
                  foregroundColor: Colors.black87,
                  side: BorderSide(color: Color(0xFFE5E7EB)),
                  shape: StadiumBorder(),
                ),
              ),
              SizedBox(height: 12),

              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.apple, size: 20),
                label: Text(
                  'Sign up with Apple',
                  style: TextStyle(fontSize: 13),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size.fromHeight(48),
                  foregroundColor: Colors.black87,
                  side: BorderSide(color: Color(0xFFE5E7EB)),
                  shape: StadiumBorder(),
                ),
              ),
              SizedBox(height: 24),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 13, color: Colors.black54),
                    ),
                    SizedBox(width: 5),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Color(0xFF3BB54A),
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
