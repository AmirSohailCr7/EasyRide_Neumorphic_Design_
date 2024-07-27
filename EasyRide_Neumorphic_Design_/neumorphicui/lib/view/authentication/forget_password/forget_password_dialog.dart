import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neumorphicloginui/view/common_widgets/customButton.dart';
import 'package:neumorphicloginui/view/common_widgets/customTextField.dart';
import 'package:neumorphicloginui/view/common_widgets/spaceWidget.dart';
import 'package:neumorphicloginui/view/authentication/otp_pin/pin_dialog.dart';
import 'package:neumorphicloginui/utils/common/constants/kColors.dart';

class ForgotPswrdPage extends StatefulWidget {
  final BuildContext context;
  final VoidCallback? onPress;

  const ForgotPswrdPage({super.key, this.onPress, required this.context});

  @override
  State<ForgotPswrdPage> createState() => ForgotPswrdPageState();
}

class ForgotPswrdPageState extends State<ForgotPswrdPage> {
  final emailController = TextEditingController();
  String? _errorMessagePhoneNo, _errorMessagePassword;
  bool _obscureText = true, _hideErrorPhone = false, _hideErrorPassword = false;

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();

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
    _focusNode1.unfocus();
    _focusNode2.unfocus();
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
                        'Forgot Password',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 1),
                      child: Text(
                        'Enter your email address for verification process. ',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(color: greyShade500),
                      ),
                    ),
                    addVerticalSpace(30),
                    CustomNeumorphicTextField(
                      controller: emailController,
                      hintText: 'Enter your email',
                      leadingIcon: Icons.person,
                      obscureText: false,
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
                                    OTPVerificationBottomSheet(
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

class CustomLoginValidator {
  static Map<String, String?> validate(TextEditingController phoneNoController,
      TextEditingController passwordController) {
    String? phoneNoError;
    String? passwordError;

    // Validate username
    String phoneNo = phoneNoController.text.trim();
    if (phoneNo.isEmpty) {
      phoneNoError = 'Please enter the required information.';
    } else if (phoneNo.length < 10) {
      phoneNoError = 'Enter a valid phone number';
    }
    // Validate password
    String password = passwordController.text.trim();
    if (password.isEmpty) {
      passwordError = 'Please enter the required information.';
    } else if (password.length < 8 || password.length > 20) {
      passwordError = 'Incorrect Password, Please try again';
    }

    return {
      'phoneNo': phoneNoError,
      'password': passwordError,
    };
  }
}
