import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,

  
        textTheme: GoogleFonts.vampiroOneTextTheme(Theme.of(context).textTheme),

     
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black, backgroundColor: Colors.red, 
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), 
            ),
          ),
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.red, padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), 
            ),
          ),
        ),

       
        scaffoldBackgroundColor: const Color.fromARGB(255, 92, 91, 91), 

       
        appBarTheme: AppBarTheme(
          color: Colors.black, 
          iconTheme: IconThemeData(color: Colors.white), toolbarTextStyle: GoogleFonts.vampiroOneTextTheme(Theme.of(context).textTheme).apply(bodyColor: Colors.white).bodyMedium, titleTextStyle: GoogleFonts.vampiroOneTextTheme(Theme.of(context).textTheme).apply(bodyColor: Colors.orange ).titleLarge, 
        ),
      ),
      home: LoginScreen(),
    );
  