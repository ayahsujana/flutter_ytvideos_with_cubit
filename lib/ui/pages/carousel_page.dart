// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sakuralifestoryschool/core/models/home_model.dart';
import 'package:sakuralifestoryschool/ui/widgets/image_widget.dart';

import '../screens/detail.dart';

class CarouselPage extends StatelessWidget {
  const CarouselPage({
    Key? key,
    required this.titleBanner,
    required this.itemVideos,
  }) : super(key: key);
  final String titleBanner;
  final List<ItemVideos> itemVideos;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: itemVideos
            .map(
              (e) => InkWell(
                onTap: () => Get.to(DetailScreen(), arguments: e.ids),
                child: imgForCarousel(e.ids),
              ),
            )
            .toList(),
        options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            viewportFraction: 1.0,
            enlargeCenterPage: true,
            aspectRatio: 2.0));
  }
}
