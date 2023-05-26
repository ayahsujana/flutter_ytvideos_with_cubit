import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sakuralifestoryschool/core/cubit/channel/channel_cubit.dart';
import 'package:sakuralifestoryschool/ui/pages/channel_page.dart';

import '../widgets/error_widget.dart';
import '../widgets/no_network_widget.dart';
import '../widgets/other_widget.dart';

class ChannelScreen extends StatefulWidget {
  const ChannelScreen({super.key});

  @override
  State<ChannelScreen> createState() => _ChannelScreenState();
}

class _ChannelScreenState extends State<ChannelScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ChannelCubit>().getChannels();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: BlocBuilder<ChannelCubit, ChannelState>(
        builder: (context, state) {
          if (state is ChannelLoading) {
            return loadingSpinkit();
          }
          if (state is ChannelError) {
            return EmptyFailureNoInternetView(
              image: 'lottie/empty_lottie.json',
              title: 'Content unavailable',
              description: 'Please check your API!',
              buttonText: "Retry",
              onPressed: () => context.read<ChannelCubit>().getChannels(),
            );
          }
          if (state is ChannelLoaded) {
            return ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
                itemCount: state.channel.data.length,
                itemBuilder: (context, index) {
                  return ChannelPage(channel: state.channel.data[index]);
                });
          }
          return ErrorMessage(
              onPress: () => context.read<ChannelCubit>().getChannels(),
              messageTitle: 'No Network',
              messageDescription: 'Please check your Connection!');
        },
      ),
    );
  }
}
