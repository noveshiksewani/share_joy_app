import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_joy/view/widget/bottom_app_bar.dart';

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 102, 6, 247),
  background: const Color.fromARGB(255, 56, 49, 66),
);
final theme = ThemeData().copyWith(
  useMaterial3: true,
  scaffoldBackgroundColor: colorScheme.background,
  colorScheme: colorScheme,
  textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
    titleSmall: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
  ),
);
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    const appName = 'Custom Themes';
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: appName,
      theme: ThemeData(
        scaffoldBackgroundColor:Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor:Colors.blueGrey.shade600 ,
          brightness: Brightness.light,
        ),
        buttonTheme: ButtonThemeData(
       colorScheme: colorScheme
        ),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.poppins(
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
          bodyLarge: GoogleFonts.merriweather(),
          bodySmall: GoogleFonts.merriweather(
          ),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
      home:  const BottomBar(),
    );
  }
}
