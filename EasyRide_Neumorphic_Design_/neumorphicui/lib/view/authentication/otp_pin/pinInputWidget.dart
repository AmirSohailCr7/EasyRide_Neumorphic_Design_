import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class CustomNeumorphicPinInput extends StatefulWidget {
  final TextEditingController controller;
  final bool first, last;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;

  const CustomNeumorphicPinInput({
    Key? key,
    required this.controller,
    required this.first,
    required this.last,
    required this.focusNode,
    this.nextFocusNode,
  }) : super(key: key);

  @override
  _CustomNeumorphicPinInputState createState() =>
      _CustomNeumorphicPinInputState();
}

class _CustomNeumorphicPinInputState extends State<CustomNeumorphicPinInput> {
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      setState(() {
        _isFocused = widget.focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    widget.focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      alignment: Alignment.center,
      child: Neumorphic(
        style: NeumorphicStyle(
          shadowLightColorEmboss: Colors.grey.shade200,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
          depth: _isFocused ? -4 : 4,
          intensity: 1.2,
          color: Colors.white,
          shadowLightColor: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: widget.controller,
                focusNode: widget.focusNode,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  if (value.length == 1 && widget.last == false) {
                    FocusScope.of(context).requestFocus(widget.nextFocusNode);
                  } else if (value.isEmpty && widget.first == false) {
                    FocusScope.of(context).previousFocus();
                  }
                },
                decoration: InputDecoration(
                  counterText: "",
                  hintText: '0',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: Colors.grey.shade500),
                  contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  border: InputBorder.none,
                ),
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.black),
                showCursor: false,
                keyboardType: TextInputType.number,
                maxLength: 1,
                validator: (value) {
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
