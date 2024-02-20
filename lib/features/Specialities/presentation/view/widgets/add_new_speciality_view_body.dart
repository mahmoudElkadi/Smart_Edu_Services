import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart/features/Specialities/presentation/manger/Task%20cubit/Specialty_cubit.dart';
import 'package:smart/features/Specialities/presentation/manger/Task%20cubit/Specialty_state.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import '../../../../Main/presentation/views/main_view.dart';
import '../../../../Task page/presentation/view/widgets/text_field_item.dart';
import '../../../data/repos/specialty_repo_impl.dart';

Future openDialog(BuildContext context) {
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  return showDialog(
    context: context,
    builder: (context) => BlocProvider(
      create: (context) => SpecialityCubit(SpecialityRepoImpl()),
      child: BlocBuilder<SpecialityCubit, SpecialityState>(
        builder: (context, state) => Dialog(
          alignment: Alignment.center,
          insetPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeightSpacer(15),
                    GestureDetector(
                      onTap: () {
                        Get.offAll(() => const MainView(
                              x: 8,
                            ));
                      },
                      child: Text(
                        'X',
                        style: appStyle(
                            context, 25, Colors.black, FontWeight.bold),
                      ),
                    ),
                    Column(
                      children: [
                        const HeightSpacer(25),
                        Text(
                          "Add New Speciality",
                          style: appStyle(
                              context, 20, Colors.black, FontWeight.bold),
                        ),
                        const HeightSpacer(50),
                        TaskTextItem(
                            type: 'Sub-Speciality',
                            title: "Sub-Speciality",
                            hint: "Sub-Speciality",
                            controller: SpecialityCubit.get(context)
                                .subSpecialityController),
                        const HeightSpacer(15),
                        TaskTextItem(
                            type: 'Speciality',
                            title: "Speciality",
                            hint: "Speciality",
                            controller: SpecialityCubit.get(context)
                                .specialityController),
                        const HeightSpacer(30),
                        Align(
                          alignment: Alignment.center,
                          child: CustomButton2(
                            backGroundColor: Colors.blue,
                            widget:
                                SpecialityCubit.get(context).isLoading == false
                                    ? Text(
                                        "Add",
                                        style: appStyle(context, 16,
                                            Colors.white, FontWeight.bold),
                                      )
                                    : const CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                SpecialityCubit.get(context).loading();
                                SpecialityCubit.get(context).createSpecialist(
                                    sub: SpecialityCubit.get(context)
                                        .subSpecialityController
                                        .text,
                                    specialty: SpecialityCubit.get(context)
                                        .specialityController
                                        .text);
                              }
                            },
                          ),
                        ),
                        const HeightSpacer(25),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
