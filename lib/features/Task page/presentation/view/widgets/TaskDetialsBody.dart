import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/utils/colors.dart' as color;
import 'package:smart/core/widgets/heigher-spacer.dart';
import 'package:smart/features/Task%20page/presentation/manger/Details%20task%20cubit/details_task_cubit.dart';
import 'package:smart/features/Task%20page/presentation/manger/Details%20task%20cubit/details_task_state.dart';
import 'package:smart/features/Task%20page/presentation/view/widgets/edit_task.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_button.dart';

class TaskDetailsViewBody extends StatelessWidget {
  const TaskDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    String? dateStartValue;
    String? dateEndValue;
    String? value;
    DateTimeRange selectedDates =
        DateTimeRange(start: DateTime.now(), end: DateTime.now());

    return BlocBuilder<DetailsTaskCubit, TaskDetailsState>(
        builder: (context, state) {
      return FutureBuilder(
          future: DetailsTaskCubit.get(context).myTasks,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var task = snapshot.data;
              if (state is GetTaskDetailsSuccess) {
                DetailsTaskCubit.get(context).titleController.text =
                    task?.task?.title ?? "";
                DetailsTaskCubit.get(context).channelController.text =
                    task?.task?.channel ?? "";
              }
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(15.0.h),
                  child: SafeArea(
                      child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60.h,
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Task Details",
                          style: appStyle(
                              context, 20, Colors.black, FontWeight.w900),
                        ),
                      ),
                      const HeightSpacer(20),
                      Container(
                        padding: EdgeInsets.all(15.h),
                        width: MediaQuery.of(context).size.width,
                        height: 80.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.h),
                            border:
                                Border.all(color: Colors.grey, width: 0.7.w)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              task?.task?.serialNumber.toString() ?? "",
                              style: appStyle(
                                  context, 16, Colors.black, FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.h),
                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                  color:
                                      color.Colors.blueColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10.h),
                                  border: Border.all(
                                      color: Colors.grey, width: 0.7.w)),
                              child: Text(
                                task?.task?.taskStatus?.statusname.toString() ??
                                    "-",
                                textAlign: TextAlign.center,
                                style: appStyle(context, 14,
                                    color.Colors.blueColor, FontWeight.w400),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.delete_forever,
                                size: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const HeightSpacer(20),
                      EditTaskForm(
                        detailsTaskModel: task!,
                      ),
                      const HeightSpacer(25),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 40.h),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: color.Colors.blueColor.withOpacity(0.08),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Change Status",
                              style: appStyle(
                                  context, 18, Colors.black, FontWeight.w500),
                            ),
                            const HeightSpacer(20),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: DropdownButtonFormField<String>(
                                dropdownColor: Colors.white,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    focusColor: Colors.grey,
                                    focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1)),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                value: value,
                                isDense: true,
                                hint: const Text("Status"),
                                isExpanded: true,
                                borderRadius: BorderRadius.circular(10),
                                //padding: EdgeInsets.all(15.h),
                                onChanged: (newValue) {
                                  value = newValue;
                                },
                                items: store.map((String value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            const HeightSpacer(30),
                            Align(
                              alignment: Alignment.center,
                              child: CustomButton(
                                backGroundColor: Colors.blue,
                                width: MediaQuery.of(context).size.width > 600
                                    ? 300.w
                                    : 200.w,
                                text: "Change",
                                onTap: () async {
                                  //  Get.to(() => const TaskDetials());
                                  // Get.to(()=>MainView());
                                  // if(formKey.currentState!.validate()){
                                  //   LoginModel model = LoginModel(
                                  //       email: LoginCubit.get(context).email.text,
                                  //       password: LoginCubit.get(context).password.text);
                                  //   await LoginCubit.get(context).userLogin(model);
                                  // }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                ),
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
              throw Exception(snapshot.error);
              return SafeArea(child: Text('Error: ${snapshot.error}'));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    });
  }
}
