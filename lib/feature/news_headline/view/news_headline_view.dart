import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/core/widget/drawer.dart';
import 'package:getx_news_app/feature/news_headline/controller/news_headline_controller.dart';

class NewsHeadLineView extends StatelessWidget {
  final controller = Get.find<NewsHeadlineController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Headline'),
      ),
      drawer: getAppDrawer(),
      body: Obx(() => controller.isLoading.isTrue
          ? Center(child: CircularProgressIndicator())
          : Container(
              margin: EdgeInsets.all(12),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    var imageUrl = controller.article[index].imageUrl;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        imageUrl == null
                            ? Icon(Icons.cloud_off)
                            : Image.network(imageUrl),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          controller.article[index].title,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          controller.article[index].title,
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                        height: 16,
                        color: Colors.red,
                      ),
                  itemCount: controller.article.length),
            )),
    );
  }
}
