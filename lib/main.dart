import 'package:financeapp/Screens/sign_up.dart';
import 'package:financeapp/Screens/splash_screen.dart';
import 'package:financeapp/Screens/statistics.dart';
import 'package:financeapp/data/bottom_navigation.dart';
import 'package:financeapp/homepage.dart';
import 'package:financeapp/model/add_date.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<Add_data>('data');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
 
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
