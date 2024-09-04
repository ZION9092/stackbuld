import 'package:catalog/Screens/cart_page.dart';
import 'package:catalog/Screens/search_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../widgets/product_card.dart';
import '../widgets/carousel_slider.dart';
import '../models/product.dart';
import '../controllers/cart_controller.dart';
import 'favorites_page.dart';
import 'product_details_page.dart';
import 'profile_page.dart';
import '../controllers/favorites_controller.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key}) {
    Get.put(FavoritesController()); 
    Get.put(CartController()); 
  }

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  final List<Product> products = [
    Product(
        imageAsset: 'assets/images/bag5.jpg',
        title: 'USB Travel BackPack',
        price: 8.99,
        description:
            'Smart USB School Travel Backpack - Burgundy'),
    Product(
        imageAsset: 'assets/images/bag6.jpg',
        title: 'Sky Bag',
        price: 12.00,
        description:
            "NOBLEMAN Men's Backpack, Laptop Backpack, Waterproof travel Backpack, 15_6 Inch Laptop Backpack, Daypack, carry on backpack with USB (Beige)"),
    Product(
        imageAsset: 'assets/images/bag7.jpg',
        title: 'WaterProof Shoulder Bag',
        price: 15.50,
        description:"Multifunctional Large-capacity Waterproof Travel Shoulder Bag - Style1"),
    Product(
        imageAsset: 'assets/images/bag8.jpg',
        title: "Female's simple BagPacks",
        price: 15.50,
        description: "Men's High Sense College Female Simple Computer Backpacks - Gray"
        ),
    Product(
        imageAsset: 'assets/images/bag9.jpg',
        title: 'Denim',
        price: 15.50,
        description: "Men's High Sense College Female Simple Computer Backpacks - Gray"
        ),
    Product(
        imageAsset: 'assets/images/bag10.jpg',
        title: 'Leather BackPack',
        price: 15.50,
        description: "Samsonite Classic Leather Backpack"
        ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index); 
  }

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find(); 

    return Container(
      color: Colors.blue.shade900,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Catalog App',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: Colors.white,
            )
            ),
            backgroundColor: Colors.blue.shade900,
          ),
          backgroundColor: Colors.blue.shade900,
          body: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: [
              _buildHomePage(cartController),
              const SearchPage(),
              CartPage(),
              FavoritesPage(),
              const ProfilePage(),
              
              
            ],
          ),
          bottomNavigationBar: SnakeNavigationBar.color(
            snakeShape: SnakeShape.rectangle,
            items: const [
              BottomNavigationBarItem(icon: Icon(Iconsax.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Iconsax.search_favorite), label: 'Search'),
              BottomNavigationBarItem(icon: Icon(Iconsax.shopping_cart), label: 'Cart'),
              BottomNavigationBarItem(icon: Icon(Iconsax.heart), label: 'Favorites'),
              BottomNavigationBarItem(icon: Icon(Iconsax.user), label: 'Profile'),
            ],
            currentIndex: _selectedIndex,
            backgroundColor: Colors.white,
            snakeViewColor: Colors.blue.shade900,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.blue.shade900,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }

  Widget _buildHomePage(CartController cartController) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 270.0,
          backgroundColor: Colors.blue.shade900,
          flexibleSpace: FlexibleSpaceBar(
            background: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello Zion,",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(15),
                  const CarouselSliderWidget(),
                ],
              ),
            ),
          ),
        ),
        // SliverToBoxAdapter(
        //   child: Padding(
        //     padding: const EdgeInsets.all(12.0),
        //     child: Text(
        //       'Catalog App',
        //       style: Theme.of(context).textTheme.displayLarge!.copyWith(
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(14.0),
            child: Text(
              'Popular Bags',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(() => ProductDetailPage(
                          product: product,
                          cartController: cartController,
                        ));
                  },
                  child: ProductCard(product: product),
                );
              },
              childCount: products.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
          ),
        ),
      ],
    );
  }
}

