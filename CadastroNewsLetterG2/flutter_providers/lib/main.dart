import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_providers/providers/user_provider.dart';
import 'package:flutter_providers/telas/tela1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp(
        title: 'Multi-step Form',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Tela1(),
      ),
    );
  }
}