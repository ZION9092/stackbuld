import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../models/product.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<Product> allProducts = [
    // Product(imageAsset: 'assets/images/bag4.jpg', title: 'Laptop Bag', price: 8.99),
    // Product(imageAsset: 'assets/images/bag5.jpg', title: 'Sky Bag', price: 12.00),
    // Add more products here
  ];

  List<Product> searchResults = [];
  String searchQuery = '';
  bool isLoading = false;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    searchResults = allProducts; // Initialize with all products
  }

  void updateSearchResults(String query) {
    setState(() {
      searchQuery = query;
      isLoading = true;
      hasError = false;
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          searchResults = allProducts.where((product) {
            return product.title?.toLowerCase().contains(query.toLowerCase()) ?? false;
          }).toList();
          isLoading = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Sticky AppBar with search field
          SliverAppBar(
            pinned: true,
            floating: true,
            backgroundColor: Colors.blue.shade900,
            title: TextField(
              onChanged: updateSearchResults,
              decoration: InputDecoration(
                hintText: 'Search for products...',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: const BorderSide(color: Colors.white)
                ),
                prefixIcon: const Icon(Iconsax.search_normal, color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          // Display loading indicator
          if (isLoading)
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            ),
          // Display error message if there's an error
          if (hasError)
            SliverFillRemaining(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('An error occurred. Please try again.'),
                  ElevatedButton(
                    onPressed: () {
                      updateSearchResults(searchQuery);
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          // Display search results in list format
          if (!isLoading && !hasError)
            searchResults.isEmpty
                ? const SliverFillRemaining(
                    child: Center(child: Text('No results found.')),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final product = searchResults[index];
                        return ListTile(
                          leading: Image.asset(product.imageAsset, width: 50, height: 50),
                          title: Text(product.title ?? "No Title"),
                          subtitle: Text('\$${product.price?.toStringAsFixed(2) ?? '0.00'}'),
                          onTap: () {
                            // Handle product tap
                          },
                        );
                      },
                      childCount: searchResults.length,
                    ),
                  ),
        ],
      ),
    );
  }
}




