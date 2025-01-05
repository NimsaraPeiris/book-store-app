import 'package:flutter/material.dart';
import '../widgets/order_success_animation.dart';
import '../widgets/order_details_card.dart';

class OrderCompletionScreen extends StatelessWidget {
  static const routeName = '/order-completion';
  
  final double totalAmount;
  final String orderId;

  const OrderCompletionScreen({
    Key? key,
    required this.totalAmount,
    required this.orderId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Completed'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const OrderSuccessAnimation(),
            const SizedBox(height: 24),
            Text(
              'Thank you for your order!',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Order ID: $orderId',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            OrderDetailsCard(
              totalAmount: totalAmount,
              orderId: orderId,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/',
                  (route) => false,
                );
              },
              child: const Text('Continue Shopping'),
            ),
          ],
        ),
      ),
    );
  }
}