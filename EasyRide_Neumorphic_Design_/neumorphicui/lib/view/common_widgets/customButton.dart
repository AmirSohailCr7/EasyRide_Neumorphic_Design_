import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:neumorphicloginui/utils/common/constants/kColors.dart';

class CustomNeumorphicBtn extends StatelessWidget {
  final String text;
  final IconData? iconname;
  final VoidCallback? onPressed;
  final bool isPressed;
  final double? width, height;
  final Color? color;
  const CustomNeumorphicBtn({Key? key, required this.text,  this.iconname, this.onPressed, this.isPressed=false, this.width, this.height, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: NeumorphicButton(
        onPressed: onPressed,
        style: NeumorphicStyle(
          shadowLightColorEmboss: Colors.grey.shade400,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(25)),
          depth:isPressed? -4:4,
          intensity: 1.2,
          color: isPressed? whiteColor:primaryColor,
          shadowDarkColor: Colors.grey.shade500,
          shadowLightColor: Colors.grey.shade300,
          surfaceIntensity: 10,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
               text,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 16),
              ),
            ),
            Visibility(
              visible: iconname.toString().isEmpty,
              child: Padding(
                padding:  EdgeInsets.only(top: 10),
                child: Icon(
                  iconname,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}