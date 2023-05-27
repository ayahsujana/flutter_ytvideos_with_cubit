// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sakuralifestoryschool/core/models/home_model.dart';

import '../screens/detail.dart';
import '../widgets/image_widget.dart';
import '../widgets/other_widget.dart';

class MostVideosPage extends StatelessWidget {
  const MostVideosPage({
    Key? key,
    required this.titleBanner,
    required this.itemList,
  }) : super(key: key);
  final String titleBanner;
  final List<ItemVideos> itemList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: ListView(
        children: [
           Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 18),
        child: Row(
          children: [
            Container(
              height: 28,
              width: 175,
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8))
              ),
              child: Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Text(
                  titleBanner,
                  style: textStyle18(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: itemList.length,
                  itemBuilder: (context, index) {
                    ItemVideos items = itemList[index];
                    return InkWell(
                      onTap: () {
                        Get.to(DetailScreen(), arguments: items.ids);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right:5.0),
                        child: Column(
                          children: [
                            imgStandard(items.ids),
                            SizedBox(
                              width: 190,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  items.title,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyle12(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
