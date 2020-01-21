
class Bannar {
  String title;
  String img;
  String link;
  static Bannar fromMap(map) {
    Bannar bannarModel = Bannar();
    bannarModel.title = map['title'];
    bannarModel.img = map['img'];
    bannarModel.link = map['link'];
    return bannarModel;
  }
}