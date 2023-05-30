import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:sakuralifestoryschool/ui/screens/search.dart';
import 'package:sakuralifestoryschool/ui/widgets/other_widget.dart';

import '../../core/utils/constant.dart';
import 'channel.dart';
import 'home.dart';
import 'trending.dart';

class RootScreen extends StatefulWidget {
  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();

  int _selectedIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    ChannelScreen(),
    TrendingOnScreen(),
  ];

  @override
  Widget build(BuildContext context) {
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
            onItemClick: () {
              _key.currentState!.closeSlider();
            },
          ),
          child: pages[_selectedIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          ;
        },
        backgroundColor: context.theme.scaffoldBackgroundColor,
        selectedItemColor: Colors.pinkAccent,
        selectedLabelStyle: textStyle14(),
        unselectedLabelStyle: textStyle14(),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_collection_sharp), label: 'Channel'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_fire_department), label: 'Trending'),
        ],
      ),

      // CustomBottomNavigationBar(
      //   backgroundColor: context.theme.scaffoldBackgroundColor,
      //   itemColor: Colors.pinkAccent,
      //   currentIndex: controller.currentIndex.value,
      //   onChange: (index) {
      //     controller.changePage(index);
      //   },
      //   children: [
      //     CustomBottomNavigationItem(
      //       icon: Icons.home_outlined,
      //       label: "Home",
      //     ),
      //     // CustomBottomNavigationItem(
      //     //   icon: Icons.fiber_new_rounded,
      //     //   label: "Latest",
      //     // ),
      //     CustomBottomNavigationItem(
      //       icon: Icons.video_collection_sharp,
      //       label: "Channels",
      //     ),
      //     CustomBottomNavigationItem(
      //       icon: Icons.local_fire_department,
      //       label: "Trending",
      //     ),
      //     // CustomBottomNavigationItem(
      //     //   icon: Icons.video_library_outlined,
      //     //   label: "My List",
      //     // ),
      //   ],
      // ),
    );
  }
}

class SliderView extends StatelessWidget {
  SliderView({Key? key, this.onItemClick});
  final Function()? onItemClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 65,
            backgroundColor: Colors.white70,
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
            style: textStyle16(color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          SliderMenuItem(
              title: 'Home', iconData: Icons.home, onClick: onItemClick),
          SliderMenuItem(
              title: 'Privacy Policy',
              iconData: Icons.security,
              onClick: () =>
                  getToLaunch('https://hayogo.my.id/privacy_policy.html')),
          SliderMenuItem(
              title: 'Share App',
              iconData: Icons.rate_review_outlined,
              onClick: () => shareTo(
                  'Hi, download this awesome app Sakura School Story for free. Download now on Play Store https://play.google.com/store/apps/details?id=com.sakuraschoolgames.sakuralifestoryschool')),
          SliderMenuItem(
              title: 'Give Rating',
              iconData: Icons.rate_review_outlined,
              onClick: () => rateUsNow),
          SliderMenuItem(
              title: 'More App',
              iconData: Icons.favorite,
              onClick: () => getToLaunch(
                  'https://play.google.com/store/apps/developer?id=HaYoGo')),
          SliderMenuItem(
              title: 'About', iconData: Icons.account_box, onClick: () {}),
        ],
      ),
    );
  }
}

class SliderMenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function()? onClick;

  const SliderMenuItem(
      {Key? key,
      required this.title,
      required this.iconData,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title, style: textStyle14(color: Colors.white)),
        leading: Icon(iconData, color: Colors.white),
        onTap: onClick);
  }
}
