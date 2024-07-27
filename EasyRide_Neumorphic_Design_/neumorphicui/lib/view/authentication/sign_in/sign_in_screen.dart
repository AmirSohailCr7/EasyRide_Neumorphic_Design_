import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neumorphicloginui/view/Dashboard/carPoolerDashboard.dart';
import 'package:neumorphicloginui/view/common_widgets/customButton.dart';
import 'package:neumorphicloginui/view/common_widgets/customTextField.dart';
import 'package:neumorphicloginui/view/common_widgets/spaceWidget.dart';
import 'package:neumorphicloginui/view/authentication/forget_password/forget_password_dialog.dart';
import 'package:neumorphicloginui/utils/common/constants/kColors.dart';

class SignInSignUpPage extends StatefulWidget {
  const SignInSignUpPage({Key? key}) : super(key: key);

  @override
  State<SignInSignUpPage> createState() => _SignInSignUpPageState();
}

class _SignInSignUpPageState extends State<SignInSignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isBtnPressed = false, obscureText = true;
  IconData? icon;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: SvgPicture.asset(
                      'assets/carLogo.svg',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  addVerticalSpace(10),
                  Center(
                    child: Text(
                      'EasyRide',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  // AnimatedTextKit(
                  //     repeatForever: true,
                  //     pause: Duration(milliseconds: 200),
                  //     animatedTexts: [
                  //       ColorizeAnimatedText('ConnecTog',
                  //           textStyle: Theme.of(context).textTheme.headline1!,
                  //           colors: [btnTextColor, primaryColor])
                  //     ]),
                  addVerticalSpace(30),
                  SizedBox(
                    width: 270,
                    child: Divider(
                      thickness: 2,
                      color: dividerColor,
                    ),
                  ),
                  addVerticalSpace(50),
                  CustomNeumorphicTextField(
                    controller: emailController,
                    hintText: 'Enter your email',
                    leadingIcon: Icons.person,
                  ),
                  addVerticalSpace(20),
                  CustomNeumorphicTextField(
                    controller: passwordController,
                    hintText: 'Enter your password',
                    leadingIcon: Icons.lock,
                    obscureText: obscureText,
                    suffixIconButton: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: Icon(obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                  addVerticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value:
                            false, // Replace with the checkbox value you want to use
                        onChanged: (value) {
                          // Replace with your logic when the checkbox is tapped
                        },
                      ),
                      Text(
                        'Remember me',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w400),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: whiteColor,
                            barrierColor: greyShade500.withOpacity(0.50),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20))),
                            builder: (context) => ForgotPswrdPage(
                              context: context,
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'Forgot Password?',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                  addVerticalSpace(30),
                  Listener(
                    onPointerUp: (event) => setState(() {
                      isBtnPressed = false;
                    }),
                    onPointerDown: (event) => setState(() {
                      isBtnPressed = true;
                    }),
                    child: CustomNeumorphicBtn(
                      width: 200,
                      height: 50,
                      color: primaryColor,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DashboardScreen()),
                        );
                      },
                      isPressed: isBtnPressed,
                      text: 'Join',
                    ),
                  ),
                  addVerticalSpace(80),
                  Row(
                    children: [
                      SizedBox(
                        width: 150,
                        child: Divider(
                          thickness: 2,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      addHorizontalSpace(10),
                      Text(
                        'OR',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      addHorizontalSpace(10),
                      SizedBox(
                        width: 150,
                        child: Divider(
                          thickness: 2,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ),
                  addVerticalSpace(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/fbIcon.svg',
                        width: 30,
                        height: 30,
                      ),
                      addHorizontalSpace(20),
                      SvgPicture.asset(
                        'assets/twitterIcon.svg',
                        width: 30,
                        height: 30,
                      ),
                      addHorizontalSpace(20),
                      SvgPicture.asset(
                        'assets/gmailIcon.svg',
                        width: 30,
                        height: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
