import 'package:flutter/material.dart';
import '../components/textfields.dart';
import '../components/buttons.dart';

// import '../models/book_model.dart';
// import '../services/googleapi_service.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController pwconfirmController = TextEditingController();
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  void register() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
              const SizedBox(height: 5),
              Text("T E A C H E R", style: TextStyle(fontSize: 20)),
              const SizedBox(height: 12),
              MyTextField(
                hintText: "Username",
                obscureText: false,
                controller: usernameController,
              ),
              const SizedBox(height: 10),
              MyTextField(
                hintText: "Email",
                obscureText: false,
                controller: emailController,
              ),
              const SizedBox(height: 10),
              MyTextField(
                hintText: "Password",
                obscureText: true,
                controller: pwController,
              ),
              const SizedBox(height: 10),
              MyTextField(
                hintText: "Confirm Password",
                obscureText: true,
                controller: pwconfirmController,
              ),
              const SizedBox(height: 5),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Text(
              //       "Forgot Password?",
              //       style: TextStyle(
              //         color: Theme.of(context).colorScheme.secondary,
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 20),
              MyButton(text: "Register", onTap: register),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?  "),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Login Here",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
