import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/data/api/apiservice.dart';
import 'package:flutterapp/data/model/WxSubListBean.dart';
import 'package:flutterapp/utils/LoadingUtil.dart';

class WxArticleScreen extends StatefulWidget {
  @override
  _WxArticleScreenState createState() => _WxArticleScreenState();

  int id;

  WxArticleScreen(this.id);
}

class _WxArticleScreenState extends State<WxArticleScreen> {
  WxSubListBean _wxSubListBean = WxSubListBean();

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("--------id=${widget.id}");
    getWxArticleListData();
  }

  getWxArticleListData() async {
    ApiService().getWxSubListData(widget.id).then((value) {
      var result = json.decode(value.toString());
      setState(() {
        _wxSubListBean = WxSubListBean.fromJson(result);
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    if(_wxSubListBean.data==null) return LoadingUtil.loading();
    return Scaffold(
      body: ListView.builder(
        itemBuilder: itemView,
        itemCount: _wxSubListBean.data.datas.length,
        controller: _scrollController,
      ),
    );
  }

  Widget itemView(BuildContext context, int index) {
    var wxArticleBean = _wxSubListBean.data.datas[index];

    return InkWell(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  wxArticleBean.author.isEmpty
                      ? wxArticleBean.shareUser
                      : wxArticleBean.author,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                )),
                Container(
                  child: Text(
                    wxArticleBean.niceShareDate,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Text(wxArticleBean.title),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Row(
              children: <Widget>[
                Text(
                  wxArticleBean.superChapterName +
                      "/" +
                      wxArticleBean.chapterName,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Expanded(
                    child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    wxArticleBean.collect
                        ? Icons.favorite
                        : Icons.favorite_border,
                    size: 14,
                    color: Colors.grey,
                  ),
                ))
              ],
            ),
          ),
          Divider(
            height: 0.5,
          )
        ],
      ),
    );
  }
}
