import 'package:aireder/components/book/crossbook.dart';
import 'package:aireder/components/bottomNavigationBar.dart';
import 'package:aireder/model/BookModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookShelfPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BookShelf();
  }
}

class _BookShelf extends State with SingleTickerProviderStateMixin {
  TabController mController;
  List<String> tabTitles;
  List<Book> _books = new List<Book>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabTitles = ["我的书架", "最近阅读"];
    mController = TabController(
      length: tabTitles.length,
      vsync: this,
    );
    getData();
  }

  void getData() async {
    Response res = await Dio().get(
        "https://api.rbxgg.cn/api/book/search?attr=all&page=1");
    for (int i = 0; i < res.data['list'].length; i++) {
      _books.insert(_books.length, Book.fromMap(res.data['list'][i]));
    }
    setState(() {
    });
  }

  Widget renderBody() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: _books.length,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 2),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 0,
        childAspectRatio: 0.55,
      ),
      itemBuilder: (context, index) {
        return CrossBook(book:_books[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return Scaffold(
      appBar: new PreferredSize(
          preferredSize: Size.fromHeight(ScreenUtil().setHeight(90)),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: new TabBar(
              controller: mController,
              tabs: tabTitles.map((item) {
                return Tab(
                  text: item,
                );
              }).toList(),
              indicatorColor: Colors.black,
              indicatorWeight: ScreenUtil().setWidth(10),
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black54,
              labelStyle: TextStyle(fontSize: 14),
            ),
          )),
      body: TabBarView(
        controller: mController,
        children: tabTitles.map((item) {
          return Padding(
            child: CustomScrollView(
              controller: ScrollController(),
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate([renderBody()]),
                )
              ],
            ),
            padding: EdgeInsets.all(8),
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomNavigationBarView(
        defaultIndex: 1,
      ),
    );
  }
}
