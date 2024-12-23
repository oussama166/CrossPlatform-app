import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:toastification/toastification.dart';
import 'package:tp/components/MyButtonField.dart';
import 'package:tp/components/MyTextField.dart';
import 'package:tp/components/UIColors.dart';
import 'package:tp/services/auth.dart';
import 'package:tp/utilities/showToast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  State<LoginPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool is_Loading = false;
  AuthService authService = AuthService();
  var logger = Logger();
  void login(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      showToast(context, "One Of the fields is empty", UIColors.red,
          ToastificationType.error);
      return;
    }
    setState(() {
      is_Loading = true;
    });
    authService.loginUser(email, password).then((result) {
      if (!mounted) return;
      if (result != "success") {
        setState(() {
          is_Loading = false;
        });
        showToast(context, result, UIColors.red, ToastificationType.error);
        return;
      }
      Navigator.pushReplacementNamed(context, "/main");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              const Text(
                "Connect to your Application",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: UIColors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                "Please login to continue",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 50),
              Mytextfield(
                txtbox: email,
                hintText: "Email",
                obsecureText: false,
                color: UIColors.black,
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 20),
              Mytextfield(
                txtbox: password,
                hintText: "Password",
                obsecureText: true,
                color: UIColors.black,
                icon: Icons.lock_outline,
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Handle Forgot Password Logic
                  },
                  child: const Text(
                    "Forgot your password?",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (is_Loading)
                const CircularProgressIndicator()
              else
                MyButton(
                  text: "Login",
                  onTap: () {
                    login(email.text.trim(), password.text.trim());
                    logger.d("Login button clicked");
                  },
                  bgcolor: UIColors.black,
                  fgcolor: UIColors.white,
                ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/registerPage');
                },
                child: const Text(
                  "Don't have an account? Sign up",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
