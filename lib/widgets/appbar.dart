import 'package:flutter/material.dart';
import 'package:on_the_spot/constants/color_scheme.g.dart';

class OTSAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OTSAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('On The Spot'),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}