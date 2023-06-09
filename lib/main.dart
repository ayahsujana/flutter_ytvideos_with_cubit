import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sakuralifestoryschool/core/cubit/channel/channel_cubit.dart';
import 'package:sakuralifestoryschool/core/cubit/detail/detail_cubit.dart';
import 'package:sakuralifestoryschool/core/cubit/feed/feed_cubit.dart';
import 'package:sakuralifestoryschool/core/cubit/home/home_cubit.dart';
import 'package:sakuralifestoryschool/core/cubit/videos_channel/videos_channel_cubit.dart';
import 'package:sakuralifestoryschool/core/services/remote_services.dart';
import 'package:sakuralifestoryschool/core/utils/constant.dart';
import 'package:sakuralifestoryschool/ui/screens/splash.dart';
import 'package:sakuralifestoryschool/ui/widgets/nav_bar_bottom_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => HomeCubit(ApiServices()))),
        BlocProvider(create: ((context) => FeedCubit(ApiServices()))),
        BlocProvider(create: ((context) => ChannelCubit(ApiServices()))),
        BlocProvider(create: ((context) => VideosChannelCubit())),
        BlocProvider(create: ((context) => DetailCubit())),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: appName,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: PRIMARY_COLOR,
          scaffoldBackgroundColor: PRIMARY_COLOR,
          primarySwatch: Colors.blue
        ),
        home: SplashScreen(),
      ),
    );
  }
}