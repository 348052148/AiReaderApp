import 'package:aireder/components/book/verticalbook.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Search();
  }
}

class _Search extends State {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(ScreenUtil().setHeight(100)),
          child: AppBar(
            title: Text(
              "搜索",
              style: TextStyle(fontSize: 16),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: SearchBarDelegate());
                },
              )
            ],
          )),
      body: Column(
        children: <Widget>[RenderHotSearch(), RenderHostorySearch()],
      ),
    );
  }

  Widget RenderHotSearch() {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '大家都在搜',
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
        ),
        Divider(
          height: 2,
          color: Colors.blueAccent,
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          child: Wrap(
            children: RenderTags([
              "我欲封天",
              "斗罗大陆",
              "魔法学院",
              "天尊",
              "鱼人二代",
              "123",
              "天尊",
              "鱼人二代",
              "黑色星期五"
            ]),
          ),
        )
      ],
    );
  }

  List<Widget> RenderTags(List<String> tags) {
    return tags
        .map((item) => GestureDetector(
              onTap: () {
                showSearch(
                    context: context,
                    delegate: SearchBarDelegate(),
                    query: "斗罗");
              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(right: 6, top: 6),
                  child: Text(
                    item,
                    style: TextStyle(
                        background: Paint()..color = Colors.blue, height: 1.2),
                  )),
            ))
        .toList();
  }

  Widget RenderHostorySearch() {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '搜索历史',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    '清空',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF666666),
                    ),
                  ),
                  Icon(
                    Icons.restore_from_trash,
                    size: 20,
                    color: Color(0xFF999999),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          height: 2,
          color: Colors.blueAccent,
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          child: Wrap(
            children: RenderTags([
              "我欲封天",
              "斗罗大陆",
              "魔法学院",
              "天尊",
              "鱼人二代",
              "黑色星期五",
              "我欲封天",
              "斗罗大陆",
              "魔法学院",
              "12331231",
              "123",
              "天尊",
              "鱼人二代",
              "黑色星期五"
            ]),
          ),
        )
      ],
    );
  }
}

class SearchBarDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = "";
          showSuggestions(context);
        }
      },
    );
  }

  //显示为搜索内容区域的搜索结果内容。
  @override
  Widget buildResults(BuildContext context) {
    print("result" + query);
    return SearchBooks();
  }

  //显示为搜索内容区域的建议内容。
  @override
  Widget buildSuggestions(BuildContext context) {
    print("suggestions" + query);
    return Text("456");
  }

  //这个方法返回一个主题，也就是可以自定义搜索界面的主题样式：
  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return super.appBarTheme(context);
  }
}

class SearchBooks extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchBook();
  }
}

class _SearchBook extends State {
  var _items = new List<String>();
  var _mPage = 0;
  ScrollController _controller = new ScrollController();

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
        print(_items[i]);
      }
      setState(() {});
    });
  }

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      shrinkWrap: true,
      controller: _controller,
      physics: BouncingScrollPhysics(),
      itemCount: _items.length + 1,
      itemBuilder: (context, index) {
        if (index == _items.length) {
          //判断是不是最后一页
          if (_mPage < 4) {
            //不是最后一页，返回一个loading窗
            return new Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                width: 24.0,
                height: 24.0,
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
          return VerticalBook();
        }
      },
      separatorBuilder: (context, index) {
        return new Divider(
          height: 2,
          color: Colors.blue,
        );
      },
    );
  }
}
