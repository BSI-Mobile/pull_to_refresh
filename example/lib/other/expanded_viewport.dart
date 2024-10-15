/*
 * Author: Jpeng
 * Email: peng8350@gmail.com
 * Time:  2019-07-11 12:23
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/*
   aim to implements expand all the free empty place when viewport is not full
   ,but this can not correction offset,due to _minScrollExtent,_maxScrollExtent private in RenderViewport
   ,no idea how to do. without doing this,chat list (top when not full && reverse = true) can not be done.
   in my plugin similar issue:#127,# 118
   in flutter similar issue:#12650,#33399,#17444
 */

//tag
class SliverExpanded extends SingleChildRenderObjectWidget {
  SliverExpanded() : super(child: Container());

  @override
  RenderSliver createRenderObject(BuildContext context) {
    // TODO: implement createRenderObject
    return _RenderExpanded();
  }
}

class _RenderExpanded extends RenderSliver
    with RenderObjectWithChildMixin<RenderBox> {
  @override
  void performLayout() {
    // TODO: implement performLayout
    geometry = SliverGeometry.zero;
  }
}
