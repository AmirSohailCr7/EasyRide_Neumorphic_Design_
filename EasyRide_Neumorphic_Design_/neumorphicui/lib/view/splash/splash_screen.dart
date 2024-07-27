
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neumorphicloginui/utils/common/constants/kColors.dart';
import 'package:neumorphicloginui/view/authentication/sign_in/sign_in_screen.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 2), (){
       Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignInSignUpPage()),
            );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      extendBodyBehindAppBar: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'assets/carLogo.svg',
              width: 150,
              height: 150,
            ),
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
            //   repeatForever: true,
            //   pause: Duration(milliseconds: 200),
            //   animatedTexts: [
            //   ColorizeAnimatedText('ConnecTog',
            //       textStyle: Theme.of(context).textTheme.headline1!,
            //       colors: [btnTextColor, primaryColor])
            // ])
          ],
        ),
      ),
    );
  }
}
