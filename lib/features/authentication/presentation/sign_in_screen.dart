import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Qui implementeremo la chiamata al repository
          },
          child: const Text('Sign In (Coming Soon)'),
        ),
      ),
    );
  }
}
