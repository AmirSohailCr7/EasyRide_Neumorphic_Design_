import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neumorphicloginui/utils/common/constants/kColors.dart';
import 'package:neumorphicloginui/view/authentication/ProfileCompletion/emailVerify.dart';

class CommonBottomNavigationBar {
  late BuildContext context;

  CommonBottomNavigationBar(
    this.context,
  );

  void goToScreen(int newscreen) {
    print("going to new screen: $newscreen");
    switch (newscreen) {
      case 0:
        //handleRidePortion();
        break;
      case 1:
        //handleSearchRidePortion();

        break;
      case 2:
        // handleUploadRidePortion();

        break;
      case 3:
        // handleChatWithVendorOrCustomerPortion();

        break;
        case 4:
        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VerificationPage(context: context,)),
            );

        break;
        case 5:
      

        break;
      default:
    }
  }

  getbottomNavigationBar(int index) {
    var bnb = Container(
      height: 75,

      decoration: const BoxDecoration(
        // border: Border(
        //   top: BorderSide(
        //     color: whiteColor,
        //     width: 1,
        //   ),
        // ),
      ),
      child: BottomNavigationBar(
        backgroundColor: whiteColor,
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        selectedItemColor: blackColor,
        selectedIconTheme: IconThemeData(color: primaryColor),
        selectedLabelStyle:
            Theme.of(context).textTheme.displayMedium?.copyWith(color: blackColor, fontWeight: FontWeight.bold),
        unselectedLabelStyle: Theme.of(context).textTheme.displayMedium,
        showSelectedLabels: true,
        unselectedItemColor: greyShade500,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: SvgPicture.asset(
                'assets/carIconBottom.svg',
                semanticsLabel: 'Rides',
                allowDrawingOutsideViewBox: true,
                color: index == 0 ? primaryColor : greyShade500,
                height: 25,
              ),
            ),
            label: 'Rides',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: SvgPicture.asset(
                'assets/searchIconBottom.svg',
                semanticsLabel: 'search',
                allowDrawingOutsideViewBox: true,
                color: index == 1 ? primaryColor : greyShade500,
                height: 25,
              ),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: SvgPicture.asset(
                'assets/uploadRideBottom.svg',
                semanticsLabel: 'upload',
                allowDrawingOutsideViewBox: true,
                color: index == 2 ? primaryColor : greyShade500,
                height: 25,
              ),
            ),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: SvgPicture.asset(
                'assets/msgIconBottom.svg',
                semanticsLabel: 'message',
                allowDrawingOutsideViewBox: true,
                color: index == 3 ? primaryColor : greyShade500,
                height: 25,
              ),
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: SvgPicture.asset(
                'assets/profileIconBottom.svg',
                semanticsLabel: 'profile',
                allowDrawingOutsideViewBox: true,
                color: index == 4 ? primaryColor : greyShade500,
                height: 25,
              ),
            ),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          //  if(UserActive==false) {

          // }
          // else{
          // if(UserActive==true){
          goToScreen(index);
          //}
          //}
        },
      ),
    );
    var theme = Theme(
        data: Theme.of(context).copyWith(
          navigationBarTheme: NavigationBarThemeData(
            backgroundColor: Colors.white10,
            indicatorColor: Colors.white,
            labelTextStyle: MaterialStateProperty.all(
              const TextStyle(
                color: blackColor,
                fontWeight: FontWeight.normal,
                fontSize: 12,
                letterSpacing: .2,
              ),
            ),
          ),
        ),
        child: bnb);
    return theme;
    //return bnb;
  }
}
