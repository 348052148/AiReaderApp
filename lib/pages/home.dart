import 'package:aireder/components/book/verticalbook.dart';
import 'package:aireder/components/bookTopic.dart';
import 'package:aireder/components/bottomNavigationBar.dart';
import 'package:aireder/components/swiper.dart';
import 'package:aireder/model/BannarModel.dart';
import 'package:aireder/model/BookModel.dart';
import 'package:dio/dio.dart';
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
  var _books = new List<Book>();
  var _hotBooks = new List<Book>();
  var _recommendBooks = new List<Book>();
  var _bannars = new List<Bannar>();
  var _finish = false;
  var _mPage = 1;

  @override
  void initState() {
    super.initState();
    getHomeBooks();
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

  void getHomeBooks() async {
    Response res = await Dio().get("https://api.rbxgg.cn/api/home/books");
    for(int i=0; i < res.data['hot'].length; i++){
      _hotBooks.insert(_hotBooks.length, Book.fromMap(res.data['hot'][i]));
    }
    for(int i=0; i < res.data['recommend'].length; i++){
      _recommendBooks.insert(_recommendBooks.length, Book.fromMap(res.data['recommend'][i]));
    }
    for(int i=0; i < res.data['bannars'].length; i++){
      _bannars.insert(_bannars.length, Bannar.fromMap(res.data['bannars'][i]));
    }
    setState(() {});
  }

  void getData() async {
    //https://api.rbxgg.cn/api/book/search?attr=all&page=1
    Response res = await Dio().get("https://api.rbxgg.cn/api/book/search?attr=all&page="+_mPage.toString());
    //print(res.data.toString());
    //初始数据源
    for (int i = 0; i < res.data['list'].length; i++) {
      _books.insert(_books.length, Book.fromMap(res.data['list'][i]));
    }
    setState(() {});
  }

  void _retrieveData() async {
    //上拉加载新的数据
    _mPage++;
    Response res = await Dio().get("https://api.rbxgg.cn/api/book/search?attr=all&page="+_mPage.toString());
    for (int i = 0; i < res.data['list'].length; i++) {
      _books.insert(_books.length, Book.fromMap(res.data['list'][i]));
    }
    if (res.data['list'.length] == 0) {
      setState(() {
        _finish = true;
      });
    }else {
      setState(() {});
    }
  }

  Widget RenderBooks() {
    return new SliverPadding(
      padding: const EdgeInsets.all(0.0),
      sliver: new SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          if (index == _books.length) {
            //判断是不是最后一页
            if (!_finish) {
              //不是最后一页，返回一个loading窗
              return new Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: SizedBox(
                  width: ScreenUtil().setWidth(48),
                  height: ScreenUtil().setWidth(48),
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
                VerticalBook(book:_books[index]),
                Divider(
                  height: 1,
                  color: Colors.black12,
                ),
              ],
            );
//                    return ListTile(leading: Book(),);
          }
        }, childCount: _books.length + 1),
      ),
    );
  }

  Widget RenderSearch() {
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
                padding: EdgeInsets.all(6),
              ),
              Center(
                  child: Text(
                "全网书籍搜索",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
              ))
            ],
          ),
          height: ScreenUtil().setWidth(120),
          margin: EdgeInsets.fromLTRB(10, 28, 10, 0),
        ));
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
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
                            height: ScreenUtil().setWidth(60),
                            color: Color.fromARGB(20, 255, 255, 255),
                          ),
                          HomeSwiper(bannars: _bannars,),
                          BookTopic(
                            title: "热门",
                            books: _hotBooks,
                          ),
                          BookTopic(
                            title: "推荐",
                            books: _recommendBooks,
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
