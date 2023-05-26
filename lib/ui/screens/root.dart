import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:sakuralifestoryschool/ui/screens/search.dart';
import 'package:sakuralifestoryschool/ui/widgets/other_widget.dart';

import '../../core/getx/slider_drawer_controller.dart';
import '../../core/utils/constant.dart';
import '../widgets/nav_bar_bottom_widget.dart';
import '../widgets/screen_widget.dart';

// ignore: must_be_immutable
class RootScreen extends StatelessWidget {
  GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();

  @override
  Widget build(BuildContext context) {
    Screen.setPortrait();
    final controller = Get.put(RootController());
    return Obx(() {
      return Scaffold(
        body: SafeArea(
          child: SliderDrawer(
            key: _key,
            splashColor: Colors.grey[800]!,
            appBar: SliderAppBar(
                appBarColor: Colors.grey[800]!,
                appBarHeight: 50,
                drawerIconSize: 30,
                appBarPadding: EdgeInsets.all(0),
                drawerIconColor: Colors.white,
                trailing: IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: DataSearch());
                  },
                  icon: Icon(
                    Icons.manage_search,
                    size: 37,
                    color: Colors.white,
                  ),
                ),
                title: SizedBox(
                  child: Image.asset(
                    'assets/images/sakura.PNG',
                    width: double.infinity,
                  ),
                )),
            sliderOpenSize: 250,
            slider: SliderView(
              onItemClick: (title) {
                _key.currentState!.closeSlider();
              },
            ),
            child: controller.currentPage,
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          itemColor: context.theme.colorScheme.secondary,
          currentIndex: controller.currentIndex.value,
          onChange: (index) {
            controller.changePage(index);
          },
          children: [
            CustomBottomNavigationItem(
              icon: Icons.home_outlined,
              label: "Home",
            ),
            // CustomBottomNavigationItem(
            //   icon: Icons.fiber_new_rounded,
            //   label: "Latest",
            // ),
            CustomBottomNavigationItem(
              icon: Icons.video_collection_sharp,
              label: "Channels",
            ),
            CustomBottomNavigationItem(
              icon: Icons.local_fire_department,
              label: "Trending",
            ),
            // CustomBottomNavigationItem(
            //   icon: Icons.video_library_outlined,
            //   label: "My List",
            // ),
          ],
        ),
      );
    });
  }
}

class SliderView extends StatelessWidget {
  SliderView({Key? key, this.onItemClick});
  final Function(String)? onItemClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          CircleAvatar(
            radius: 65,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/icons/logo.png'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            appName,
            style: textStyle16(color:Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          SliderMenuItem(
              title: 'Home', iconData: Icons.home, onTap: onItemClick),
          SliderMenuItem(
              title: 'Privacy Policy',
              iconData: Icons.security,
              onTap: onItemClick),
          SliderMenuItem(
              title: 'Give Rating',
              iconData: Icons.rate_review_outlined,
              onTap: onItemClick),
          SliderMenuItem(
              title: 'More App', iconData: Icons.favorite, onTap: onItemClick),
          SliderMenuItem(
              title: 'About', iconData: Icons.account_box, onTap: onItemClick),
        ],
      ),
    );
  }
}

class SliderMenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function(String)? onTap;

  const SliderMenuItem(
      {Key? key,
      required this.title,
      required this.iconData,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title,
            style: textStyle14(color: Colors.black)),
        leading: Icon(iconData, color: Colors.black),
        onTap: () => onTap?.call(title));
  }
}
