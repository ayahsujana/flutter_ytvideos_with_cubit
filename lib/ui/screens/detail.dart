import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sakuralifestoryschool/ui/widgets/screen_widget.dart';

import '../../core/cubit/detail/detail_cubit.dart';
import '../pages/detail_page.dart';
import '../widgets/other_widget.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DetailCubit>().explodeLink(Get.arguments);
    Screen.setPortrait();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: SafeArea(child: BlocBuilder<DetailCubit, DetailState>(
          builder: (context, state) {
            if (state is DetailLoading) {
              return loadingSpinkit();
            }
            if (state is DetailError) {
              return Center(
                child: Text(state.message),
              );
            }
            if (state is DetailLoaded) {
              return DetailPage(
                video: state.video,
              );
            }
            return Center(
              child: Text('Please check your Video ID'),
            );
          }),
        ),
      ),
    );
  }
}
