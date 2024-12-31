import 'package:flutter_application_1/models/book.dart';
class CartItem {
  final Book book;
  final int quantity;

  CartItem({
    required this.book,
    this.quantity = 1,
  });
}
