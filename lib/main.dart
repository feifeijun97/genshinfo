import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:genshinfo/routes/fluro_application.dart';
import 'package:genshinfo/routes/router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:genshinfo/features/character_filter/models/vision_extension.dart';
import 'package:genshinfo/features/character_filter/models/weapon_type_extension.dart';
import 'package:genshin_api/genshin_api.dart' show Vision, WeaponType;
import 'package:genshin_api/genshin_api.dart' hide Character;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  // final String title;

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> {
  _AppState() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    FluroApplication.router = router;
  }
  @override
  void initState() {
    //precache all images in filter bottom sheet
    for (var e in Vision.values) {
      Image img = Image.asset(e.getAssetPath());
      precacheImage(img.image, context);
    }

    for (var e in WeaponType.values) {
      Image img = Image.asset(e.getAssetPath());
      precacheImage(img.image, context);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: HexColor("#121212"),
            brightness: Brightness.dark,
            primaryColor: HexColor("#303030"),
            colorScheme: ColorScheme(
                background: HexColor("#303030"),
                brightness: Brightness.dark,
                error: HexColor("#FFFFFF"),
                onBackground: HexColor("#FFFFFF"),
                onError: HexColor("#FFFFFF"),
                onPrimary: HexColor("#FFFFFF"),
                onSecondary: HexColor("#FFFFFF"),
                onSurface: HexColor("#FFFFFF"),
                primary: HexColor("#303030"),
                secondary: HexColor("#424242"),
                surface: HexColor("#424242")),
            highlightColor: HexColor("#3A3A3A"),
            buttonTheme: ButtonThemeData(buttonColor: HexColor("#FFFFFF")),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueAccent))),
            iconTheme: IconThemeData(
                color: HexColor("#FFFFFF"), opacity: 0.87, size: 24),
            cardTheme: CardTheme(
              color: HexColor("#303030"),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            textTheme: TextTheme(
              displayLarge:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              displayMedium: TextStyle(fontSize: 14),
              displaySmall:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              titleMedium: TextStyle(fontSize: 14),
              titleSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              bodyLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              bodyMedium: TextStyle(fontSize: 14),
              bodySmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              headlineLarge:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              headlineMedium:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              headlineSmall:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              labelLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              labelMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              labelSmall: TextStyle(fontSize: 12, color: HexColor("#bdc1c6")),
            ),
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: FluroApplication.router.generator,
        );
      },
    );
  }
}
