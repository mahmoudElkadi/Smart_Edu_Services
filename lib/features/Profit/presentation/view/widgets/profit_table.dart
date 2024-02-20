import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/features/Profit/presentation/manger/profit%20cubit/profit_cubit.dart';

import '../../../../../core/utils/app_style.dart';
import '../../manger/profit cubit/profit_state.dart';

class ProfitTableScreen extends StatelessWidget {
  const ProfitTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfitCubit, ProfitState>(
      builder: (context, state) => FutureBuilder(
          future: ProfitCubit.get(context).customerProfit,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final profit = snapshot.data;
              return Container(
                padding: EdgeInsets.all(10.h),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      width: MediaQuery.sizeOf(context).width,
                      color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                'Profit',
                                style: appStyle(
                                    context, 16, Colors.white, FontWeight.w600),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                'Max',
                                style: appStyle(
                                    context, 16, Colors.white, FontWeight.w600),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                'Min',
                                style: appStyle(
                                    context, 16, Colors.white, FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20.h, horizontal: 5.w),
                      width: MediaQuery.sizeOf(context).width,
                      color: Colors.grey.shade50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                'Customer Profit',
                                style: appStyle(
                                    context, 12, Colors.black, FontWeight.w400),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                profit!.profitSystem!.maximum.toString(),
                                style: appStyle(
                                    context, 12, Colors.black, FontWeight.w400),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                profit.profitSystem!.minimum.toString(),
                                style: appStyle(
                                    context, 12, Colors.black, FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.grey.shade200,
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height * 0.02,
                    ),
                    FutureBuilder(
                        future: ProfitCubit.get(context).specialistProfit,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final specialist = snapshot.data;
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 5.w),
                              width: MediaQuery.sizeOf(context).width,
                              color: Colors.grey.shade50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        'Specialist Profit',
                                        style: appStyle(context, 12,
                                            Colors.black, FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        specialist!.profitSystem!.maximum
                                            .toString(),
                                        style: appStyle(context, 12,
                                            Colors.black, FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        specialist.profitSystem!.minimum
                                            .toString(),
                                        style: appStyle(context, 12,
                                            Colors.black, FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ],
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
                  ],
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
    );
  }
}
