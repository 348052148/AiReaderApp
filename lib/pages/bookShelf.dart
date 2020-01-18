import 'package:aireder/components/book/crossbook.dart';
import 'package:aireder/components/bottomNavigationBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabTitles = ["书架", "最近阅读"];
    mController = TabController(
      length: tabTitles.length,
      vsync: this,
    );
  }

  Widget renderBody() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 9,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 0.55,
      ),
      itemBuilder: (context, index) {
        return CrossBook();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new PreferredSize(
          preferredSize: Size.fromHeight(50),
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
              indicatorWeight: 5,
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
