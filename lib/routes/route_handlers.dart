// import '../helpers/color_helpers.dart';
// import '../components/demo/demo_simple_component.dart';
// import '../components/home/home_component.dart';
// import 'package:flutter/painting.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genshin_api/genshin_api.dart' show GenshinApiClient;
import 'package:genshin_api/genshin_api.dart' hide Character;
import 'package:genshinfo/features/character_detail/views/character_detail_view.dart';
import 'package:genshinfo/features/character_list/bloc/character_list_bloc.dart';
import 'package:genshinfo/features/character_list/models/character.dart';
import 'package:genshinfo/features/character_list/views/character_list_page.dart';

var rootHandler = Handler(
  handlerFunc: (context, params) {
    return BlocProvider(
      create: (context) => CharacterListBloc(GenshinApiClient()),
      child: const CharacterListPage(),
    );
  },
);

var characterDetailHandler =
    Handler(handlerFunc: (context, params) {
    final character = context?.settings?.arguments as Character;

  return CharacterDetailPage(
    character: character,
  );
});

// var demoRouteHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   String message = params["message"]?.first;
//   String colorHex = params["color_hex"]?.first;
//   String result = params["result"]?.first;
//   Color color = Color(0xFFFFFFFF);
//   if (colorHex != null && colorHex.length > 0) {
//     color = Color(ColorHelpers.fromHexString(colorHex));
//   }
//   return DemoSimpleComponent(message: message, color: color, result: result);
// });

// var demoFunctionHandler = Handler(
//     type: HandlerType.function,
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//       String message = params["message"]?.first;
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text(
//               "Hey Hey!",
//               style: TextStyle(
//                 color: const Color(0xFF00D6F7),
//                 fontFamily: "Lazer84",
//                 fontSize: 22.0,
//               ),
//             ),
//             content: Text("$message"),
//             actions: <Widget>[
//               Padding(
//                 padding: EdgeInsets.only(bottom: 8.0, right: 8.0),
//                 child: TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop(true);
//                   },
//                   child: Text("OK"),
//                 ),
//               ),
//             ],
//           );
//         },
//       );
//       return;
//     });

// /// Handles deep links into the app
// /// To test on Android:
// ///
// /// `adb shell am start -W -a android.intent.action.VIEW -d "fluro://deeplink?path=/message&mesage=fluro%20rocks%21%21" com.theyakka.fluro`
// var deepLinkHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   String colorHex = params["color_hex"]?.first;
//   String result = params["result"]?.first;
//   Color color = Color(0xFFFFFFFF);
//   if (colorHex != null && colorHex.length > 0) {
//     color = Color(ColorHelpers.fromHexString(colorHex));
//   }
//   return DemoSimpleComponent(
//       message: "DEEEEEP LINK!!!", color: color, result: result);
// });
