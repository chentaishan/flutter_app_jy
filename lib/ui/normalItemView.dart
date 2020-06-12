import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/data/model/article_model.dart';
import 'package:flutterapp/ui/WebViewPage.dart';

class normalItemView extends StatefulWidget {
  ArticleBean articleBean;

  normalItemView(this.articleBean);

  @override
  _normalItemViewState createState() => _normalItemViewState();
}

class _normalItemViewState extends State<normalItemView> {
  @override
  Widget build(BuildContext context) {
    var articleBean = widget.articleBean;

    return InkWell(
      onTap: () {

      //导航到新路由
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        // 创建对象，且赋值
        return WebViewPage( articleBean.link);
      }));



      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              children: <Widget>[
                Text(articleBean.author,
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                Expanded(
                  child: Text(articleBean.niceShareDate,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                      textAlign: TextAlign.right),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Text(articleBean.title,
                style: TextStyle(color: Colors.grey, fontSize: 12)),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              children: <Widget>[
                Text(
                  articleBean.superChapterName,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      articleBean.collect
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.grey,
                      size: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Divider(
              height: 0.5,
            ),
          )
        ],
      ),
    );
  }
}
