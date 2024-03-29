import 'package:fluro/fluro.dart';
import './route_handlers.dart';

class Routes {
  static String root = "/";
  static String characterDetail = "/character_detail";
  // static String demoSimpleFixedTrans = "/demo/fixedtrans";
  // static String demoFunc = "/demo/func";
  // static String deepLink = "/message";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
      handlerFunc: (context, params) {
        // print("ROUTE WAS NOT FOUND !!!");
        return;
      },
    );

    router.define(root, handler: rootHandler);
    router.define(characterDetail, handler: characterDetailHandler);
    // router.define(demoSimpleFixedTrans,
    //     handler: demoRouteHandler, transitionType: TransitionType.inFromLeft);
    // router.define(demoFunc, handler: demoFunctionHandler);
    // router.define(deepLink, handler: deepLinkHandler);
  }
}
