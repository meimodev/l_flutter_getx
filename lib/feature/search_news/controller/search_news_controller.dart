import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/core/model/article.dart';
import 'package:getx_news_app/core/repository/news_repo.dart';
import 'package:getx_news_app/core/repository/news_repo_impl.dart';

class SearchNewsController extends GetxController {
  late NewsRepo _newsRepo;

  SearchNewsController() {
    _newsRepo = Get.find<NewsRepoImpl>();

    searchTextController.addListener(() {
      if (searchTextController.text.length > 3) {
        searchNewsHeadLine();
      }
    });
  }

  final searchTextController = TextEditingController();
  RxBool isLoading = false.obs;
  late RxList<Article> article = RxList();

  searchNewsHeadLine() async {
    showLoading();
    final result = await _newsRepo.getSearchedNews(searchTextController.text);
    article = result.obs;
    hideLoading();
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
