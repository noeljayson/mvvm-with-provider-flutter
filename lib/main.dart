import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm_provider/view/screens/home_screens.dart';
import 'package:provider/provider.dart';

import 'view_model/media_view_model.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();


    runApp(MultiProvider(
        providers: [ChangeNotifierProvider.value(value: MediaViewModel()),],
        child: const MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Media Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
      },
    );
  }
}