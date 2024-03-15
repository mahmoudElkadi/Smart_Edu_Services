// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:smart/features/Login/presentation/view/login_view.dart';
//
// class SplashViewBody extends StatefulWidget {
//   const SplashViewBody({Key? key}) : super(key: key);
//
//   @override
//   State<SplashViewBody> createState() => _SplashViewBodyState();
// }
//
// class _SplashViewBodyState extends State<SplashViewBody>
//     with SingleTickerProviderStateMixin {
//   @override
//   void initState() {
//     super.initState();
//     navigateToHome();
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       constraints: const BoxConstraints.expand(),
//       decoration: const BoxDecoration(
//           image: DecorationImage(
//         image: AssetImage("assets/images/book.png"),
//         fit: BoxFit.fitHeight,
//       )),
//       child: Column(
//         children: [
//           SizedBox(
//             height: 120.h,
//           ),
//           const Text(
//             'Smart Edu Services',
//             style: TextStyle(
//                 color: Colors.white70,
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
//
//   void navigateToHome() {
//     Future.delayed(const Duration(milliseconds: 3000), () {
//       Get.to(() => const LoginView());
//     });
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart/core/widgets/heigher-spacer.dart';

import '../../../../Login/presentation/view/login_view.dart';

class SplashViewBody extends StatefulWidget {
  @override
  _SplashViewBodyState createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _a = true;
      });
    });
    Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _b = true;
      });
    });
    Timer(const Duration(milliseconds: 1300), () {
      setState(() {
        _c = true;
      });
    });
    Timer(const Duration(milliseconds: 1700), () {
      setState(() {
        _e = true;
      });
    });
    Timer(const Duration(milliseconds: 3400), () {
      setState(() {
        _d = true;
      });
    });
    Timer(const Duration(milliseconds: 3850), () {
      setState(() {
        Navigator.of(context).pushReplacement(
          ThisIsFadeRoute(
            route: const LoginView(),
            page: const SizedBox(),
          ),
        );
      });
    });
  }

  bool _a = false;
  bool _b = false;
  bool _c = false;
  bool _d = false;
  bool _e = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _h = MediaQuery.of(context).size.height;
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: _d ? 900 : 2500),
              curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
              height: _d
                  ? 0
                  : _a
                      ? _h / 2
                      : 20,
              width: 20,
              // color: Colors.black,
            ),
            AnimatedContainer(
              duration: Duration(
                  seconds: _d
                      ? 1
                      : _c
                          ? 2
                          : 0),
              curve: Curves.fastLinearToSlowEaseIn,
              height: _d
                  ? _h
                  : _c
                      ? 150
                      : 20,
              width: _d
                  ? _w
                  : _c
                      ? 250
                      : 20,
              decoration: BoxDecoration(
                  color: _b ? Colors.white : Colors.transparent,
                  // shape: _c? BoxShape.rectangle : BoxShape.circle,
                  borderRadius: _d
                      ? const BorderRadius.only()
                      : BorderRadius.circular(30)),
              child: Center(
                child: _e
                    ? Column(
                        children: [
                          Image.asset("assets/images/logo.png"),
                          const HeightSpacer(15),
                          Text(
                            "SmartEduServices",
                            style: GoogleFonts.acme(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          // DelayedWidget(
                          //     delayDuration: const Duration(
                          //         milliseconds: 1000), // Not required
                          //     animationDuration: const Duration(
                          //         milliseconds: 1000), // Not required
                          //     animation: DelayedAnimations
                          //         .SLIDE_FROM_BOTTOM, // Not required
                          //     child: Column(
                          //       children: [
                          //         Text(
                          //           "SmartEduServices",
                          //           style: GoogleFonts.acme(
                          //               fontSize: 28,
                          //               fontWeight: FontWeight.bold,
                          //               color: Colors.black),
                          //         ),
                          //       ],
                          //     ))
                        ],
                      )
                    : const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThisIsFadeRoute extends PageRouteBuilder {
  final Widget page;
  final Widget route;

  ThisIsFadeRoute({required this.page, required this.route})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: route,
          ),
        );
}
