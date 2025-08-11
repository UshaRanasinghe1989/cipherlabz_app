import 'package:attendance_package/attendance_package.dart';
import 'package:core/enum/user_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
//RESOURCES
import 'package:color_package/color_package.dart';
import 'package:home_package/home_package.dart';
import 'package:shared_resources/shared_resources.dart';
import 'package:login_package/login_package.dart';
import 'package:leave_package/leave_package.dart';

class NavigationScreenWidget extends ConsumerStatefulWidget {
  const NavigationScreenWidget({super.key});

  @override
  ConsumerState<NavigationScreenWidget> createState() =>
      _NavigationScreenWidgetState();
}

class _NavigationScreenWidgetState
    extends ConsumerState<NavigationScreenWidget> {
  int _currentPageIndex = 0;

  final List<Widget> pagesList = [
    HomePageWidget(),
    AttendanceDetailPage(),
    MyLeavePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final loginProviderValue = ref.watch(loginProvider);
    final category = loginProviderValue.user?.category;

    final pagesList = [
      HomePageWidget(),
      category == UserCategory.regularUser
          ? AttendanceDetailPage()
          : SuperUserWidgets(),
      category == UserCategory.regularUser
          ? MyLeavePage()
          : SuperUserLeaveWidgets(),
      Placeholder(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentPageIndex,
        onTap: (index) => {
          setState(() {
            _currentPageIndex = index;
            print(_currentPageIndex);
          }),
        },
        selectedItemColor: AppColors.blue0085FF, //#0085FF
        unselectedItemColor: AppColors.gray7C7A82, //#7C7A82
        backgroundColor: AppColors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outlined),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.fileIcon,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                _currentPageIndex == 2
                    ? AppColors.blue0085FF
                    : AppColors.gray7C7A82,
                BlendMode.srcIn,
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.userIcon,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                _currentPageIndex == 3
                    ? AppColors.blue0085FF
                    : AppColors.gray7C7A82,
                BlendMode.srcIn,
              ),
            ),
            label: "",
          ),
        ],
      ),
      body: pagesList[_currentPageIndex],
    );
  }
}
