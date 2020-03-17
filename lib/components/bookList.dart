
import 'package:aireder/components/book/verticalbook.dart';
import 'package:aireder/model/BookModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookList extends StatefulWidget {
  BookList({this.books});
  List<Book> books;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BookList(books: books);
  }
}

class _BookList extends State {
  _BookList({this.books});
  List<Book> books;
  var _finish = false;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return SliverPadding(
      padding: const EdgeInsets.all(0.0),
      sliver: new SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          if (index == books.length) {
            //判断是不是最后一页
            if (!_finish) {
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
                VerticalBook(book:books[index]),
                Divider(
                  height: 1,
                  color: Colors.black12,
                ),
              ],
            );
//                    return ListTile(leading: Book(),);
          }
        }, childCount: books.length + 1),
      ),
    );
  }
}