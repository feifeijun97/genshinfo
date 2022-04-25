import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchWidget extends StatefulWidget {
  final MainAxisAlignment? rowAlignment;
  final Function searchCallback;

  const SearchWidget(
      {Key? key, this.rowAlignment, required this.searchCallback})
      : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  bool isForward = false;
  late FocusNode characterNameTextFieldNode;

  final characterNameTextFieldController = TextEditingController();
  @override
  void initState() {
    super.initState();
    characterNameTextFieldNode = FocusNode();
    animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    final curvedAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOutExpo);

    animation = Tween<double>(begin: 0, end: 61.w).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    characterNameTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      // width: 100.w,
      child: Row(
        mainAxisAlignment: widget.rowAlignment ?? MainAxisAlignment.start,
        children: [
          SizedBox(
            width: animation.value,
            child: TextField(
              controller: characterNameTextFieldController,
              focusNode: characterNameTextFieldNode,
              cursorColor: Colors.white12,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Search..',
                hintStyle: TextStyle(color: Colors.white10),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white12),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white12),
                ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25))),
          ),
          IconButton(
              onPressed: () {
                //show / hide text field
                if (!isForward) {
                  animationController.forward();
                  isForward = true;
                  characterNameTextFieldNode.requestFocus();
                } else {
                  animationController.reverse();
                  isForward = false;
                  FocusScope.of(context).unfocus();
                  //trigger callback if user enter some input
                  if (characterNameTextFieldController.text.isNotEmpty) {
                    widget
                        .searchCallback(characterNameTextFieldController.text);
                  }
                }
              },
              icon: const Icon(Icons.search),
              color: Theme.of(context).primaryColor)
        ],
      ),
    );
  }
}
