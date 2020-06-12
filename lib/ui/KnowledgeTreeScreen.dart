import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/data/api/apiservice.dart';
import 'package:flutterapp/data/model/knowledge_model.dart';
import 'package:flutterapp/utils/LoadingUtil.dart';

class KnowledgeTreeScreen extends StatefulWidget {
  @override
  _KnowledgeTreeScreenState createState() => _KnowledgeTreeScreenState();
}

class _KnowledgeTreeScreenState extends State<KnowledgeTreeScreen> {
  knowledgeModel _knowledgeMode = knowledgeModel();

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initKnowledgeList();
  }

  @override
  Widget build(BuildContext context) {

    if(_knowledgeMode.data==null) return LoadingUtil.loading();

    return Scaffold(
      body: ListView.builder(
        itemBuilder: itemView,
        itemCount: _knowledgeMode.data.length,
        controller: _scrollController,
      ),
    );
  }

  void initKnowledgeList() async {
    await ApiService().getKnowledgeListData().then((value) {
      var data = json.decode(value.toString());

      print("result==${data}");
      setState(() {
        _knowledgeMode = knowledgeModel.fromJson(data);
      });
    });
  }

  Widget itemView(BuildContext context, int index) {
    Data data = _knowledgeMode.data[index];

    return InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          data.name,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          spacing: 8,
                          runSpacing: 2,
                          children: itemWrapView(data.children),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                  size: 14,
                ),
              )
            ],
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

  itemWrapView(List<Children> children) {


    List<Widget> list = [];
    for (var value in children) {
      list.add(Text(value.name,style: TextStyle(
          fontSize: 12,
          color: Colors.grey
      ),));
    }
    return list;
  }
}
