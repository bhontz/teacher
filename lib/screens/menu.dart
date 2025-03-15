import 'package:flutter/material.dart';
import 'about.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => const AboutPage()));
        },
        child: Text("THIS IS THE MENU PAGE.  Press to Go to ABOUT PAGE"),
      ),
    );
  }
}
