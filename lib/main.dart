import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact_screen/contactScreen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactScreen(),
    );
  }
}

void main() => runApp(MyApp());
