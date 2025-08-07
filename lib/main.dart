import 'package:flutter/material.dart';
import 'package:frontend/providers/auth_provider.dart';
import 'package:frontend/screens/auth/login_page.dart';
import 'package:frontend/screens/home/basePage.dart';
import 'package:provider/provider.dart';
import 'package:frontend/utils/auth_storage.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AuthStorage.deleteToken();
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider()..checkAuthStatus(),
      child: const MyApp(),
     ),
    
  );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Consumer<AuthProvider>(
        builder: (context, auth, _) {
          return auth.isAuthenticated ? const BaseScreen() : const LoginPage();
        }
      )
    );
  }
}