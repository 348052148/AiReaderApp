import 'package:aireder/components/bottomNavigationBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _User();
  }
}

class _User extends State {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(ScreenUtil().setWidth(140)),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Text("个人中心", style: TextStyle(fontSize: 16)),
          )),
      body: Column(
        children: <Widget>[
          //头像 名称
          Container(
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Container(
                  child: Image.network(
                    "http://img.zcool.cn/community/01b7645deb9963a801213853840618.png@1280w_1l_2o_100sh.png",
                    width: ScreenUtil().setWidth(200),
                    height: ScreenUtil().setWidth(200),
                  ),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(13, 0, 0, 0),
                  child: Text(
                    "用户604783",
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
          ),
          //设置
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/setting');
            },
            child: Container(
              color: Colors.white,
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text("设置"),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBarView(
        defaultIndex: 2,
      ),
    );
  }
}
