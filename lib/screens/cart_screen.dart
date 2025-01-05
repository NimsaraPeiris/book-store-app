import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../utils/order_id_generator.dart';
import 'order_completion_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart',
            style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return const Center(
              child: Text('Your cart is empty',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold)),
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final item = cart.items.values.toList()[index];
                    return ListTile(
                      title: Text(item.book.title),
                      subtitle: Text('${item.quantity} x \$${item.book.price}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          cart.removeItem(item.book.id);
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Total: Rs.${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                      fontSize: Theme.of(context).textTheme.titleSmall!.fontSize,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold
                      )
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () => _handleCheckout(context, cart),
                        child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Checkout',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _handleCheckout(BuildContext context, CartProvider cart) {
    final orderId = generateOrderId();
    final totalAmount = cart.totalAmount;
    
    // Clear cart after successful checkout
    cart.clear();
    
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => OrderCompletionScreen(
          orderId: orderId,
          totalAmount: totalAmount,
        ),
      ),
    );
  }
}