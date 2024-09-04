import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/favorites_controller.dart';
import '../widgets/product_card.dart'; 

class FavoritesPage extends StatelessWidget {
  final FavoritesController favoritesController = Get.find<FavoritesController>();

  FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Favorites',
      //   style: Theme.of(context).textTheme.displayLarge!.copyWith(
      //     color: Colors.white,
      //     fontWeight: FontWeight.w700
      //   )
      //   ),
      //   backgroundColor: Colors.blue.shade900,
      // ),
      body: Obx(() {
        if (favoritesController.favorites.isEmpty) {
          return const Center(
            child: Text('No favorites yet!'),
          );
        }
        return GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: favoritesController.favorites.length,
          itemBuilder: (context, index) {
            return ProductCard(product: favoritesController.favorites[index]);
          },
        );
      }),
    );
  }
}