import 'package:flutter/material.dart';
import 'package:neumorphicloginui/view/common_widgets/customButton.dart';
import 'package:neumorphicloginui/view/common_widgets/spaceWidget.dart';
import 'package:neumorphicloginui/view/authentication/otp_pin/pinInputWidget.dart';
import 'package:neumorphicloginui/view/authentication/reset_password/reset_password_dialog.dart';
import 'package:neumorphicloginui/utils/common/constants/kColors.dart';

class OTPVerificationBottomSheet extends StatefulWidget {
  final BuildContext context;
  final VoidCallback? onPress;

  const OTPVerificationBottomSheet(
      {super.key, this.onPress, required this.context});

  @override
  State<OTPVerificationBottomSheet> createState() =>
      OTPVerificationBottomSheetState();
}

class OTPVerificationBottomSheetState
    extends State<OTPVerificationBottomSheet> {
  final _textEditingcontrollerFirstPin = TextEditingController();
  final _textEditingcontrollerSecondPin = TextEditingController();
  final _textEditingcontrollerThirdPin = TextEditingController();
  final _textEditingcontrollerFourthPin = TextEditingController();

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();
  FocusNode _focusNode4 = FocusNode();

  bool isBtnPressed = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    _textEditingcontrollerFirstPin.dispose();
    _textEditingcontrollerSecondPin.dispose();
    _textEditingcontrollerThirdPin.dispose();
    _textEditingcontrollerFourthPin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Listener(
      onPointerUp: (event) {},
      child: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Padding(
          padding: mediaQueryData.viewInsets,
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: SizedBox(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        'ENTER A 4 DIGIT CODE',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 1),
                      child: Text(
                        'Enter your 4 digit code that you received on your email.',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                    addVerticalSpace(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomNeumorphicPinInput(
                          first: true,
                          last: false,
                          controller: _textEditingcontrollerFirstPin,
                          focusNode: _focusNode1,
                          nextFocusNode: _focusNode2,
                        ),
                        addHorizontalSpace(30),
                        CustomNeumorphicPinInput(
                          first: false,
                          last: false,
                          controller: _textEditingcontrollerSecondPin,
                          focusNode: _focusNode2,
                          nextFocusNode: _focusNode3,
                        ),
                        addHorizontalSpace(30),
                        CustomNeumorphicPinInput(
                          first: false,
                          last: false,
                          controller: _textEditingcontrollerThirdPin,
                          focusNode: _focusNode3,
                          nextFocusNode: _focusNode4,
                        ),
                        addHorizontalSpace(30),
                        CustomNeumorphicPinInput(
                          first: false,
                          last: true,
                          controller: _textEditingcontrollerFourthPin,
                          focusNode: _focusNode4,
                        ),
                      ],
                    ),
                    addVerticalSpace(40),
                    Listener(
                      onPointerUp: (event) => setState(() {
                        isBtnPressed = false;
                      }),
                      onPointerDown: (event) => setState(() {
                        isBtnPressed = true;
                      }),
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 50),
                          child: CustomNeumorphicBtn(
                            width: 200,
                            height: 50,
                            color: primaryColor,
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: whiteColor,
                                barrierColor: greyShade500.withOpacity(0.10),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20))),
                                builder: (context) =>
                                    ResetPswrdPage(
                                  context: context,
                                ),
                              );
                            },
                            isPressed: isBtnPressed,
                            text: 'Continue',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}