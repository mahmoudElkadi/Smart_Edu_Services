import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/features/Main/presentation/views/main_view.dart';
import 'package:smart/features/bank/presentation/manger/bank%20cubit/bank_cubit.dart';
import 'package:smart/features/bank/presentation/view/widgets/bank_details_body.dart';

import '../../../data/repos/bank_repo_impl.dart';

class BankDetails extends StatelessWidget {
  const BankDetails({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BankCubit(BankRepoImpl())..getOneFreelancer(id),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("#3b82f6"),
          leading: GestureDetector(
              onTap: () {
                Get.offAll(() => const MainView(x: 4));
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: Padding(
            padding: EdgeInsets.only(right: 30.w),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Bank Account Details",
                style: appStyle(context, 20, Colors.white, FontWeight.bold),
              ),
            ),
          ),
        ),
        body: BankDetailsBody(),
      ),
    );
  }
}
