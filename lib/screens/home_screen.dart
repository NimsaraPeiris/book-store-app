import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/book_card.dart';

class HomeScreen extends StatelessWidget {
  final List<Book> books = [
    Book(
      id: '1',
      title: 'The Great Gatsby',
      author: 'F. Scott Fitzgerald',
      price: '19.99',
    ),
    Book(
      id: '2',
      title: 'To Kill a Mockingbird',
      author: 'Harper Lee',
      price: '14.99',
    ),
    Book(id: '3', title: 'The Catcher in the Rye', author: 'J. D. Salinger', price: '16.99'),
  ];

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: const Text('Book Store'),
    actions: [
      IconButton(
        icon: const Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
      ),
    ],
  ),
  body: GridView.builder (
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        return BookCard(book: books[index]);
        },
      ),
    );
  }
}