import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  const Error({super.key});
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Error'),
    ),
    body: const Center(
      child: Text('Error'),
    ),
    );
  }
}