import 'package:get/get.dart';
import '../models/product.dart';

class FavoritesController extends GetxController {
  var favorites = <Product>[].obs;

  void toggleFavorite(Product product) {
    if (favorites.contains(product)) {
      favorites.remove(product);
    } else {
      favorites.add(product);
    }
  }

  bool isFavorite(Product product) {
    return favorites.contains(product);
  }
}