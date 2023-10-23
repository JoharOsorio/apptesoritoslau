import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  
 @override
 Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: const Text('Login'),
    ),
    body: Center(
      child: Form(
        child: Column(
          children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if(!validateInputs()) {
                return;
              }
              if(await login()) {
                Navigator.of(context).pushNamed('/product-list');
              }
            },            
            child: const Text('Login'),
          ),
          TextButton(
            onPressed: (){
              if(!validateInputs()) {
                return;
              }
              signUp();
            },
            child: const Text('Sign up'),
          )
        ]),
        ),
    ),
   );
 }

  Future<bool> login() async {
    try {
      final auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      return true;
    } catch (e) {
      // Maneja el error, por ejemplo, mostrando un mensaje al usuario.
      print('Error al iniciar sesión: $e');
      return false;
    }
  }

  Future<bool> signUp() async {
    try {
      final auth = FirebaseAuth.instance;
      await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      return true;
    } catch (e) {
      // Maneja el error, por ejemplo, mostrando un mensaje al usuario.
      print('Error al registrarse: $e');
      return false;
    }
  }
  bool validateInputs() {
  if (emailController.text.isEmpty ||
      passwordController.text.isEmpty ||
      !emailController.text.contains('@') ||
      passwordController.text.length < 6) {
    return false;
  }
  return true;
  }
}