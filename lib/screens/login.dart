import 'package:flutter/material.dart';
import '../components/textfields.dart';
// import '../models/book_model.dart';
// import '../services/googleapi_service.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  LoginPage({super.key});

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
            ],
          ),
        ),
      ),
    );
  }
}
