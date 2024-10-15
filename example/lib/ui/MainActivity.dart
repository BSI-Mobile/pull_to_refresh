/*
 * Author: Jpeng
 * Email: peng8350@gmail.com
 * Time: 2019/5/3 下午6:13
 */

import 'package:flutter/material.dart';
import 'example/ExamplePage.dart';
import 'test/TestPage.dart';
import 'indicator/IndicatorPage.dart';

class MainActivity extends StatefulWidget {
  final String title;

  MainActivity({this.title = ''});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainActivityState();
  }
}

class _MainActivityState extends State<MainActivity>
    with TickerProviderStateMixin {
  late List<Widget> views;
  late TabController _tabController;
  int _tabIndex = 1;
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _pageController = PageController(initialPage: 1);
    views = [
      IndicatorPage(title: "指示器界面"),
      ExamplePage(),
      TestPage(title: "测试界面"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(_tabIndex == 0
            ? "指示器界面"
            : _tabIndex == 1
                ? "例子界面"
                : _tabIndex == 2
                    ? "测试界面"
                    : _tabIndex == 3
                        ? "样例界面"
                        : "App界面"),
        leading: GestureDetector(
          child: Icon(Icons.menu),
          onTap: () {},
        ),
        backgroundColor: Colors.greenAccent,
        bottom: _tabIndex == 3
            ? TabBar(
                isScrollable: true,
                tabs: [
                  Tab(child: Text("超大数据量性能测试")),
                  Tab(child: Text("SliverAppbar+Sliverheader")),
                  Tab(child: Text("嵌套滚动视图")),
                  Tab(child: Text("动态变化指示器+Navigator")),
                  Tab(child: Text("主动刷新")),
                  Tab(child: Text("四个方向不同风格测试绘制")),
                ],
                controller: _tabController,
              )
            : null,
      ),
      body: PageView(
        controller: _pageController,
        children: views,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
