import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: context.width,
            height: context.height,
            color: Colors.indigo,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 120),
                const Center(
                  child: Text(
                    'Notes',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 45),
                  ),
                ),
                const SizedBox(height: 40),
                LoginForm(),
              ],
            ),
          )
        ],
      ),
    );
  }
}


