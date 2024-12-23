import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:tp/components/MyTextField.dart';
import 'package:tp/components/UIColors.dart';
import 'package:tp/services/auth.dart';
import 'package:tp/utilities/showToast.dart';

import '../components/MyButtonField.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.title});

  final String title;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  //services

  var auth = AuthService();
  void register(String name, String email, String phone, String password) {
    if (name.isEmpty || password.isEmpty || phone.isEmpty || email.isEmpty) {
      showToast(context, "One Or Field is Empty", UIColors.red,
          ToastificationType.error);
      return;
    }
    //pass
    //

    auth.registerUser(name, email, password, phone).then((result) {
      if (!mounted) return;

      showToast(context, result!, UIColors.green, ToastificationType.success);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: UIColors.black,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Create your Account",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 60),
                Mytextfield(
                  txtbox: name,
                  hintText: "Full Name",
                  obsecureText: false,
                  color: UIColors.black,
                  icon: Icons.person_2,
                ),
                const SizedBox(height: 20),
                Mytextfield(
                  txtbox: email,
                  hintText: "Email",
                  obsecureText: false,
                  color: UIColors.black,
                  icon: Icons.email_outlined,
                ),
                const SizedBox(height: 20),
                Mytextfield(
                  txtbox: phone,
                  hintText: "Phone",
                  obsecureText: false,
                  color: UIColors.black,
                  icon: Icons.phone,
                ),
                const SizedBox(height: 20),
                Mytextfield(
                  txtbox: password,
                  hintText: "Password",
                  obsecureText: true,
                  color: UIColors.black,
                  icon: Icons.lock_outline,
                ),
                const SizedBox(height: 30),
                MyButton(
                  text: "Register",
                  onTap: () {
                    register(
                      name.text.trim(),
                      email.text.trim(),
                      phone.text.trim(),
                      password.text.trim(),
                    );
                  },
                  bgcolor: UIColors.black,
                  fgcolor: UIColors.white,
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "/");
                  },
                  child: const Text(
                    "Already Have an Account? Log in",
                    style: TextStyle(
                      fontSize: 16,
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
      ),
    );
  }
}
