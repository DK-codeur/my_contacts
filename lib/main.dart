import 'package:flutter/material.dart';
import 'package:my_contacts/providers/data_provider.dart';
import 'package:my_contacts/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => DataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Contacts',
        theme: ThemeData(
          fontFamily: "CenturyGothic",
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen()
      ),
    );
  }
}
