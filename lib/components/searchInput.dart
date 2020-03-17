
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
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
}