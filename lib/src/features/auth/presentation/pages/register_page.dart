import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person_add,
                size: 80,
                color: Colors.blue,
              ),
              SizedBox(height: AppConstants.largePadding),
              Text(
                'Register Page',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppConstants.defaultPadding),
              Text('Registration form will be implemented here'),
            ],
          ),
        ),
      ),
    );
  }
}
