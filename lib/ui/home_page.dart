import 'dart:convert';
import 'dart:io';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/data/api/apiservice.dart';
import 'package:flutterapp/data/model/article_model.dart';
import 'package:flutterapp/data/model/banner_model.dart';
import 'package:flutterapp/ui/normalItemView.dart';
import 'package:flutterapp/utils/LoadingUtil.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  ScrollController _scrollController = ScrollController();

  BannerModel _bannerModel = BannerModel();
  ArticleModel _articleModel = ArticleModel();

  int _page=0;
  @override
  void initState() {
    super.initState();
    getSwiperData();
    getHomeListData();

  }
  void getHomeListData() async {
    await ApiService().getHomeArticleListDdata(_page).then((value) {
      //解码得到数据
      var data = json.decode(value.toString());
      setState(() {
        _articleModel = ArticleModel.fromJson(data);
      });
    });
  }
  void getSwiperData() async {
    await ApiService().getSwipersData().then((value) {
      //解码得到数据
      var data = json.decode(value.toString());
      setState(() {
        _bannerModel = BannerModel.fromJson(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    if(_articleModel.data==null) return LoadingUtil.loading();

    return Scaffold(
      body: ListView.builder(
        itemBuilder: itemView,
        itemCount: _articleModel.data.datas.length+1,
        controller: _scrollController,
      ),
    );
  }

  Widget itemView(BuildContext context, int index) {
    if (index == 0) {
      return Container(
        child: Container(
          height: 180,
          child: Swiper(
            autoplay: true,
            itemCount: _bannerModel.data.length,
            pagination: SwiperPagination(),
            itemBuilder: (BuildContext context, int index) {
              return Image.network(
                _bannerModel.data[index].imagePath,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      );
    } else {
      ArticleBean articleBean = _articleModel.data.datas[index - 1];
     return normalItemView(articleBean);
    }
  }



}
