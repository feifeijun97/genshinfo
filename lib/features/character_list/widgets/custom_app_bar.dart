import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genshinfo/features/character_filter/views/character_filter_bottom_sheet.dart';
import 'package:genshinfo/features/character_list/bloc/character_list_bloc.dart';
import 'package:genshinfo/features/character_list/widgets/search_widget.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  // var searchCallback;

  @override
  CustomAppBarState createState() => CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      width: 100.w,
      color: Colors.transparent,
      child: Row(
        children: [
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.menu),
          //   // color: Theme.of(context).primaryColor,
          // ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // SearchWidget(),
              Expanded(
                  child: SearchWidget(
                searchCallback: (characterName) {
                  BlocProvider.of<CharacterListBloc>(context)
                      .add(RetrieveCharacterList(name: characterName));
                },
                rowAlignment: MainAxisAlignment.end,
              )),
              IconButton(
                onPressed: () {
                  if (BlocProvider.of<CharacterListBloc>(context)
                      .state
                      .status
                      .isSuccess) {
                    showBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        builder: (context) {
                          return const CharacterFilterBottomSheet();
                        });
                  }
                },
                icon: const Icon(Icons.filter_alt),
                // color: Theme.of(context).primaryColor,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
