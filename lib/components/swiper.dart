import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeSwiper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeSwiperState();
  }
}

class _HomeSwiperState extends State {
  var images = [
    "https://gw.alicdn.com/L1/723/1568719644/7d/2a/48/7d2a48410b9dd9de64373f1daf56145a.jpg",
    "https://gw.alicdn.com/L1/723/1562656841/c1/76/4f/c1764ff2e1b7b3091300c539800fbde8.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: true)..init(context);
    return Container(
        width: MediaQuery.of(context).size.width,
        height: ScreenUtil().setHeight(400),
        child: Swiper(
          itemBuilder: (c, i) {
            return (Image.network(
              images[i],
              fit: BoxFit.fill,
            ));
          },
          itemCount: images.length,
          pagination: new SwiperPagination(
              builder: DotSwiperPaginationBuilder(
            color: Colors.black54,
            activeColor: Colors.white,
          )),
          control: new SwiperControl(),
          scrollDirection: Axis.horizontal,
          autoplay: true,
          onTap: (index) => print('点击了第$index个'),
        ));
  }
}
