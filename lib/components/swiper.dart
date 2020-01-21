import 'package:aireder/model/BannarModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeSwiper extends StatelessWidget {
  HomeSwiper({this.bannars});
  List<Bannar> bannars;
  @override
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return Container(
        width: MediaQuery.of(context).size.width,
        height: ScreenUtil().setHeight(400),
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
          autoplay: true,
          onTap: (index) => print('点击了第$index个'),
        ));
  }
}
