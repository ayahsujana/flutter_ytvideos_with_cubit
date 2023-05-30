import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:sakuralifestoryschool/ui/widgets/other_widget.dart';
import 'package:youtube_data_api/models/video.dart';
import 'package:youtube_data_api/youtube_data_api.dart';
import '../screens/detail.dart';
import '../widgets/image_widget.dart';
import '../widgets/suggestion_widget.dart';

class SearchPage extends StatefulWidget {
  final String query;

  SearchPage(this.query);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  YoutubeDataApi youtubeDataApi = YoutubeDataApi();
  List? contentList;
  bool isLoading = false;
  bool firstLoad = true;
  String API_KEY = "AIzaSyCLLLyifMf-xaDD6P9bBIF5hO2HK3nZw7k";

  @override
  void initState() {
    contentList = [];
    _loadMore(widget.query);
    SuggestionHistory.init();
    SuggestionHistory.store(widget.query);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return SafeArea(
      child: Stack(
        children: [
          Visibility(
            visible: firstLoad,
            child: loadingSpinkit(),
          ),
          LazyLoadScrollView(
            isLoading: isLoading,
            onEndOfPage: () => _loadMore(widget.query),
            child: ListView.builder(
              itemCount: contentList!.length,
              itemBuilder: (context, index) {
                if (isLoading && index == contentList!.length - 1) {
                  return loadingSpinkit();
                } else {
                  if (contentList![index] is Video) {
                    return video(contentList![index]);
                  }
                  return SizedBox();
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget video(Video video) {
    return InkWell(
      onTap: () async {
        Get.to(DetailScreen(), arguments: video.videoId);
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                imgTrending(video.thumbnails![0].url!),
                Positioned(
                  bottom: 4.0,
                  right: 4.0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: (video.duration == "Live")
                            ? Colors.red.withOpacity(0.88)
                            : Colors.black54,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      video.duration ?? '',
                      style: textStyle11(),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                video.title ?? '',
                textAlign: TextAlign.center,
                style: textStyle14(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ), //video title
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    video.channelName ?? '',
                    textAlign: TextAlign.right,
                    style: textStyle11(color: Colors.amberAccent),
                  ),
                  const Text(' '),
                  const Center(
                      child: Icon(
                    Icons.do_not_disturb_on,
                    size: 10,
                    color: Colors.white38,
                  )),
                  const Text(' '),
                  Text(
                    video.views ?? '',
                    style: textStyle12(color: Colors.greenAccent),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _loadMore(String query) async {
    setState(() {
      isLoading = true;
    });
    List newList = await youtubeDataApi.fetchSearchVideo(query, API_KEY);
    contentList!.addAll(newList);
    setState(() {
      isLoading = false;
      firstLoad = false;
    });
  }
}
