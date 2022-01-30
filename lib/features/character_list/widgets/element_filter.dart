import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ElementFilterList extends StatefulWidget {
  const ElementFilterList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ElementFilterListState();
}

class _ElementFilterListState extends State<ElementFilterList> {
  late String directory;
  List file = [];

  @override
  void initState() {
    super.initState();
    // _listofFiles();
  }

  // // Make New Function
  // void _listofFiles() async {
  //   AssetBundle
  //   var systemTempDir = Directory.current.path;
  //   print(systemTempDir + 'images/element/normal/');
  //   setState(() {
  //     file = Directory(systemTempDir)
  //         .listSync(); //use your folder name insted of resume.
  //     print(file);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Widget iconButton(elementName, hexColor) {
      return SizedBox(
        width: 30,
        height: 30,
        child: ImageIcon(
          AssetImage('images/element/black/$elementName.png'),
          color: HexColor("#$hexColor"),
        ),
      );
    }

    return SizedBox(
      width: (MediaQuery.of(context).size.width),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          iconButton('pyro', 'fe925d'),
          iconButton('hydro', '21e1eb'),
          iconButton('anemo', '72e2c3'),
          iconButton('electro', 'a757cb'),
          iconButton('dendro', '23c18a'),
          iconButton('cyro', 'a0e9e5'),
          iconButton('geo', 'e3b342'),
        ],
      ),
    );
  }
}
