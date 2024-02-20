import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/features/Client/presentation/view/client_view.dart';
import 'package:smart/features/Main/presentation/views/widgets/sideBar.dart';
import 'package:smart/features/Notification/presentation/view/notification_view.dart';
import 'package:smart/features/Task/presenatation/view/task_View.dart';
import 'package:smart/features/Task/presenatation/view/widgets/filter_task_table.dart';

import '../../../../core/Network/shared.dart';
import '../../../../core/utils/constant.dart';
import '../../../Account/presentation/view/account_View.dart';
import '../../../Country/presentation/view/country_view.dart';
import '../../../Currency/presentation/view/currencyView.dart';
import '../../../Home/presentation/view/home_view.dart';
import '../../../Profit/presentation/view/profit_view.dart';
import '../../../Settings/presentation/view/settings_view.dart';
import '../../../Specialities/presentation/view/specialities_view.dart';
import '../../../Statuses/presentation/view/widgets/status_view_body.dart';
import '../../../Transactions/presentation/view/transaction_view.dart';
import '../../../Users/presentation/view/users_view.dart';
import '../../../freelancer/presentation/view/freelancer_view.dart';

class MainView extends StatefulWidget {
  const MainView({
    super.key,
    this.x,
  });
  final int? x;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final _key = GlobalKey<ScaffoldState>();
  late var _controller;

  @override
  void initState() {
    _key.currentState?.closeDrawer();
    _controller =
        SidebarXController(selectedIndex: this.widget.x ?? 0, extended: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    userRole = CacheHelper.getData(key: "userRole");

    return Builder(
      builder: (context) {
        final isSmallScreen = MediaQuery.of(context).size.width < 1000;
        return SafeArea(
          child: Scaffold(
            key: _key,
            appBar: isSmallScreen
                ? AppBar(
                    backgroundColor: Colors.blueAccent,
                    leading: IconButton(
                      onPressed: () {
                        if (_key.currentState!.isEndDrawerOpen) {
                          _key.currentState?.openDrawer();
                        }
                        _key.currentState?.openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                    title: _controller.selectedIndex == 3
                        ? Center(
                            child: Padding(
                            padding: EdgeInsets.only(right: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Notifications",
                                  style: appStyle(context, 20, Colors.white,
                                      FontWeight.bold),
                                ),
                              ],
                            ),
                          ))
                        : Container(),
                    actions: [
                      _controller.selectedIndex == 2
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.h),
                              child: const FilterTaskTable(),
                            )
                          : Container(
                              color: Colors.blue,
                            )
                    ],
                  )
                : null,
            drawer: ExampleSidebarX(controller: _controller),
            body: Row(
              children: [
                if (!isSmallScreen) ExampleSidebarX(controller: _controller),
                Expanded(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      switch (userRole) {
                        case "admin":
                          switch (_controller.selectedIndex) {
                            case 0:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return const HomeView();
                            case 1:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return const UserView();
                            case 2:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return TaskView();
                            case 3:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return const NotificationView();
                            case 4:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return const AccountView();
                            case 5:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return const TransactionView();
                            case 6:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return const FreelancerView();
                            case 7:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return const SystemClientView();
                            case 8:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return const SpecialtyView();

                            case 9:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return const CurrencyView();
                            case 10:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return const StatusViewBody();
                            case 11:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return const CountryView();
                            case 12:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return const ProfitView();
                            case 13:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return const SettingView();
                            default:
                              return Text(
                                "pageTitle",
                                style: appStyle(
                                    context, 16, Colors.black, FontWeight.bold),
                              );
                          }
                        case "specialistService":
                          switch (_controller.selectedIndex) {
                            case 0:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return const TaskView();
                            case 1:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return const UserView();
                            case 2:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return TaskView();
                            case 3:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return const NotificationView();
                            case 4:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return const AccountView();
                            case 5:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return const TransactionView();
                            case 6:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return const FreelancerView();
                            case 7:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return const SystemClientView();
                            case 8:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return const SpecialtyView();

                            case 9:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return const CurrencyView();
                            case 10:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return const StatusViewBody();
                            case 11:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return const CountryView();
                            case 12:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return const ProfitView();
                            case 13:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {});
                              });
                              return const SettingView();
                            default:
                              return Text(
                                "pageTitle",
                                style: appStyle(
                                    context, 16, Colors.black, FontWeight.bold),
                              );
                          }
                        default:
                          return Text(
                            "pageTitle",
                            style: appStyle(
                                context, 16, Colors.black, FontWeight.bold),
                          );
                      }
                      // switch (_controller.selectedIndex) {
                      //   case 0:
                      //     WidgetsBinding.instance.addPostFrameCallback((_) {
                      //       setState(() {});
                      //     });
                      //     return const HomeView();
                      //   case 1:
                      //     WidgetsBinding.instance.addPostFrameCallback((_) {
                      //       setState(() {});
                      //     });
                      //     return const UserView();
                      //   case 2:
                      //     WidgetsBinding.instance.addPostFrameCallback((_) {
                      //       setState(() {});
                      //     });
                      //     return TaskView();
                      //   case 3:
                      //     WidgetsBinding.instance.addPostFrameCallback((_) {
                      //       setState(() {});
                      //     });
                      //     return const NotificationView();
                      //   case 4:
                      //     WidgetsBinding.instance.addPostFrameCallback((_) {
                      //       setState(() {});
                      //     });
                      //     return const AccountView();
                      //   case 5:
                      //     WidgetsBinding.instance.addPostFrameCallback((_) {
                      //       setState(() {});
                      //     });
                      //     return const TransactionView();
                      //   case 6:
                      //     WidgetsBinding.instance.addPostFrameCallback((_) {
                      //       setState(() {});
                      //     });
                      //     return const FreelancerView();
                      //   case 7:
                      //     WidgetsBinding.instance.addPostFrameCallback((_) {
                      //       setState(() {});
                      //     });
                      //     return const SystemClientView();
                      //   case 8:
                      //     WidgetsBinding.instance.addPostFrameCallback((_) {
                      //       setState(() {});
                      //     });
                      //     return const SpecialtyView();
                      //
                      //   case 9:
                      //     WidgetsBinding.instance.addPostFrameCallback((_) {
                      //       setState(() {});
                      //     });
                      //     return const CurrencyView();
                      //   case 10:
                      //     WidgetsBinding.instance.addPostFrameCallback((_) {
                      //       setState(() {});
                      //     });
                      //     return const StatusViewBody();
                      //   case 11:
                      //     WidgetsBinding.instance.addPostFrameCallback((_) {
                      //       setState(() {});
                      //     });
                      //     return const CountryView();
                      //   case 12:
                      //     WidgetsBinding.instance.addPostFrameCallback((_) {
                      //       setState(() {});
                      //     });
                      //     return const ProfitView();
                      //   case 13:
                      //     WidgetsBinding.instance.addPostFrameCallback((_) {
                      //       setState(() {});
                      //     });
                      //     return const SettingView();
                      //   default:
                      //     return Text(
                      //       "pageTitle",
                      //       style: appStyle(
                      //           context, 16, Colors.black, FontWeight.bold),
                      //     );
                      // }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
