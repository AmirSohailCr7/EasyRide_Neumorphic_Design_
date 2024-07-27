import 'package:flutter/material.dart';
import 'package:neumorphicloginui/utils/common/constants/kColors.dart';

class CustomAppBar extends StatefulWidget  implements PreferredSizeWidget{
  CustomAppBar({Key? key, this.callback, required this.text}) : super(key: key);

final VoidCallback? callback;
final String text;

  @override
  Size get preferredSize => const Size.fromHeight(50);
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: whiteColor,
      elevation: 0,
      toolbarHeight: 50,
      leadingWidth: 30,
      leading: IconButton(onPressed: widget.callback, icon: Icon(Icons.arrow_back, color: blackColor,)),
      title: Row(children: [
        Text(widget.text, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w500),)
      ],),
    );
  }
}