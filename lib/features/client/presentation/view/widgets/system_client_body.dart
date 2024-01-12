import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/widgets/heigher-spacer.dart';

import '../../../../../core/widgets/custom_button_icon.dart';
import '../../../../Task/presenatation/view/widgets/sort_by.dart';
import 'add_new_client.dart';
import 'client_task_table.dart';

class SystemClientBody extends StatefulWidget {
  const SystemClientBody({super.key});

  @override
  State<SystemClientBody> createState() => _SystemClientBodyState();
}

class _SystemClientBodyState extends State<SystemClientBody> {
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
            "System Clients",
            style: appStyle(20, Colors.grey.shade700, FontWeight.bold),
          ),
          const HeightSpacer(10),
          Align(
            alignment: Alignment.centerRight,
            child: CustomIconButton(
              onTap: () {
                Get.to(() => const AddNewClientView());
              },
              color: Colors.white,
              backGroundColor: HexColor("#00E38C"),
              width: 210.w,
              text: 'Add New Client',
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
                  print("Counts before : $count");
                  count += 5;
                  print("Counts after : $count");
                  _refreshController.loadComplete();
                },
                child: const ClientTaskTable()),
          ),
        ],
      ),
    );
  }
}
