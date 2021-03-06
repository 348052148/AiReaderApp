import 'package:aireder/components/book/verticalbook.dart';
import 'package:aireder/model/BookModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BookDetail();
  }
}

class _BookDetail extends State {
  Book book;

  Widget RenderBookinfo() {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Align(
            alignment: FractionalOffset.topCenter,
            child: Column(
              children: <Widget>[
                Image.network(
                  book.cover,
                  fit: BoxFit.fill,
                  width: ScreenUtil().setWidth(340),
                  height: ScreenUtil().setWidth(450),
                ),
                Text(
                  book.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  book.author,
                  style: TextStyle(color: Colors.black54),
                ),
                Container(
                  alignment: Alignment.center,
                  width: ScreenUtil().setWidth(650),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        child: FlatButton(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.blue,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text("开始阅读"),
                        ),
                        padding: EdgeInsets.all(10),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: FlatButton(
                          child: Text("加入书架"),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.amber,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget RenderBookDescript() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Text(
        book.detail,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }

  Widget RenderBookChapterTile() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
      child: ListTile(
        leading: Icon(Icons.apps),
        title: Text("目录(1200章)"),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context).settings.arguments;
    print(arguments["book"]);
    if (arguments != null && arguments["book"] != null) {
      book = arguments['book'];
    }
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ScreenUtil().setWidth(140)),
        child: AppBar(
          title: Text(
            "书籍详情",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              RenderBookinfo(),
              RenderBookDescript(),
              RenderBookChapterTile(),
              //推荐
              RecommendBooks(),
            ],
          ),
        ),
      ),
    );
  }
}

class RecommendBooks extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RecommendBooks();
  }
}

class _RecommendBooks extends State {
  Widget RenderHead() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '推荐',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                '换一换',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF666666),
                ),
              ),
              Icon(
                Icons.cached,
                size: 20,
                color: Color(0xFF999999),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget RenderBody() {
    return Column(
      children: <Widget>[
        VerticalBook(book: Book.fromMap({'title': '元尊', 'author': '天蚕土豆', 'cover': "https://cdn.static.17k.com/book/189x272/66/50/2945066.jpg-189x272?v=0", "detail":"要么断言表明框架本身存在错误"}),),
        VerticalBook(book: Book.fromMap({'title': '元尊', 'author': '天蚕土豆', 'cover': "https://cdn.static.17k.com/book/189x272/66/50/2945066.jpg-189x272?v=0", "detail":"要么断言表明框架本身存在错误"}),),
        VerticalBook(book: Book.fromMap({'title': '元尊', 'author': '天蚕土豆', 'cover': "https://cdn.static.17k.com/book/189x272/66/50/2945066.jpg-189x272?v=0", "detail":"要么断言表明框架本身存在错误"}),),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        RenderHead(),
        RenderBody(),
      ],
    );
  }
}
