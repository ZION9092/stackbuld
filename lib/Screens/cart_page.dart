import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.find();

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     onPressed: () {
      //       Get.back(); // Navigate back to the previous screen
      //     },
      //     icon: const Icon(
      //       Iconsax.arrow_left_2,
      //       color: Colors.white,
      //     ),
      //   ),
      //   title:  Text('My Cart',
      //   style: Theme.of(context).textTheme.displayLarge!.copyWith(
      //     color: Colors.white,
      //     fontWeight: FontWeight.w700
      //   )
      //   ),
      //   backgroundColor: Colors.blue.shade900,
      // ),
      body: Obx(() {
        final cartItems = cartController.cartItems;

        
        if (cartItems.isEmpty) {
          return Center(
            child: Text(
              'You have no items in your cart.',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold, color: Colors.blue.shade900),
            ),
          );
        }

        // Show cart items if cart isn't empty
        return ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            final product = cartItems.keys.toList()[index];
            final quantity = cartItems[product];
            return ListTile(
              leading: Image.asset(product.imageAsset),
              title: Text(product.title ?? ''),
              subtitle: Text('Quantity: $quantity'),
              trailing:
                  Text('\$${(product.price! * quantity!).toStringAsFixed(2)}'),
            );
          },
        );
      }),
    );
  }
}