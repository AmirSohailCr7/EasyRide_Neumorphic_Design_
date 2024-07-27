import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neumorphicloginui/view/Dashboard/carPoolerDashboard.dart';
import 'package:neumorphicloginui/view/common_widgets/customButton.dart';
import 'package:neumorphicloginui/view/common_widgets/spaceWidget.dart';
import 'package:neumorphicloginui/view/authentication/otp_pin/pin_dialog.dart';
import 'package:neumorphicloginui/utils/common/constants/kColors.dart';

class VerificationPage extends StatefulWidget {
  final BuildContext context;
  const VerificationPage({Key? key, required this.context}) : super(key: key);

  @override
  VerificationPageState createState() => VerificationPageState();
}

class VerificationPageState extends State<VerificationPage> {
  int _currentStep = 0;
  bool isBtnPressed = false;

  // Simulate verification progress
  void _verifyStep(int step) {
    setState(() {
      _currentStep = step;
    });

    // Simulate API call or verification process for each step
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _currentStep = step + 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/carLogo.svg',
                  width: 150,
                  height: 150,
                ),
              ),
              addVerticalSpace(20),
              Center(
                child: Text(
                  'EasyRide',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              addVerticalSpace(30),
              const Center(
                child: SizedBox(
                  width: 270,
                  child: Divider(
                    thickness: 2,
                    color: dividerColor,
                  ),
                ),
              ),
              addVerticalSpace(50),
              _buildProgressIndicator(),
              addVerticalSpace(50),
              Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'You re few steps away',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.displaySmall,
                  )),
              addVerticalSpace(10),
              Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Verification Email Sent!',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  )),
              addVerticalSpace(20),
              Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    'To complete your profile and start sharing rides with our community, you will need to verify your email address.',
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  )),
              addVerticalSpace(20),
              Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    'Please check your inbox and follow the instructions,if not received email click verify email button ',
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  )),
              addVerticalSpace(50),
              Listener(
                onPointerUp: (event) => setState(() {
                  isBtnPressed = false;
                }),
                onPointerDown: (event) => setState(() {
                  isBtnPressed = true;
                }),
                child: Center(
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
                    text: 'Verify Email',
                  ),
                ),
              ),
              // _buildStepButton(0, 'Verify Email'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 22),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildStepIndicator(0),
              addHorizontalSpace(40),
              _buildStepIndicator(1),
              addHorizontalSpace(40),
              _buildStepIndicator(2),
            ],
          ),
          Positioned(
            top: 25,
            left: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                addHorizontalSpace(10),
                Text(
                  '40%',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                addHorizontalSpace(90),
                Text(
                  '0%',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                addHorizontalSpace(90),
                Text(
                  '0%',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Positioned(
            top: 70,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  addHorizontalSpace(10),
                  Text(
                    'Verify email',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  addHorizontalSpace(55),
                  Text(
                    'Personal Info',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  addHorizontalSpace(60),
                  Text(
                    'Phone No',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator(int step) {
    return Container(
      width: 70,
      height: 70,
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: NeumorphicIndicator(
        percent: step == 0 ? 1 : 0.2,
        orientation: NeumorphicIndicatorOrientation.vertical,
        curve: Curves.easeInOutQuad,
        style: IndicatorStyle(
            depth: 0, accent: primaryColor, variant: primaryColor),
      ),
    );
  }

  Widget _buildStepButton(int step, String label) {
    return ElevatedButton(
      onPressed: step == _currentStep ? null : () => _verifyStep(step),
      child: Text(label),
    );
  }
}
