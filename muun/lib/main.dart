import 'package:flutter/material.dart';
import 'package:hse_apps/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'pages/app.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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