import 'package:flutter/material.dart';
import 'screens/book_details_screen.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'screens/home_screen.dart';
import 'screens/cart_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => CartProvider(),
      child: MaterialApp(
        title: 'Book Store',
        theme: ThemeData(primarySwatch: Colors.green,
        useMaterial3: true,
        ),
        initialRoute: '/',
        routes:{
          '/': (ctx) => HomeScreen(),
          '/cart': (ctx) => const CartScreen(),
          BookDetailsScreen.routeName: (ctx) => const BookDetailsScreen(),
        },
      ),
    );
  }
}