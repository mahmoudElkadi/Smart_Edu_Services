import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/widgets/heigher-spacer.dart';
import 'package:smart/features/Notification/presentation/manger/note%20cubit/note_cubit.dart';
import 'package:smart/features/Notification/presentation/manger/note%20cubit/note_state.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) => SingleChildScrollView(
        child: Container(
          color: Colors.grey.shade200,
          child: Padding(
            padding: EdgeInsets.all(15.0.h),
            child: Column(
              children: [
                //const HeightSpacer(20),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const Icon(
                //       Icons.notifications_none_outlined,
                //       size: 30,
                //     ),
                //     SizedBox(
                //       width: 10.w,
                //     ),
                //     Text(
                //       "Notifications",
                //       style: appStyle(20, Colors.black, FontWeight.bold),
                //     ),
                //   ],
                // ),
                FutureBuilder(
                    future: NoteCubit.get(context).allNote,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final note = snapshot.data;
                        return ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.all(10.h),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.h)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 50.w,
                                          height: 50.h,
                                          decoration: BoxDecoration(
                                              color: Colors.yellow.shade200,
                                              shape: BoxShape.circle),
                                          child: Icon(Icons.error,
                                              color: Colors.yellow.shade600,
                                              size: 30),
                                        ),
                                        // const Align(
                                        //     alignment: Alignment.topRight,
                                        //     child: Icon(
                                        //       Icons.close,
                                        //       size: 30,
                                        //     ))
                                      ],
                                    ),
                                    const HeightSpacer(15),
                                    Text(
                                      note.notes[index].content.toString(),
                                      maxLines: 2,
                                      style: appStyle(context, 14, Colors.black,
                                          FontWeight.w500),
                                      textAlign: TextAlign.center,
                                    ),
                                    const HeightSpacer(15),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Icon(
                                          Icons.watch_later_outlined,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          DateFormat('dd/MM/yyyy HH:mm a')
                                              .format(note.notes[index]
                                                  .createdAt as DateTime),
                                          style: appStyle(context, 14,
                                              Colors.grey, FontWeight.w500),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const HeightSpacer(50);
                            },
                            itemCount: note!.notes.length);
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
          ),
        ),
      ),
    );
  }
}
