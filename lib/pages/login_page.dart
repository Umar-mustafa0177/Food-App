import 'package:flutter/material.dart';
import 'package:mynew_project/components/my_button.dart';
import 'package:mynew_project/components/my_textfield.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {

  final void Function()? onTap;


  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  //create a login function
  void login(){
    /*

    we will fill authentication here
     */

    //navigate to the home page
    
    Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage(),),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView( // allows scrolling on small screens
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Icon(
                Icons.lock_open_rounded,
                size: 100,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),

              const SizedBox(height: 25),

              // App slogan
              const Text(
                "Food Delivery App",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // Email TextField
              MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
              ), // <-- COMMA ADDED HERE

              const SizedBox(height: 10),
              // Password TextField

              MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(height: 10),


              // Sign in button
              MyButton(text: "Signin",
                  onTap: login),

              const SizedBox(height: 10),




              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ), // Text
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Register now",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ), // TextStyle
                    ),
                  ), // Text
                ],
              ) // Row


            ],
          ),
        ),
      ),
    );
  }
}
