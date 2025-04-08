import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  String text;
  Function() onTap;
   DrawerItem({super.key,required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return   ListTile(
      title: Text(
        text,textDirection: TextDirection.rtl,
      ),
      onTap:  onTap,
      leading: const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.white,
      ),
    );
  }
}
