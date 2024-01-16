import 'package:app_hamburguesas_abierto/main_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.kanit(
              fontSize: 23,
              //fontWeight: FontWeight.bold,
              //fontStyle: FontStyle.italic,
              color: const Color.fromARGB(255, 235, 153, 12)),
          bodyMedium: GoogleFonts.kanit(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 235, 153, 12)),
          bodySmall: GoogleFonts.kanit(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 235, 153, 12)),
          labelLarge: GoogleFonts.kanit(fontSize: 18, color: Colors.white),
          labelMedium: GoogleFonts.kanit(fontSize: 16, color: Colors.white),
          labelSmall: GoogleFonts.kanit(fontSize: 12, color: Colors.white),
        ),
        useMaterial3: true,
      ),
      home: MainPage(),
    );
  }
}
