import 'package:aireder/components/book/verticalbook.dart';
import 'package:aireder/model/BookModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _BookListState();
  }
}

class _BookListState extends State<BookListPage> {
  ScrollController _controller = new ScrollController();
  var _books = new List<Book>();
  var _mPage = 1;
  var _finish = false;

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

  Widget RenderBooks() {
    return ListView.separated(
        shrinkWrap: true,
        controller: _controller,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          //判断是否构建到了最后一条item
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
                  style: TextStyle(color: Colors.black54),
                ),
              );
            }
          } else {
            return VerticalBook(
              book: _books[index],
            );
          }
        },
        //分割线构造器
        separatorBuilder: (context, index) {
          return new Divider(
            height: 2,
            color: Colors.black12,
          );
        },
        //_items.length + 1是为了给最后一行的加载loading留出位置
        itemCount: _books.length + 1);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return Scaffold(
      appBar: new PreferredSize(
          preferredSize: Size.fromHeight(ScreenUtil().setWidth(140)),
          child: AppBar(
            title: Text("书籍列表"),
          )),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: RenderBooks(),
      ),
    );
  }

  void getData() async {
    //初始数据源
    Response res = await Dio().get(
        "https://api.rbxgg.cn/api/book/search?attr=all&page=" +
            _mPage.toString());
    for (int i = 0; i < res.data['list'].length; i++) {
      _books.insert(_books.length, Book.fromMap(res.data['list'][i]));
    }
    setState(() {
    });
  }

  void _retrieveData() async {
    //上拉加载新的数据
    _mPage++;
    Response res = await Dio().get(
        "https://api.rbxgg.cn/api/book/search?attr=all&page=" +
            _mPage.toString());
    for (int i = 0; i < res.data['list'].length; i++) {
      _books.insert(_books.length, Book.fromMap(res.data['list'][i]));
    }
    if (res.data['list'].length == 0) {
      setState(() {
        _finish = true;
      });
    }else {
      setState(() {
      });
    }
  }

  Future<void> _onRefresh() async {
    Response res =
        await Dio().get("https://api.rbxgg.cn/api/book/search?attr=all&page=1");
    for (int i = 0; i < res.data['list'].length; i++) {
      _books.insert(_books.length, Book.fromMap(res.data['list'][i]));
    }
    setState(() {
      _books.clear();
      _mPage = 1;
    });
  }

  @override
  void dispose() {
    //移除监听，防止内存泄漏
    _controller.dispose();
    super.dispose();
  }
}
