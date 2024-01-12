import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart/features/Login/presentation/view/login_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/book.png"),
        fit: BoxFit.fitHeight,
      )),
      child: Column(
        children: [
          SizedBox(
            height: 120.h,
          ),
          const Text(
            'Smart Edu Services',
            style: TextStyle(
                color: Colors.white70,
                fontSize: 22,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void navigateToHome() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.to(() => const LoginView());
    });
  }
}
