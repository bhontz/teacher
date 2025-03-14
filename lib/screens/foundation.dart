import 'package:flutter/material.dart';
import '../screens/settings.dart';
import '../screens/home.dart';

class FoundationPage extends StatelessWidget {
  const FoundationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LockNLube', style: TextStyle(fontSize: 18)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => SettingsPage()));
            },
          ),
        ],
      ),
      body: HomePage(),
    );
  }
}

// class NavigatorWidget extends StatelessWidget {
//   const NavigatorWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//       onGenerateRoute:
//           (RouteSettings settings) =>
//               MaterialPageRoute(builder: (_) => Placeholder()),

//       // initialRoute: '/',
//       // onGenerateRoute: (RouteSettings settings) {
//       //   Widget page;
//       //   switch (settings.name) {
//       //     case '/':
//       //       page = Settings();
//       //       break;
//       //     default:
//       //       page = Placeholder();
//       //       break;
//       //   }
//       //   return MaterialPageRoute(builder: (_) => page);
//       // },
//     );
//   }
// }
