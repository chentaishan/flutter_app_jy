///接口类
class Apis {
  static const String BASE_HOST = "https://www.wanandroid.com";

  /// 首页轮播
  static const String HOME_BANNER = BASE_HOST + "/banner/json";
  /// 首页列表
  static const String HOME_ARTICLE_LIST = BASE_HOST + "/article/list";


  static const String SQUARE_LIST = BASE_HOST + "/user_article/list";

  //知识体系
  static const String KNOWLEDGE_LIST = BASE_HOST + "/tree/json";

  /// 导航数据列表
  static const String NAVIGATION_LIST = BASE_HOST + "/navi/json";

//  https://wanandroid.com/wxarticle/chapters/json

  static const String WX_TAB_LIST = BASE_HOST + "/wxarticle/chapters/json";

//  https://wanandroid.com/wxarticle/list/409/1/json
  static const String TAB_LIST = BASE_HOST + "/wxarticle/list";


}
