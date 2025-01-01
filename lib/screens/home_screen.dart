import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/book_card.dart';

class HomeScreen extends StatelessWidget {
  final List<Book> books = [
    Book(
      id: '1',
      title: 'Dark Hope',
      author: 'H.D. Smith',
      price: 19.99,
      img: './assets/covers/book1.jpeg'
    ),
    Book(
      id: '2',
      title: 'Harry Potter and The Philosopher\'s Stone',
      author: 'J. K. Rowling',
      price: 14.99,
      img: './assets/covers/book8.webp'
    ),
    Book(
      id: '3',
      title: 'The Outer Space',
      author: 'Kimberly Hopkins',
      price: 16.99,
      img: './assets/covers/book3.png'
    ),
    Book(
      id: '4',
      title: 'Words of Radiance',
      author: 'Brandon Sanderson',
      price: 16.99,
      img: './assets/covers/book4.jpg'
    ),
    Book(
      id: '5',
      title: 'The Court of Sinners & Snakes',
      author: 'Hayley Rose',
      price: 16.99,
      img: './assets/covers/book5.jpg'
    ),
    Book(
      id: '6',
      title: 'OMEGA VI',
      author: 'Adam Lewis',
      price: 16.99,
      img: './assets/covers/book6.jpg'
    ),
    Book(
      id: '7',
      title: 'Shapeshift',
      author: 'Lucas LLoyd',
      price: 16.99,
      img: './assets/covers/book7.jpg'
    ),
    Book(
      id: '8',
      title: 'Harry Potter and The Goblet of Fire',
      author: 'J. K. Rowling',
      price: 16.99,
      img: './assets/covers/book2.jpg'
    ),
  ];

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: const Text('Book Store',
    style: TextStyle(
      fontSize: 25,
      color: Colors.black,
      fontWeight: FontWeight.bold

    )),
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