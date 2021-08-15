import 'package:flutter/material.dart';

import 'package:movie_app/ui/now_playing.dart';
import 'package:movie_app/ui/popular.dart';
import 'package:movie_app/ui/top_rated.dart';
import 'package:movie_app/ui/upcoming.dart';

class TabHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.calendar_today_rounded)),
                Tab(icon: Icon(Icons.star)),
                Tab(icon: Icon(Icons.fireplace)),
                Tab(icon: Icon(Icons.autorenew_outlined))
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          backgroundColor: Colors.black,
          body: TabBarView(
            children: [
              HomeList(),
              TopRatedList(),
              PopularList(),
              UpcomingList(),

            ],
          ),
        ),
      ),
    );
  }
}