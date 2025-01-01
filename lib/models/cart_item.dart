import '../models/book.dart';
class CartItem {
  final Book book;
  final int quantity;

  CartItem({
    required this.book,
    this.quantity = 1,
  });
}
