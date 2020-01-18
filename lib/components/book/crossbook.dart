import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrossBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/book");
      },
      child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Column(children: <Widget>[
            Expanded(
              child: Container(
                child: Image(
                  image: new NetworkImage(
                      'https://api.rbxgg.cn/book/image/9530a3acb52c98d1b795e7f3925d2a62.jpeg'),
                  width: 105,
                  height: 165,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(2, 0, 2, 2),
              child: Text(
                "凡人修仙传之仙界篇02",
                style: TextStyle(fontSize: 14),
                strutStyle: StrutStyle(height: 1.6),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(2, 0, 2, 2),
              child: Text(
                "作者：天蚕土豆",
                style: TextStyle(fontSize: 12, color: Colors.black26),
                strutStyle: StrutStyle(height: 1.6),
              ),
            )
          ])),
    );
  }
}
