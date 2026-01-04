import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynew_project/services/auth/auth_gate.dart';
import 'package:mynew_project/firebase_options.dart';
import 'package:mynew_project/models/restaurant.dart';
import 'package:mynew_project/pages/register_page.dart';
import 'package:provider/provider.dart';
import 'themes/theme_provider.dart';
import 'pages/login_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


  runApp(
    MultiProvider(providers: [
      //theme provider
      ChangeNotifierProvider(create: (context)=>ThemeProvider(),
      ),
      //restaurant provider
      ChangeNotifierProvider(create: (context)=>Restaurant(),
      ),
    ],
    child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
