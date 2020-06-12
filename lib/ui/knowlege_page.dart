import 'package:flutter/material.dart';
import 'package:flutterapp/ui/KnowledgeTreeScreen.dart';
import 'package:flutterapp/ui/NavigationScreen.dart';

class KnowlegePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _KnowlegePage();
  }
}

class _KnowlegePage extends State<KnowlegePage> with TickerProviderStateMixin{

  TabController _tabController ;
  List<Tab> tabs = [
    Tab(
      text: '体系',
    ),
    Tab(
      text: '导航',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    _tabController = new TabController(length: tabs.length, vsync: this);
    return Scaffold(
      body: Column(
        children: <Widget>[
           Container(
             color:Colors.red,
             child:TabBar(
               indicatorColor: Colors.white,
               tabs:tabs,
               controller: _tabController,
             )
           ),
          Expanded(

            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                KnowledgeTreeScreen(),NavigationScreen()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
