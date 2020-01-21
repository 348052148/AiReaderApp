import 'package:aireder/model/BannarModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeSwiper extends StatefulWidget {
  HomeSwiper({this.bannars});
  List<Bannar> bannars;
  @override
  State<StatefulWidget> createState() {
    return _HomeSwiper(bannars: bannars);
  }
}

class _HomeSwiper extends State {
  _HomeSwiper({this.bannars});
  List<Bannar> bannars;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: ScreenUtil().setHeight(600),
        child: Swiper(
          itemBuilder: (c, i) {
            return (Image.network(
              bannars[i].img,
              fit: BoxFit.fill,
            ));
          },
          itemCount: bannars.length,
          pagination: new SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                color: Colors.black54,
                activeColor: Colors.white,
              )),
          control: new SwiperControl(),
          scrollDirection: Axis.horizontal,
          autoplay: false,
          onTap: (index) => print('点击了第$index个'),
        ));
  }
}
