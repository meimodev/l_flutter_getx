import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/core/model/article.dart';
import 'package:getx_news_app/core/model/news_response.dart';
import 'package:getx_news_app/service/http_service.dart';
import 'package:getx_news_app/service/http_service_impl.dart';

import 'news_repo.dart';

class NewsRepoImpl implements NewsRepo {
  late HttpService _httpService;

  NewsRepoImpl() {
    _httpService = Get.put(HttpServiceImpl());
    // _httpService.init();
  }

  @override
  Future<List<Article>> getNewsHeadline() async {
    print('getNewsHeadline() called');
    try {
      final response =
          await _httpService.getRequest('/v2/top-headlines?country=id');

      final parsedResponse = NewsResponse.fromJson(response.data);

      return parsedResponse.articles;
    } on Exception catch (e) {
      throw e;
    }
  }

  @override
  Future<List<Article>> getSearchedNews(String query) async {
    try {
      final response = await _httpService.getRequest('/v2/everything?q=$query');

      final parsedResponse = NewsResponse.fromJson(response.data);
      return parsedResponse.articles;
    } on Exception catch (e) {
      throw e;
    }
  }
}
