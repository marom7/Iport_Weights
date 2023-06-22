import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import '/router.dart' as rout;

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'מערכת משקלים',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: rout.Router.generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
