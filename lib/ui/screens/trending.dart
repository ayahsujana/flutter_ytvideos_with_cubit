import 'package:flutter/material.dart';
import 'package:sakuralifestoryschool/ui/pages/trending_page.dart';
import 'package:youtube_data_api/models/video.dart';
import 'package:youtube_data_api/youtube_data_api.dart';

import '../widgets/other_widget.dart';

class TrendingOnScreen extends StatefulWidget {
  const TrendingOnScreen({super.key});

  @override
  State<TrendingOnScreen> createState() => _TrendingOnScreenState();
}

class _TrendingOnScreenState extends State<TrendingOnScreen>
    with TickerProviderStateMixin {
  YoutubeDataApi youtubeDataApi = YoutubeDataApi();
  TabController? _controller;
  List<Video>? video;
  late Future trending;
  int trendingIndex = 0;
  late double progressPosition;

  @override
  void initState() {
    super.initState();
    trending = youtubeDataApi.fetchTrendingVideo();
    _controller = TabController(length: 4, vsync: this);
    video = [];
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    progressPosition = MediaQuery.of(context).size.height / 0.5;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            flexibleSpace: TabBar(
                onTap: changeTrendingState,
                controller: _controller,
                indicatorColor: Colors.pinkAccent,
                tabs: [
                  Tab(
                    text: 'Trending',
                  ),
                  Tab(
                    text: 'Music',
                  ),
                  Tab(
                    text: 'Gaming',
                  ),
                  Tab(
                    text: 'Movies',
                  ),
                ]),
          ),
          body: RefreshIndicator(
            onRefresh: _refresh,
            child: SingleChildScrollView(
              child: FutureBuilder(
                future: trending,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Padding(
                          padding: EdgeInsets.only(top: 222),
                          child: loadingSpinkit());
                    case ConnectionState.active:
                      return Padding(
                          padding: EdgeInsets.only(top: 222),
                          child: loadingSpinkit());
                    case ConnectionState.none:
                      return const Text("Connection None");
                    case ConnectionState.done:
                      if (snapshot.error != null) {
                        return Container(
                            child: Text(snapshot.stackTrace.toString()));
                      } else {
                        if (snapshot.hasData) {
                          video = snapshot.data;
                          return TrendingPage(video: video!);
                        } else {
                          return Center(
                              child: Container(child: Text("No data")));
                        }
                      }
                  }
                },
              ),
            ),
          )
          //buildBodyTabBar(trendingIndex),
          ),
    );
  }

  buildBodyTabBar(int index) {
    switch (index) {
      case 0:
        return Center(
          child: Text('Trending'),
        );
      case 1:
        return Center(
          child: Text('Music'),
        );
      case 2:
        return Center(
          child: Text('Gaming'),
        );
      case 3:
        return Center(
          child: Text('Movies'),
        );
      default:
        return Center(
          child: Text('Trending'),
        );
    }
  }

  Future<bool> _refresh() async {
    List<Video> newVideo = await youtubeDataApi.fetchTrendingVideo();
    if (newVideo.isNotEmpty) {
      setState(() {
        video = newVideo;
      });
      return true;
    }
    return false;
  }

  void changeTrendingState(int index) {
    switch (index) {
      case 0:
        setState(() {
          trending = youtubeDataApi.fetchTrendingVideo();
        });
        break;
      case 1:
        setState(() {
          trending = youtubeDataApi.fetchTrendingMusic();
        });
        break;
      case 2:
        setState(() {
          trending = youtubeDataApi.fetchTrendingGaming();
        });
        break;
      case 3:
        setState(() {
          trending = youtubeDataApi.fetchTrendingMovies();
        });
        break;
    }
    trendingIndex = index;
  }
}
