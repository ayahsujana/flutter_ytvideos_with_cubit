import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sakuralifestoryschool/core/cubit/feed/feed_cubit.dart';

import '../pages/feeds_page.dart';
import '../widgets/error_widget.dart';
import '../widgets/no_network_widget.dart';
import '../widgets/other_widget.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FeedCubit>().getFeedsVideos();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: BlocBuilder<FeedCubit, FeedState>(
        builder: (context, state) {
          if (state is FeedLoading) {
            return loadingSpinkit();
          }
          if (state is FeedError) {
            return EmptyFailureNoInternetView(
              image: 'assets/lottie/empty_lottie.json',
              title: 'Content unavailable',
              description: 'Please check your API!',
              buttonText: "Retry",
              onPressed: () => context.read<FeedCubit>().getFeedsVideos(),
            );
          }
          if (state is FeedLoaded) {
            return ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: state.feed.data.length,
                itemBuilder: (context, index) {
                  return FeedsPage(feeds: state.feed.data[index]);
                });
          }
          return ErrorMessage(
              onPress: () => context.read<FeedCubit>().getFeedsVideos(),
              messageTitle: 'No Network',
              messageDescription: 'Please check your Connection!');
        },
      ),
    );
  }
}
