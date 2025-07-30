import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//RESOURCES
import 'package:color_package/color_package.dart';
import 'package:shared_resources/shared_resources.dart';
//PACKAGES
import 'package:announcement_package/announcement_package.dart';
//WIDGET
import 'package:home_package/src/presentation/widget/announcements/announcement_item.dart';

class AnnouncementsWidget extends ConsumerStatefulWidget {
  final double hoizontalBodyMargin;

  const AnnouncementsWidget({super.key, required this.hoizontalBodyMargin});

  @override
  ConsumerState<AnnouncementsWidget> createState() =>
      _AnnouncementsWidgetState();
}

class _AnnouncementsWidgetState extends ConsumerState<AnnouncementsWidget> {
  @override
  void initState() {
    super.initState();

    // 🔁 Only call once when the widget initializes
    Future.microtask(() {
      ref.read(announcementProvider.notifier).getAnnouncements();
    });
  }

  @override
  Widget build(BuildContext context) {
    //ANNOUNCEMENT PROVIDER STATE
    final announcementState = ref.watch(announcementProvider);

    //GET ANNOUNCEMENT LIST
    final announcementsList = announcementState.announcementList;

    if (announcementsList != null) {
      return Positioned(
        top: 520,
        left: widget.hoizontalBodyMargin,
        right: widget.hoizontalBodyMargin,
        child: Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: AppColors.blue0085FF,
              width: 1.5,
            ), //#0085FF
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Company Announcements 📢",
                      style: TextStyle(
                        color: AppColors.blue0085FF, //#0085FF
                        fontFamily: AppFonts.inter,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    //Image(image: image)
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: announcementsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 5.0,
                      ),
                      child: AnnouncementItemWidget(
                        announcement: announcementsList[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    } else if (announcementState.isLoading == true &&
        announcementState.failure == null) {
      //IN PROGRESS
      return Center(child: CircularProgressIndicator());
    } else if (announcementState.failure != null) {
      //FAILURE
      return Center(child: Text(announcementState.failure.toString()));
    } else {
      return Text("");
    }
  }
}
