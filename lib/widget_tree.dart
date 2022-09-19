import 'package:bmi_app/auth_methods/auth.dart';
import 'package:bmi_app/screens/bmi_cal.dart';
import 'package:bmi_app/auth_methods/login_register.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const InputPage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
