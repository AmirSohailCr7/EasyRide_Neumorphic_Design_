import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:neumorphicloginui/utils/common/constants/kColors.dart';

class CustomNeumorphicTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? leadingIcon;
  final IconButton? suffixIconButton;
  final bool obscureText;
  const CustomNeumorphicTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.leadingIcon,
      this.suffixIconButton,
      this.obscureText = true})
      : super(key: key);

  @override
  _CustomNeumorphicTextFieldState createState() =>
      _CustomNeumorphicTextFieldState();
}

class _CustomNeumorphicTextFieldState extends State<CustomNeumorphicTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 50,
      alignment: Alignment.center,
      child: Neumorphic(
        style: NeumorphicStyle(
          shadowLightColorEmboss: Colors.grey.shade200,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(25)),
          depth: _isFocused ? -4 : 4,
          intensity: 1.2,
          color: Colors.white,
          shadowLightColor: Colors.grey.shade200,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(
                widget.leadingIcon,
                color: Colors.black54,
                size: 20,
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: widget.controller,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: greyShade500),
                  border: InputBorder.none,
                ),
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: Colors.black),
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                obscureText: widget.obscureText ? true : false,
                obscuringCharacter: '●',
                validator: (value) {
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: widget.suffixIconButton,
            ),
          ],
        ),
      ),
    );
  }
}
