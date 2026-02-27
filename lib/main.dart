import 'package:flutter/material.dart';
import 'package:rive/rive.dart' ;
import 'package:rivelogin/loginform.dart';
import 'package:rivelogin/profilelist.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RiveNative.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: LoginForm(),
    );
  }
}
