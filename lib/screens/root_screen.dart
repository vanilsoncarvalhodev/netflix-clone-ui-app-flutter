import 'package:flutter/material.dart';
import 'package:netflixui/json/root_app_json.dart';
import 'package:netflixui/screens/download_screen.dart';
import 'package:netflixui/screens/em_breve_screen.dart';
import 'package:netflixui/screens/home_screen.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: getBody(),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        HomeScreen(),
        EmBreveScreen(),
        DownloadScreen(),
      ],
    );
  }

  Widget getBottomNavigationBar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.09)),
      child: Padding(
        padding: const EdgeInsets.only(left:50, right: 50, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = index;
                });
              },
              child: Column(
                children: [
                  Icon(
                    activeTab == index ? items[index]['iconActive'] : items[index]['icon'],
                    color: activeTab == index ?  Colors.white : Colors.white.withOpacity(0.5),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    items[index]['titulo'],
                    style: TextStyle(
                      color: activeTab == index ?  Colors.white : Colors.white.withOpacity(0.5),
                      fontSize: 10
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}