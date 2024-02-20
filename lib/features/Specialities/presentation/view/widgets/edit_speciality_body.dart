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

class EditSpecialityViewBody extends StatelessWidget {
  const EditSpecialityViewBody({
    super.key,
    required this.id,
  });
  final String id;

  @override
  Widget build(BuildContext context) {
    late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocBuilder<SpecialityCubit, SpecialityState>(
      builder: (context, state) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0.h),
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(12.h),
                child: GestureDetector(
                    onTap: () {
                      Get.offAll(() => const MainView(
                            x: 8,
                          ));
                    },
                    child: const Icon(Icons.arrow_back)),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60.h,
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Speciality Details",
                  style: appStyle(context, 20, Colors.black, FontWeight.w900),
                ),
              ),
              FutureBuilder(
                  future: SpecialityCubit.get(context).oneSpeciality,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final speciality = snapshot.data;
                      if (state is GetOneSpecialtySuccess) {
                        SpecialityCubit.get(context)
                                .subSpecialityController
                                .text =
                            speciality?.speciality!.subSpeciality as String;
                        SpecialityCubit.get(context).specialityController.text =
                            speciality?.speciality!.speciality as String;
                      }

                      return Padding(
                        padding: EdgeInsets.all(15.h),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              const HeightSpacer(50),
                              TaskTextItem(
                                title: "Sub-Speciality",
                                hint: "Sub-Speciality",
                                controller: SpecialityCubit.get(context)
                                    .subSpecialityController,
                              ),
                              const HeightSpacer(15),
                              TaskTextItem(
                                title: "Speciality",
                                hint: "Speciality",
                                controller: SpecialityCubit.get(context)
                                    .specialityController,
                              ),
                              const HeightSpacer(30),
                              Align(
                                alignment: Alignment.center,
                                child: CustomButton2(
                                  backGroundColor: Colors.blue,
                                  widget:
                                      SpecialityCubit.get(context).isLoading ==
                                              false
                                          ? Text(
                                              "Edit",
                                              style: appStyle(
                                                  context,
                                                  16,
                                                  Colors.white,
                                                  FontWeight.bold),
                                            )
                                          : const CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                  onTap: () async {
                                    if (formKey.currentState!.validate()) {
                                      SpecialityCubit.get(context).loading();
                                      SpecialityCubit.get(context)
                                          .updateSpecialist(
                                              id: id,
                                              sub:
                                                  SpecialityCubit.get(context)
                                                      .subSpecialityController
                                                      .text,
                                              specialty:
                                                  SpecialityCubit.get(context)
                                                      .specialityController
                                                      .text);
                                    }
                                  },
                                ),
                              ),
                              const HeightSpacer(50),
                            ],
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
            ],
          )),
        ),
      ),
    );
  }
}
