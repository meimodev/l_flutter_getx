import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/core/model/article.dart';
import 'package:getx_news_app/core/repository/news_repo.dart';
import 'package:getx_news_app/core/repository/news_repo_impl.dart';

class NewsHeadlineController extends GetxController {
  late NewsRepo _newsRepo;

  NewsHeadlineController() {
    _newsRepo = Get.find<NewsRepoImpl>();
    loadNewsLine();
  }

  RxBool isLoading = false.obs;
  late RxList<Article> article;

  loadNewsLine() async {
    showLoading();
    final result = await _newsRepo.getNewsHeadline();
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
