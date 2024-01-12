import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:sidebarx/sidebarx.dart';


class ExampleSidebarX extends StatefulWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  State<ExampleSidebarX> createState() => _ExampleSidebarXState();
}

class _ExampleSidebarXState extends State<ExampleSidebarX> {
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: widget._controller,

      theme: SidebarXTheme(

        margin:  EdgeInsets.all(10.h).copyWith(top: 57.h),
        decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(20.h),bottomRight: Radius.circular(20.h))
        ),
        hoverColor: Colors.black,
        textStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.blue),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),


        iconTheme: IconThemeData(
          color: Colors.black.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.blue,
          size: 20,
        ),
      ),
      extendedTheme:  SidebarXTheme(
        margin: EdgeInsets.only(top: 54.h),
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(20.h),bottomRight: Radius.circular(20.h))
        ),
      ),
      footerDivider: Divider(color: Colors.black.withOpacity(0.3), height: 1),
      headerBuilder: (context, extended) {
        return SizedBox(

          child: Padding(
            padding: const EdgeInsets.all(16.0).copyWith(top: 20.h),
            child: Image.asset('assets/images/logo.png',
              width: 100,
              height: 100,
            ),
          ),
        );
      },
      items:  const [
        SidebarXItem(
          icon: Icons.home_outlined,
          label: 'Home',

        ),
        SidebarXItem(
          
          icon: FontAwesomeIcons.peopleGroup,
          label: 'Users',
        ),
        SidebarXItem(
          icon: FontAwesomeIcons.solidFileLines,
          label: 'Tasks',
        ),
        SidebarXItem(
          icon: Icons.notifications,
          label: 'Notification',
        ),
        SidebarXItem(
          icon:FontAwesomeIcons.userGroup,
          label: 'Account',
        ),
        SidebarXItem(
          icon:Icons.filter_center_focus,
          label: 'Transaction',
        ),
        SidebarXItem(
          icon:Icons.shopping_bag,
          label: 'Freelancer',
        ),
        SidebarXItem(
          icon:FontAwesomeIcons.userPlus,
          label: 'Client',
        ),
        SidebarXItem(
          icon: FontAwesomeIcons.pen,
          label: 'Specialities',
        ),
        SidebarXItem(
          icon: Symbols.monetization_on,
          label: 'Currencies',
        ),
        SidebarXItem(
          icon: Icons.task_alt_sharp,
          label: 'Statuses',
        ),
        SidebarXItem(
          icon: Icons.flag,
          label: 'Countries',
        ),
        SidebarXItem(
          icon: Symbols.price_check,
          label: 'Profit',
        ),
        SidebarXItem(
          icon: Symbols.settings,
          label: 'Settings',
        ),

      ],
    );
  }
}

