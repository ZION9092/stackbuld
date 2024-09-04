import 'package:get/get.dart';
import '../models/product.dart';

class SearchController extends GetxController {
  var searchQuery = ''.obs;
  var searchResults = <Product>[].obs;

  void setSearchQuery(String query) {
    searchQuery.value = query;
  }

  void updateSearchResults(List<Product> allProducts) {
    if (searchQuery.value.isEmpty) {
      searchResults.assignAll(allProducts);
    } else {
      searchResults.assignAll(allProducts.where((product) =>
        product.title?.toLowerCase().contains(searchQuery.value.toLowerCase()) ?? false));
    }
  }
}