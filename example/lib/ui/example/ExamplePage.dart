/*
 * Author: Jpeng
 * Email: peng8350@gmail.com
 * Time:  2019-06-24 17:21
 */
import 'package:example/ui/example/customindicator/footer_underscroll.dart';
import 'package:example/ui/example/customindicator/shimmer_indicator.dart';
import 'package:example/ui/example/useStage/force_full_one_page.dart';
import 'package:flutter/material.dart';
import 'package:example/ui/example/useStage/empty_view.dart';
import 'package:example/ui/example/useStage/hidefooter_bycontent.dart';
import 'package:example/ui/example/useStage/horizontal+reverse.dart';
import 'package:example/ui/example/useStage/Nested.dart';
import 'package:example/ui/example/useStage/basic.dart';
import 'package:example/ui/example/customindicator/link_header_example.dart';
import 'package:example/ui/example/useStage/twolevel_refresh.dart';
import 'useStage/qq_chat_list.dart';
import 'useStage/tapbutton_refresh.dart';

class ExamplePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ExamplePageState();
  }
}

class ExampleItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ExampleItemState();
  }

  final void Function()? onClick;

  final String title;

  ExampleItem({this.title = '', this.onClick});
}

class _ExampleItemState extends State<ExampleItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: widget.onClick,
      child: Container(
        height: 100.0,
        child: Card(
          child: Center(
            child: Text(widget.title),
          ),
        ),
      ),
    );
  }
}

class _ExamplePageState extends State<ExamplePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final List<ExampleItem> items1 = [
      ExampleItem(
          title: "基础用法",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return BasicExample();
            }));
          }),
      ExampleItem(
          title: "手动隐藏footer",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                body: HideFooterManual(),
                appBar: AppBar(),
              );
            }));
          }),
      ExampleItem(
          title: "水平刷新",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                body: HorizontalRefresh(),
                appBar: AppBar(),
              );
            }));
          }),
      ExampleItem(
          title: "点击按钮触发刷新",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return TapButtonRefreshExample();
            }));
          }),
      ExampleItem(
          title: "NestedScrollView下刷新",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return NestedRefresh();
            }));
          }),
      ExampleItem(
          title: "模仿qq聊天",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return QQChatList();
            }));
          }),
      ExampleItem(
          title: "空白视图+刷新",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                body: RefreshWithEmptyView(),
                appBar: AppBar(),
              );
            }));
          }),
      ExampleItem(
          title: "淘宝二楼例子",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return TwoLevelExample();
            }));
          }),
      ExampleItem(
          title: "强制填满一屏",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                body: ForceFullExample(),
                appBar: AppBar(),
              );
            }));
          }),
    ];

    final List<ExampleItem> items3 = [
      ExampleItem(
          title: "LinkHeader例子",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return LinkHeaderExample();
            }));
          }),
      ExampleItem(
          title: "Shimmer指示器例子",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                appBar: AppBar(),
                body: ShimmerIndicatorExample(),
              );
            }));
          }),
      ExampleItem(
          title: "footer使其于header同样表现",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return ConvertFooter();
            }));
          }),
    ];

    return Column(
      children: <Widget>[
        Container(
          child: TabBar(
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                text: "使用场景",
              ),
              Tab(
                text: "自定义指示器",
              ),
            ],
          ),
          height: 50.0,
          color: Colors.greenAccent,
        ),
        Expanded(
          child: TabBarView(
            children: <Widget>[
              ListView(children: items1),
              ListView(children: items3)
            ],
            controller: _tabController,
          ),
        )
      ],
    );
  }
}
