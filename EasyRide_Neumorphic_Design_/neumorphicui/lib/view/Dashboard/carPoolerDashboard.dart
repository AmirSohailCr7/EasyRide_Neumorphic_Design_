import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neumorphicloginui/utils/common/constants/kColors.dart';
import 'package:neumorphicloginui/view/common_widgets/customAppBar.dart';
import 'package:neumorphicloginui/view/common_widgets/customBottomNavigation.dart';
import 'package:neumorphicloginui/view/common_widgets/customButton.dart';
import 'package:neumorphicloginui/view/common_widgets/spaceWidget.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

bool isBtnPressed1 = false, isBtnPressed2=false;

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        text: 'Going SomeWhere?',
        callback: () {},
      ),
      bottomNavigationBar:
          CommonBottomNavigationBar(context).getbottomNavigationBar(0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 47),
            child: Text('Save your travel cost with our community.',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(color:greyShade500)),
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(right: 50, top: 200),
                child: SvgPicture.asset(
                  'assets/carWithMan.svg',
                  width: double.infinity,
                  height: 250,
                ),
              ),
              Positioned(
                top: 310,
                child: Image.asset(
                  'assets/roadhighlight2.png',
                  width: 400,
                  height: 200,
                ),
              ),
            ],
          ),
          addVerticalSpace(130),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 Listener(
                      onPointerUp: (event) => setState(() {
                        isBtnPressed1 = false;
                      }),
                      onPointerDown: (event) => setState(() {
                        isBtnPressed1 = true;
                      }),
                      child: CustomNeumorphicBtn(
                        width: 150,
                        height: 50,
                        color: primaryColor,
                        onPressed: () {
                         
                        },
                        isPressed: isBtnPressed1,
                        text: 'OFFER A RIDE',
                      ),
                    ),
                addHorizontalSpace(30),
                Listener(
                  onPointerUp: (event) => setState(() {
                        isBtnPressed2 = false;
                      }),
                      onPointerDown: (event) => setState(() {
                        isBtnPressed2 = true;
                      }),
                  child: CustomNeumorphicBtn(
                    width: 150,
                    height: 50,
                    color: primaryColor,
                    onPressed: () {
                    },
                    isPressed: isBtnPressed2,
                    text: 'FIND A RIDE',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
