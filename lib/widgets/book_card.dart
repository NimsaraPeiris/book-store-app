import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/book.dart';
import '..providers/cart_provider.dart';

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({super.key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(book.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(
              height: 8,
            ),
            Text('By $book.author',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton.icon(
              onPressed: () {
                context.read<CartProvider>().addItem(book);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Added to cart'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              icon: const Icon(Icons.shopping_cart), // Add an icon here
              label: const Text(
                  'Added to cart'), // Use the label parameter instead of child
            ),
          ],
        ),
      ),
    );
  }
}
