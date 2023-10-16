import 'package:flutter/material.dart';

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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}