import 'package:flutter/foundation.dart';
import '../models/book.dart';
import '/models/cart_item.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};

  int get itemCount => _items.length;

  double totalAmount() {
  double total = 0.0;
  _items.forEach((key, cartItem) {
    total += cartItem.book.price * cartItem.quantity;
  });
  return total;
}

  void addItem(Book book) {
    if (_items.containsKey(book.id)) {
      _items.update(
        book.id,
        (existingCartItem) => CartItem(
          book: existingCartItem.book,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        book.id,
        () => CartItem(book: book),
      );
    }
    notifyListeners();
  }

  void removeItem(String bookId) {
    _items.remove(bookId);
    notifyListeners();
  }
}
