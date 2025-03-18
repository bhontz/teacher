import 'package:flutter/material.dart';
import '../models/book_model.dart';
import '../services/googleapi_service.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      // note: AppBar has a default return to prior screen so ElevatedButton below is redunant
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Settings Page"),
        ),
      ),
    );
  }
}
