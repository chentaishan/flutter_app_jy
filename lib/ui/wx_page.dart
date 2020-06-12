import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutterapp/data/api/apiservice.dart';
import 'package:flutterapp/data/model/WxTabBean.dart';
import 'package:flutterapp/ui/WxArticleScreen.dart';
import 'package:flutterapp/utils/LoadingUtil.dart';

class WxPage extends StatefulWidget {
  List<Tab> tabs = [];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WxPage();
  }
}

class _WxPage extends State<WxPage> with TickerProviderStateMixin{
  WxTabBean _wxTabBean = WxTabBean();

  TabController _tabController  ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

     ApiService().getWXTabList().then((value) {
      var result = json.decode(value.toString());
      setState(() {
        _wxTabBean = WxTabBean.fromJson(result);


      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _tabController =
    new TabController(length: _wxTabBean.data.length, vsync: this);

    if(_wxTabBean.data==null) return LoadingUtil.loading();

    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.red,
              height: 55,
              child: TabBar(
                tabs: _wxTabBean.data.map((data) {
                  return Tab(
                    text: data.name,
                  );
                }).toList(),
                isScrollable: true,
                controller: _tabController,
              ),
            ),
            Expanded(
                child: Container(
                  child: TabBarView(
                    controller: _tabController,
                    children:
                    _wxTabBean.data.map((wXChaptersBean) {
                      return WxArticleScreen(wXChaptersBean.id);
                    }).toList(),
                  ),
                )


            )
          ],
        ),
      ),
    );
  }
}
