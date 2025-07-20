import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
//RESOURCES
import 'package:color_package/color_package.dart';
import 'package:home_package/home_package.dart';
import 'package:shared_resources/shared_resources.dart';

class NavigationScreenWidget extends StatefulWidget {
  const NavigationScreenWidget({super.key});

  @override
  State<NavigationScreenWidget> createState() =>
      _NavigationScreenWidgetWidgetState();
}

class _NavigationScreenWidgetWidgetState extends State<NavigationScreenWidget> {
  int _currentPageIndex = 0;

  final List<Widget> pagesList = [HomePageWidget() /*AttendanceDetailPage()*/];

  @override
  Widget build(BuildContext context) {
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
                AppColors.gray7C7A82, //#7C7A82
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
                AppColors.gray7C7A82, //#7C7A82
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
