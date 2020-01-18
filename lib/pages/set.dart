import 'package:flutter/material.dart';

class SetingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
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
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            width: 360,
            height: 50,
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
