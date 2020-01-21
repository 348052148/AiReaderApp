import 'package:aireder/model/BookModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalBook extends StatelessWidget {
  VerticalBook({this.book});

  Book book;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    print(ScreenUtil.screenWidth);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/book', arguments: {"book": book});
      },
      child: Container(
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: ScreenUtil().setHeight(500),
              padding: EdgeInsets.only(left: 5),
              child: Image(
                fit: BoxFit.fill,
                alignment: Alignment.topLeft,
                image: new NetworkImage(book.cover),
                width: ScreenUtil().setWidth(300),
                height: ScreenUtil().setHeight(450),
              ),
//              color: Colors.blue,
            ),
//            详情
            Container(
              width: ScreenUtil().setWidth(1080 - 340),
              padding: EdgeInsets.only(left: 10),
//                color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      book.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.left,
                      strutStyle: StrutStyle(height: 2),
                    ),
                  ),
                  Expanded(
                    child: Text("作者：" + book.author),
                  ),
                  Expanded(
                    child: Text(
                      book.detail,
                      softWrap: true,
                      strutStyle: StrutStyle(height: 1.6),
                      maxLines: 3,
                    ),
                    flex: 3,
                  )
                ],
              ),
            )
          ],
        ),
        height: ScreenUtil().setHeight(450),
        padding: EdgeInsets.all(5),
        color: Colors.white,
      ),
    );
  }
}
