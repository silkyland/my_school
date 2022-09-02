import 'package:flutter/material.dart';
import 'package:my_school/connect.dart';
import 'package:my_school/screens/guestbook_form.dart';
import 'package:my_school/screens/main_screen.dart';
import 'package:mysql1/mysql1.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Connect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
      routes: {
        '/home': (context) => const MainScreen(),
        '/guest_book_form': (context) => const GuestbookFormScreen(),
      },
    );
  }
}
