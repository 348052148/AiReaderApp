import 'package:aireder/components/book/verticalbook.dart';
import 'package:aireder/components/bookTopic.dart';
import 'package:aireder/components/bottomNavigationBar.dart';
import 'package:aireder/components/swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePage();
  }
}

class _HomePage extends State {
  ScrollController _controller = new ScrollController();
  var _items = new List<String>();
  var _mPage = 0;

  @override
  void initState() {
    super.initState();
    getData();
    //给_controller添加监听
    _controller.addListener(() {
      //判断是否滑动到了页面的最底部
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        //如果不是最后一页数据，则生成新的数据添加到list里面
        if (_mPage < 4) {
          _retrieveData();
        }
      }
    });
  }

  void getData() {
    //初始数据源
    for (int i = 0; i < 20; i++) {
      _items.insert(_items.length, "第${_items.length}条原始数据");
      print(_items[i]);
    }
  }

  void _retrieveData() {
    //上拉加载新的数据
    _mPage++;
    Future.delayed(Duration(seconds: 2)).then((e) {
      for (int i = 0; i < 20; i++) {
        _items.insert(_items.length, "这是新加载的第${_items.length}条数据");
      }
      setState(() {});
    });
  }

  Widget RenderBooks() {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    return new SliverPadding(
      padding: const EdgeInsets.all(0.0),
      sliver: new SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          if (index == _items.length) {
            //判断是不是最后一页
            if (_mPage < 4) {
              //不是最后一页，返回一个loading窗
              return new Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: SizedBox(
                  width: ScreenUtil().setWidth(48),
                  height: ScreenUtil().setHeight(48),
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                  ),
                ),
              );
            } else {
              //是最后一页，显示我是有底线的
              return new Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: new Text(
                  '我是有底线的!!!',
                  style: TextStyle(color: Colors.blue),
                ),
              );
            }
          } else {
            return Column(
              children: <Widget>[
                //分割线构造器
                VerticalBook(),
                Divider(
                  height: 2,
                  color: Colors.blue,
                ),
              ],
            );
//                    return ListTile(leading: Book(),);
          }
        }, childCount: _items.length + 1),
      ),
    );
  }

  Widget RenderSearch() {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/search');
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black26, width: 1),
            color: Colors.white,
          ),
          child: Row(
            children: <Widget>[
              Padding(
                child: Icon(Icons.search),
                padding: EdgeInsets.all(4),
              ),
              Center(
                  child: Text(
                "全网书籍搜索",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
              ))
            ],
          ),
          height: ScreenUtil().setHeight(80),
          margin: EdgeInsets.fromLTRB(10, 26, 10, 0),
        ));
    return SliverPersistentHeader(
      pinned: true, //是否固定在顶部
      floating: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 70, //收起的高度
        maxHeight: 70, //展开的最大高度
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/search');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black26, width: 1),
              color: Colors.white,
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  child: Icon(Icons.search),
                  padding: EdgeInsets.all(4),
                ),
                Center(
                    child: Text(
                  "全网书籍搜索",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
                ))
              ],
            ),
            height: 40,
            margin: EdgeInsets.fromLTRB(5, 25, 0, 5),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              decoration: BoxDecoration(color: Colors.black26),
              child: CustomScrollView(
                controller: _controller,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                // 内容
                slivers: <Widget>[
                  new SliverPadding(
                    padding: const EdgeInsets.all(0.0),
                    sliver: new SliverList(
                      delegate: new SliverChildListDelegate(
                        <Widget>[
                          //填充顶部
                          Container(
                            height: ScreenUtil().setHeight(40),
                            color: Color.fromARGB(20, 255, 255, 255),
                          ),
                          HomeSwiper(),
                          BookTopic(
                            title: "热门",
                          ),
                          BookTopic(
                            title: "推荐",
                          )
                        ],
                      ),
                    ),
                  ),
                  RenderBooks(),
//            SliverList()
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: RenderSearch(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarView(
        defaultIndex: 0,
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight > minHeight ? maxHeight : minHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
