import 'package:flutter/material.dart';
import 'package:hse_apps/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'pages/land.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle( 
            statusBarColor: Colors.transparent, 
      )); 
  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Hse Passes',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/': (context) =>  const Land(),
      },
    );
  }
}