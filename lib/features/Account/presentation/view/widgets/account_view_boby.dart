import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/features/Account/presentation/view/widgets/account_table.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import '../../manger/Account cubit/Account_cubit.dart';
import '../../manger/Account cubit/Account_state.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
        builder: (context, state) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(15.h),
                color: Colors.grey.shade200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "System Account",
                      style: appStyle(
                          context, 20, Colors.grey.shade700, FontWeight.bold),
                    ),
                    const HeightSpacer(30),
                    const AccountTableScreen(),
                  ],
                ),
              ),
            ));
  }
}
