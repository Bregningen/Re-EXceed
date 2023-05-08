import 'package:flutter/material.dart';

import '../Helpers/appColors.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  bool? backButton = true;
  MainAppBar({this.backButton});

  @override
  Widget build(BuildContext context) {
    bool show = true;
    if (backButton != null) {
      if (backButton == false) {
        show = false;
      } else {
        show = true;
      }
    }

    return AppBar(
      automaticallyImplyLeading: show,
      centerTitle: true,
      toolbarHeight: 75,
      elevation: 0,
      backgroundColor: AppColors.Main_color,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('Assets/reexceeed.png'),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(72);
}
