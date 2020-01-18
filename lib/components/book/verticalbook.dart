import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: true)..init(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/book');
      },
      child: Container(
        child: Row(
          children: <Widget>[
            Padding(
              child: Image(
                image: new NetworkImage(
                    'https://api.rbxgg.cn/book/image/9530a3acb52c98d1b795e7f3925d2a62.jpeg'),
                width: ScreenUtil().setWidth(200),
                height: ScreenUtil().setHeight(280),
              ),
              padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 15, 5, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    child: Text(
                      "元尊",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.left,
                      strutStyle: StrutStyle(height: 2),
                    ),
                    padding: EdgeInsets.only(top: 12),
                  ),
                  Padding(
                    child: Text("作者：天蚕土豆"),
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(465),
                    child: Text(
                      "介绍:    穷困潦倒的漫画家米航，为了缴付“昂贵”的租金，接受了位面的邀请，" +
                          "成为穿梭诸天位面的赏金猎人。拯救木叶、逃离长空市、忍神山的战争、藏剑山庄，" +
                          "米航在一个又一个任务中逐渐成长，同时，他也成为了别人眼中的任务目标。",
                      softWrap: true,
                      strutStyle: StrutStyle(height: 1.6),
                      maxLines: 3,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        height: ScreenUtil().setHeight(410),
        color: Colors.white,
      ),
    );
  }
}
