import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import '../../../data/repos/Account_repo_impl.dart';
import '../../manger/Account cubit/Account_cubit.dart';
import '../../manger/Account cubit/Account_state.dart';

Future openAccountDialog(BuildContext context, id) {
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  return showDialog(
    context: context,
    builder: (context) => BlocProvider(
      create: (context) => AccountCubit(AccountRepoImpl())..getOneAccount(id),
      child: BlocBuilder<AccountCubit, AccountState>(
        builder: (context, state) => Dialog(
          alignment: Alignment.center,
          insetPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          child: FutureBuilder(
              future: AccountCubit.get(context).oneAccounts,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final oneAccount = snapshot.data;

                  return SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(15.0.h),
                        child: SafeArea(
                            child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "Account Details",
                                  style: appStyle(context, 20, Colors.black,
                                      FontWeight.w900),
                                ),
                              ),
                              const HeightSpacer(50),
                              Text(
                                "Account Name",
                                style: appStyle(
                                    context, 18, Colors.blue, FontWeight.w600),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15.h, horizontal: 10.w),
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.h)),
                                child: Text(
                                  oneAccount?.account?.title == null
                                      ? ""
                                      : oneAccount?.account?.title as String,
                                  style: appStyle(context, 16,
                                      Colors.grey.shade500, FontWeight.w500),
                                ),
                              ),
                              const HeightSpacer(15),
                              Text(
                                "Type",
                                style: appStyle(
                                    context, 18, Colors.blue, FontWeight.w600),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15.h, horizontal: 10.w),
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.h)),
                                child: Text(
                                  oneAccount?.account?.type as String,
                                  style: appStyle(context, 16,
                                      Colors.grey.shade500, FontWeight.w500),
                                ),
                              ),
                              const HeightSpacer(15),
                              Text(
                                "Account Balance",
                                style: appStyle(
                                    context, 18, Colors.blue, FontWeight.w600),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15.h, horizontal: 10.w),
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.h)),
                                child: Text(
                                  oneAccount?.account!.balance.toString()
                                      as String,
                                  style: appStyle(context, 16,
                                      Colors.grey.shade500, FontWeight.w500),
                                ),
                              ),
                              const HeightSpacer(50)
                            ],
                          ),
                        )),
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return throw Exception(snapshot.hasError);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    ),
  );
}
