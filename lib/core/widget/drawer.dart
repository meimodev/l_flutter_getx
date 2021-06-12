import 'package:flutter/material.dart';
import 'package:get/get.dart';

getAppDrawer() {
  return Drawer(
    child: ListView(
      children: [
        ListTile(
          title: Text("News Headline"),
          onTap: () {
            Get.offAndToNamed("/news_headline");
          },
          leading: Icon(Icons.contact_page),
        ),
        ListTile(
          title: Text("Search News"),
          onTap: () {
            Get.offAndToNamed("/search_news");
          },
          leading: Icon(Icons.search),
        ),
      ],
    ),
  );
}
