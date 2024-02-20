import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/dropdownItem.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import '../../../../Task page/presentation/view/widgets/text_field_item.dart';
import '../../../data/repos/status_repo_impl.dart';
import '../../manger/Status cubit/Status_cubit.dart';
import '../../manger/Status cubit/Status_state.dart';

Future editStatusDialog(BuildContext context, id) {
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  return showDialog(
    context: context,
    builder: (context) => BlocProvider(
      create: (context) => StatusCubit(StatusRepoImpl())..getOneStatus(id),
      child: BlocBuilder<StatusCubit, StatusState>(
        builder: (context, state) => Dialog(
          alignment: Alignment.center,
          insetPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          child: FutureBuilder(
              future: StatusCubit.get(context).oneStatus,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final oneStatus = snapshot.data;
                  if (state is GetOneStatusSuccess) {
                    StatusCubit.get(context).statusNameController.text =
                        oneStatus?.message?.statusname as String;
                    StatusCubit.get(context).roleSearchController.text =
                        oneStatus?.message?.role as String;
                  }

                  return SingleChildScrollView(
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
                                "Add New Status",
                                style: appStyle(
                                    context, 20, Colors.black, FontWeight.w900),
                              ),
                            ),
                            const HeightSpacer(50),
                            TaskTextItem(
                              title: "Status Name",
                              hint: "Status Name",
                              controller:
                                  StatusCubit.get(context).statusNameController,
                            ),
                            const HeightSpacer(15),
                            DropdownItem(
                              searchController:
                                  StatusCubit.get(context).roleSearchController,
                              items: StatusCubit.get(context).status,
                              hintText: 'Role',
                              label: 'Role',
                            ),
                            const HeightSpacer(30),
                            Align(
                              alignment: Alignment.center,
                              child: CustomButton2(
                                backGroundColor: Colors.blue,
                                widget:
                                    StatusCubit.get(context).isLoading == false
                                        ? Text(
                                            "Edit",
                                            style: appStyle(context, 16,
                                                Colors.white, FontWeight.bold),
                                          )
                                        : const CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                onTap: () async {
                                  if (formKey.currentState!.validate()) {
                                    StatusCubit.get(context).loading();
                                    StatusCubit.get(context).updateSpecialist(
                                        name: StatusCubit.get(context)
                                            .statusNameController
                                            .text,
                                        role: StatusCubit.get(context)
                                            .roleSearchController
                                            .text,
                                        id: id);
                                  }
                                },
                              ),
                            ),
                            const HeightSpacer(50)
                          ],
                        ),
                      )),
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
