import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sakuralifestoryschool/core/cubit/home/home_cubit.dart';
import 'package:sakuralifestoryschool/ui/pages/carousel_page.dart';
import 'package:sakuralifestoryschool/ui/pages/latest_page.dart';
import 'package:sakuralifestoryschool/ui/pages/most_page.dart';
import 'package:sakuralifestoryschool/ui/widgets/error_widget.dart';

import '../widgets/no_network_widget.dart';
import '../widgets/other_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        if (state is HomeLoading) {
          return loadingSpinkit();
        }
        if (state is HomeError) {
          return EmptyFailureNoInternetView(
            image: 'assets/lottie/empty_lottie.json',
            title: 'Content unavailable',
            description: 'Please check your API!',
            buttonText: "Retry",
            onPressed: () => context.read<HomeCubit>().getHomeVideos(),
          );
        }
        if (state is HomeLoaded) {
          return ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: state.home.data.length,
              itemBuilder: (context, index) {
                return ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CarouselPage(
                          titleBanner: '',
                          itemVideos: state.home.data[index].banner),
                    ),
                    LatestVideosPage(
                        titleBanner: 'Latest Story',
                        itemList: state.home.data[index].latest),
                    MostVideosPage(
                        titleBanner: 'Suggested for you',
                        itemList: state.home.data[index].most)
                  ],
                );
              });
        }
        return ErrorMessage(
            onPress: () => context.read<HomeCubit>().getHomeVideos(),
            messageTitle: 'No Network',
            messageDescription: 'Please check your Connection!');
      }),
    );
  }
}
