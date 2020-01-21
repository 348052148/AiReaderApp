
class Book {
  String bookId;
  int classifyId;
  String title;
  String author;
  String detail;
  String cover;
  String status;

  static Book fromMap(map) {
    Book book = new Book();
    book.bookId = map['book_id'];
    book.classifyId = map['classify_id'];
    book.title = map['title'];
    book.author = map['author'];
    book.detail = map['detail'];
    book.cover = map['cover'];
    book.status = map['status'];
    return book;
  }
}