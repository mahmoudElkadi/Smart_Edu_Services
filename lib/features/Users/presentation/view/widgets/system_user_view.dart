import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/utils/colors.dart' as color;
import 'package:smart/core/widgets/heigher-spacer.dart';

import '../../../../../core/widgets/custom_button_icon.dart';
import '../../../../Task/presenatation/view/widgets/sort_by.dart';
import 'add_new_user.dart';

class SystemUserView extends StatefulWidget {
  const SystemUserView({super.key});

  @override
  State<SystemUserView> createState() => _SystemUserViewState();
}

class _SystemUserViewState extends State<SystemUserView> {
  List<String> items = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8" "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8"
  ];
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length + 1).toString());
    if (mounted) {
      setState(() {});
    }
    _refreshController.loadComplete();
  }

  int count = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.h),
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Team Members",
            style: appStyle(20, Colors.grey, FontWeight.bold),
          ),
          const HeightSpacer(10),
          Align(
            alignment: Alignment.centerRight,
            child: CustomIconButton(
              onTap: () {
                Get.to(() => const AddNewUserView());
              },
              color: Colors.white,
              backGroundColor: HexColor("#00E38C"),
              width: 210.w,
              text: 'Add New User',
            ),
          ),
          const SortByView(),
          SizedBox(
            height: 450.h,
            width: MediaQuery.of(context).size.width,
            child: SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              header: const WaterDropHeader(),
              footer: CustomFooter(
                builder: (BuildContext context, LoadStatus? mode) {
                  Widget body;
                  if (mode == LoadStatus.idle) {
                    body = const Text("pull up load");
                  } else if (mode == LoadStatus.loading) {
                    body = const CupertinoActivityIndicator();
                  } else if (mode == LoadStatus.failed) {
                    body = const Text("Load Failed!Click retry!");
                  } else if (mode == LoadStatus.canLoading) {
                    body = const Text("release to load more");
                  } else {
                    body = const Text("No more Data");
                  }
                  return SizedBox(
                    height: 55.0,
                    child: Center(child: body),
                  );
                },
              ),
              controller: _refreshController,
              onRefresh: _onRefresh,
              onLoading: () async {
                print("Counts before : " + count.toString());
                count += 5;
                print("Counts after : " + count.toString());
                _refreshController.loadComplete();
              },
              child: ListView.separated(
                itemCount: items.length,
                itemBuilder: (c, i) => Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.h),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                "assets/images/book.png",
                                fit: BoxFit.cover,
                                width: 25.h,
                                height: 25.h,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "Mahmoud Elkady",
                            style: appStyle(12, Colors.black, FontWeight.w400),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(10.h),
                        width: MediaQuery.of(context).size.width * 0.35,
                        decoration: BoxDecoration(
                          color: color.Colors.blueColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10.h),
                        ),
                        child: Text(
                          "Admin",
                          textAlign: TextAlign.center,
                          style: appStyle(
                              14, color.Colors.blueColor, FontWeight.w400),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.delete_forever,
                          size: 35,
                        ),
                      )
                    ],
                  ),
                ),
                separatorBuilder: (c, i) => Container(
                  width: MediaQuery.of(context).size.width,
                  height: 10.h,
                  color: Colors.grey.shade100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
