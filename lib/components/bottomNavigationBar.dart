import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarView extends StatefulWidget {
  BottomNavigationBarView({this.defaultIndex});
  int defaultIndex = 0;
  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationBarViewState(defaultIndex: defaultIndex);
  }
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> with TickerProviderStateMixin {
  _BottomNavigationBarViewState({this.defaultIndex});
  int defaultIndex = 0;
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;

  // 定义一个空的设置状态值的方法
  void _rebuild() {
    setState((){});
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _currentIndex = this.defaultIndex;
      _navigationViews = [
        NavigationIconView(icon: new Icon(Icons.home), title: new Text("首页"), vsync: this),
        NavigationIconView(icon: new Icon(Icons.book), title: new Text("书架"), vsync: this),
        NavigationIconView(icon: new Icon(Icons.perm_identity), title: new Text("个人"), vsync: this),
      ];
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _navigationViews.map((NavigationIconView navigationIconView) => navigationIconView.item).toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.pink,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
        if (index == 0) {
          Navigator.pushReplacementNamed(context, '/');
        }
        if (index == 1) {
          Navigator.pushReplacementNamed(context, '/book_shelf');
        }
        if (index == 2) {
          Navigator.pushReplacementNamed(context, '/user');
        }
      },
    );
  }
}

class NavigationIconView {

  // 创建两个属性，一个是 用来展示 icon， 一个是动画处理
  final BottomNavigationBarItem item;
  final AnimationController controller;
  // 类似于 java 中的构造方法
  // 创建 NavigationIconView 需要传入三个参数， icon 图标，title 标题， TickerProvider
  NavigationIconView({Widget icon, Widget title, TickerProvider vsync}):
        item = new BottomNavigationBarItem(
          icon: icon,
          title: title,
        ),
        controller = new AnimationController(
            duration: kThemeAnimationDuration,    // 设置动画持续的时间
            vsync: vsync                          // 默认属性和参数
        );
}