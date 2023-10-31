import 'package:flutter/material.dart';
import 'package:tugas1_flutter/pages/edit_profile.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EditProfile(),
    );
  }
}
