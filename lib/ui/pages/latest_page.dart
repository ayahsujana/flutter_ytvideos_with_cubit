// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sakuralifestoryschool/core/models/home_model.dart';
import 'package:sakuralifestoryschool/ui/screens/detail.dart';
import 'package:sakuralifestoryschool/ui/widgets/image_widget.dart';

import '../widgets/other_widget.dart';

class LatestVideosPage extends StatelessWidget {
  const LatestVideosPage({
    Key? key,
    required this.titleBanner,
    required this.itemList,
  }) : super(key: key);
  final String titleBanner;
  final List<ItemVideos> itemList;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5, top: 25),
          child: Row(
            children: [
              Container(
                height: 28,
                width: 128,
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
          child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                ItemVideos items = itemList[index];
                return InkWell(
                  onTap: () {
                    Get.to(DetailScreen(), arguments: items.ids);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: [
                        imgStandard(items.ids),
                        Expanded(
                            child: SizedBox(
                          height: 105,
                          width: double.infinity,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  items.title,
                                  maxLines: 3,
                                  textAlign: TextAlign.start,
                                  style: textStyle12(),
                                ),
                                Spacer(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
        
                                  children: [
                                    Icon(Icons.person, size: 18,),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(items.channelTitle,
                                        style: textStyle12(color: Colors.amberAccent))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
