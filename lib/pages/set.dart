import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: true)..init(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(ScreenUtil().setHeight(90)),
          child: AppBar(
            title: Text("设置", style: TextStyle(fontSize: 16)),
          )),
      body: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/login');
            },
            child: Container(
              color: Colors.white,
              child: ListTile(
                leading: Icon(Icons.https),
                title: Text("重置密码"),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.call),
              title: Text("联系我们"),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
          Container(
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.help),
              title: Text("帮助中心"),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
            width: ScreenUtil().setWidth(710),
            height: ScreenUtil().setHeight(80),
            child: FlatButton(
              onPressed: () {},
              child: Text("退出登陆", style: TextStyle(color: Colors.white, fontSize: 17),),
              color: Colors.blue,
              textColor: Colors.black,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.blue,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8)),
            ),
          )
        ],
      ),
    );
  }
}
