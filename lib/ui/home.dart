import 'package:flutter/material.dart';
import 'all_news.dart';
import 'breaking_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "World News",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 25,
            ),
          ),
          centerTitle: true,

          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.white,

            tabs: [
              Tab(text: "Breaking News"),
              Tab(text: "All News"),
            ],
          ),
          backgroundColor: Colors.blue,
        ),
        body: TabBarView(children: [BreakingNews(), AllNews()]),
      ),
    );
  }
}
