import 'package:dio/dio.dart';
import 'package:flutterapp/data/api/apis.dart';

class ApiService {
  Dio dio = new Dio();

  ///获取轮播网络数据
  getSwipersData() async {
    try {
      Response response = await dio.get(Apis.HOME_BANNER);
      var statusCode = response.statusCode;
      if (statusCode == 200) {
        return response;
      } else {
        throw Exception('网络网络异常');
      }
    } catch (e) {
      print(e);
    }
  }

  getSquareData(int _page) async {
    try {
      Response response = await dio.get(Apis.SQUARE_LIST + "/$_page/json");
      int code = response.statusCode;
      if (code == 200) {
        return response;
      } else {
        throw Exception('网络异常');
      }
    } catch (e) {
      print(e);
    }
  }

  ///获取首页列表数据,future
  getHomeArticleListDdata(int _page) async {
    try {
      Response response =
          await dio.get(Apis.HOME_ARTICLE_LIST + "/$_page/json");
      var statusCode = response.statusCode;
      if (statusCode == 200) {
        return response;
      } else {
        throw Exception('网络异常：' + response.statusMessage);
      }
    } catch (e) {
      print(e);
    }
  }

  getKnowledgeListData() async {
    try {
      Response response = await dio.get(Apis.KNOWLEDGE_LIST);

      var code = response.statusCode;
      if (code == 200) {
        return response;
      } else {
        throw Exception('网络异常');
      }
    } catch (e) {
      print(e);
    }
  }

  getNavigationData() async {
    try {
      Response response = await dio.get(Apis.NAVIGATION_LIST);

      var code = response.statusCode;

      if (code == 200) {
        return response;
      } else {
        throw Exception("网络异常");
      }
    } catch (e) {
      print(e);
    }
  }

  getWXTabList() async {
    try {
      Response response = await dio.get(Apis.WX_TAB_LIST);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception("网络异常");
      }
    } catch (e) {
      print(e);
    }
  }

  /**
   * 获取每个分支下的内容列表
   */
  getWxSubListData(int _id) async {
    try {
//      https://wanandroid.com/wxarticle/list/409/1/json
      Response response = await dio.get(Apis.TAB_LIST + "/$_id/1/json");
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception("异常");
      }
    } catch (e) {
      print(e);
    }
  }
}
