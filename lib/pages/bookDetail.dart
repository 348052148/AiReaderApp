import 'package:aireder/components/book/verticalbook.dart';
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
  Widget RenderBookinfo() {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: true)..init(context);
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
                  "https://api.rbxgg.cn/book/image/a3d32edbfbff45691b71d1a0b3f89c7c.jpeg",
                  width: ScreenUtil().setWidth(280),
                  height: ScreenUtil().setHeight(360),
                ),
                Text(
                  "圣墟",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  "辰东",
                  style: TextStyle(color: Colors.black54),
                ),
                Container(
                  width: ScreenUtil().setWidth(460),
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
        "《圣墟》是辰东继《完美世界》后的一部新的小说，2016年11月1日正式发布，作者话：新书圣墟开始了，请所有兄弟姐妹继续支持辰东，感谢你们。小说圣墟简介：在破败中崛起在寂灭中复苏。 沧海成尘，雷电枯竭，那一缕幽雾又一次临近大地，世间的枷锁被打开了，一个全新的世界就此揭开神秘的一角……温馨提示：本站闪更由网络作家辰东著写的《圣墟》玄幻魔法小说供书友阅读，你的收藏是对我们最大的鼓励！",
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
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: true)..init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ScreenUtil().setHeight(100)),
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
        VerticalBook(),
        VerticalBook(),
        VerticalBook(),
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
