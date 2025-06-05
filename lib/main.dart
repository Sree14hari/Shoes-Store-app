import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cartprovider.dart';
import 'package:shop_app/homepage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cartprovider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
            titleMedium: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            bodyMedium: GoogleFonts.lato(
              fontSize: 16,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 99, 90, 255),
            brightness: Brightness.light,
          ),
          useMaterial3: true,

          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        title: "Shop app",
        home: Homepage(),
      ),
    );
  }
}
