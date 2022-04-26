import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:genshinfo/routes/fluro_application.dart';
import 'package:genshinfo/routes/router.dart';
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
            brightness: Brightness.dark,
            primaryColor: const Color(0xFFFFFFFF).withOpacity(0.6),
            // textTheme: TextTheme()
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: FluroApplication.router.generator,
        );
      },
    );
  }
}
