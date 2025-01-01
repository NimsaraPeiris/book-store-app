import 'package:flutter/foundation.dart';
import '../models/book.dart';

class BookProvider extends ChangeNotifier {
  final List<Book> _books = [
    Book(
      id: '1',
      title: 'The Great Gatsby',
      author: 'F. Scott Fitzgerald',
      price: 9.99,
      img: '../../assets/book1.jpeg'
    ),
    Book(
      id: '2',
      title: '1984',
      author: 'George Orwell',
      price: 12.99,
      img: '../../assets/book2.jpeg'
    ),
    Book(
      id: '3',
      title: 'To Kill a Mockingbird',
      author: 'Harper Lee',
      price: 14.99,
      img: '../../assets/book3.jpeg'
    ),
  ];

  List<Book> get books => [..._books];

  Book findById(String id) {
    return _books.firstWhere((book) => book.id == id);
  }
}