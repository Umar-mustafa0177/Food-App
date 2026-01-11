import 'package:flutter/material.dart';

import 'package:avatar_glow/avatar_glow.dart';

import 'package:mynew_project/services/auth/auth_gate.dart';



class SplashPage extends StatefulWidget {

  const SplashPage({super.key});



  @override

  State<SplashPage> createState() => _SplashPageState();

}



class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {

  bool showButton = false;



  @override

  void initState() {

    super.initState();

// 3 second baad button show karne ke liye

    Future.delayed(const Duration(seconds: 2), () {

      if (mounted) {

        setState(() {

          showButton = true;

        });

      }

    });

  }



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFFFF5252), // Brand Orange

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            const Spacer(flex: 2),



// 1. Glowing Logo using your custom PNG

            AvatarGlow(

              startDelay: const Duration(milliseconds: 1000),

              glowColor: Colors.white,

              glowShape: BoxShape.circle,

              animate: true,

              curve: Curves.fastOutSlowIn,

              child: Container(

                padding: const EdgeInsets.all(15), // Logo ke gird thodi jagah

                decoration: const BoxDecoration(

                  color: Colors.white, // Logo ke peeche white circle

                  shape: BoxShape.circle,

                ),

                child: CircleAvatar(

                  backgroundColor: Colors.transparent,

                  radius: 60.0,

                  child: Image.asset(

                    'lib/images/Splash_logo.png', // Aapka logo path

                    fit: BoxFit.contain,

// Agar image path mein koi masla ho to icon dikhaye

                    errorBuilder: (context, error, stackTrace) => const Icon(

                      Icons.restaurant_menu_rounded,

                      size: 60,

                      color: Color(0xFFFF5252),

                    ),

                  ),

                ),

              ),

            ),



            const SizedBox(height: 25),



// Brand Name

            const Text(

              "F O O D I E",

              style: TextStyle(

                color: Colors.white,

                fontSize: 32,

                fontWeight: FontWeight.w900,

                letterSpacing: 4,

              ),

            ),



            const Spacer(flex: 1),



// 2. Animated Continue Button

            AnimatedOpacity(

              opacity: showButton ? 1.0 : 0.0,

              duration: const Duration(milliseconds: 800),

              child: Padding(

                padding: const EdgeInsets.symmetric(horizontal: 40),

                child: ElevatedButton(

                  onPressed: () {

                    Navigator.pushReplacement(

                      context,

                      MaterialPageRoute(builder: (context) => const AuthGate()),

                    );

                  },

                  style: ElevatedButton.styleFrom(

                    backgroundColor: Colors.white,

                    foregroundColor: const Color(0xFFFF5252),

                    elevation: 0,

                    minimumSize: const Size(double.infinity, 60),

                    shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(20),

                    ),

                  ),

                  child: const Text(

                    "CONTINUE TO APP",

                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),

                  ),

                ),

              ),

            ),



            const SizedBox(height: 50),

          ],

        ),

      ),

    );

  }

}