import 'package:aireder/components/book/crossbook.dart';
import 'package:flutter/material.dart';

class BookTopic extends StatelessWidget {
  BookTopic({Key key, this.title}) : super(key: key);
  final String title;

  Widget renderHeader(context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/book_list');
                },
                child: Text(
                  '更多',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF666666),
                  ),
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                size: 18,
                color: Color(0xFF999999),
              ),
            ],
          ),
        ],
      ),
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
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          this.renderHeader(context),
          this.renderBody(),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Divider(
              height: 2,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
