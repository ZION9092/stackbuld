import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../models/product.dart';
import '../controllers/cart_controller.dart'; // Import CartController

class ProductDetailPage extends StatelessWidget {
  final Product product;
  final CartController cartController = Get.find<CartController>(); // Use Get.find to access CartController

  ProductDetailPage({super.key, required this.product, required CartController cartController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back(); // Navigate back to the previous screen
          },
          icon: const Icon(
            Iconsax.arrow_left_2,
            color: Colors.white,
          ),
        ),
        title:  Text(
          "Product Details",
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
          color: Colors.white
        ),
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.asset(
                product.imageAsset,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16),
            // Product title
            Text(
              product.title ?? "No Title",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Product price
            Text(
              "\$${product.price?.toStringAsFixed(2) ?? '0.00'}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            // Product description
            Text(
              product.description ?? "No description available.",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.blue.shade900
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 24),
            // Cart management
            Obx(() {
              final itemCount = cartController.cartItems[product] ?? 0;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.red,
                    child: IconButton(
                      icon: const Icon(Icons.remove,
                      color: Colors.white,
                      ),
                      onPressed: () {
                        if (itemCount > 0) {
                          cartController.removeFromCart(product);
                        }
                      },
                    ),
                  ),
                  Text('$itemCount', style: const TextStyle(fontSize: 20)),
                  Container(
                    color: Colors.blue.shade900,
                    child: IconButton(
                      icon: const Icon(Icons.add,
                      color: Colors.white,
                      ),
                      onPressed: () {
                        cartController.addToCart(product);
                      },
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
