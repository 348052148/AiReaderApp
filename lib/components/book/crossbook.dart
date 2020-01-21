import 'package:aireder/model/BookModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CrossBook extends StatelessWidget {
  CrossBook({this.book});

  Book book;

  @override
  Widget build(BuildContext context) {
    //默认设置宽度1080px，高度1920px
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/book", arguments: {"book": book});
      },
      child: Container(
//        color: Colors.blue,
        child: Column(children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
//            color: Colors.red,
            child: Image(
              fit: BoxFit.fill,
              image: new NetworkImage(book.cover),
              width: ScreenUtil().setWidth(300),
              height: ScreenUtil().setWidth(400),
            ),
            width: ScreenUtil().setWidth(300),
            height: ScreenUtil().setWidth(400),
          ),
          Text(
            book.title,
            style: TextStyle(fontSize: 14),
            strutStyle: StrutStyle(height: 1.6),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          Text(
            "作者：" + book.author,
            style: TextStyle(fontSize: 12, color: Colors.black26),
            strutStyle: StrutStyle(height: 1.6),
          )
        ]),
      ),
    );
  }
}
