import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sakuralifestoryschool/core/cubit/videos_channel/videos_channel_cubit.dart';
import 'package:sakuralifestoryschool/ui/pages/video_channel_page.dart';
import 'package:sakuralifestoryschool/ui/widgets/other_widget.dart';

import '../../core/models/video_channel.dart';
import '../widgets/no_network_widget.dart';

class ChannelVideosScreen extends StatefulWidget {
  const ChannelVideosScreen({super.key});

  @override
  State<ChannelVideosScreen> createState() => _ChannelVideosScreenState();
}

class _ChannelVideosScreenState extends State<ChannelVideosScreen> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    context
        .read<VideosChannelCubit>()
        .loadMoreVideos(Get.arguments['channelId']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: textStyle18(),
        centerTitle: true,
        title: Text(Get.arguments['nameChannel']),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: BlocBuilder<VideosChannelCubit, VideosChannelState>(
          builder: (context, state) {
            if (state is VideosChannelLoading) {
              return loadingSpinkit();
            } else if (state is VideosChannelLoaded) {
              return _buildNewBody(
                  state.datum, context, Get.arguments['channelId']);
            } else if (state is VideosChannelLoadingMore) {
              return _buildNewBody(
                  state.datum, context, Get.arguments['channelId']);
            } else if (state is VideosChannelError) {
              return EmptyFailureNoInternetView(
                image: 'assets/lottie/empty_lottie.json',
                title: 'Content unavailable',
                description: 'Please check your API!',
                buttonText: "Retry",
                onPressed: () => context
                    .read<VideosChannelCubit>()
                    .loadMoreVideos(Get.arguments['channelId']),
              );
            }
            throw UnimplementedError();
          },
        ),
      ),
    );
  }
}

Widget _buildNewBody(
  List<VideosChannelModelDatum> datum,
  BuildContext context,
  String channelId, {
  bool isLoadingMore = true,
}) {
  return ListView.builder(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: datum.length,
      itemBuilder: (context, index) {
        final cubit = BlocProvider.of<VideosChannelCubit>(context);
        final items = ChannelVideosPage(vChannel: datum[index]);
        final isLastItems = datum.length == index + 1;

        if (isLastItems && cubit.canLoadMore && !isLoadingMore) {
          cubit.loadMoreVideos(channelId);
        }

        if (isLastItems && cubit.canLoadMore && isLoadingMore) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              items,
              loadingSpinkit(),
            ],
          );
        } else {
          return items;
        }
      });
}
